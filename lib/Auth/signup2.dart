import 'package:intl/intl.dart';
import 'package:study_app/Auth/dataa.dart';

import 'package:study_app/mindex.dart';

DateTime currentDate = DateTime.now();

DateFormat dateFormat = DateFormat('dd-MMMM-yyyy-HH:mm:ss', 'en_US');
String formattedDate = dateFormat.format(currentDate);

var _isLogin = true;
bool _passenable = true;
bool _isLoading = false;

String? _phonenum;
String? _university;
String? _college;
String? _course;
String? _year;
String? _semester;
List<String>? _semesters;

class Signup2 extends ConsumerStatefulWidget {
  final String? email;
  final String? password;
  final String? phonenum;
  final String? username;
  final String? regNo;

  const Signup2({
    super.key,
    required this.email,
    required this.password,
    required this.phonenum,
    required this.username,
    required this.regNo,
  });

  @override
  _Signup2State createState() => _Signup2State();
}

class _Signup2State extends ConsumerState<Signup2> {
  bool _loading = false;

  // late String error = 'Check any fields invalid or used before';

  final _formKey = GlobalKey<FormState>();

  Future submit(String email, String password) async {
    setState(() {
      _loading = true;
    });
    await ref.watch(signupDataProvider.notifier).saveStudentandPathToHive();
    final path = ref.watch(signupDataProvider.notifier).getiGlobalPath();
    if (_formKey.currentState!.validate()) {
      try {
        final User? user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ))
            .user;

        await FirebaseFirestore.instance.collection('AA').doc(user!.uid).set({
          'uid': user.uid,
          'phone': widget.phonenum,
          'regNo': widget.regNo,
          'username': widget.username,
          'college': _college,
          'path': path,
          'university': _university,
          'course': _course,
          'year': _year,
          'semesters': _semesters as List<String>,
          'semester': _semester,
          'email': widget.email,
          'password': widget.password,
          'createdAt': FieldValue.serverTimestamp(),
        });

        AuthChecker().launch(context);
      } on FirebaseException catch (e) {
        setState(() {
          _loading = false;
        });

        Fluttertoast.showToast(
          fontSize: 17,
          gravity: ToastGravity.CENTER_LEFT,
          backgroundColor: redColor,
          msg: '${e.message}',
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 34,
        );

        return e.toString();
      }
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // ref.read(jsonDataProvider);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    Box box = ref.watch(unidatabaseHiveProvider);
    Map<dynamic, dynamic> data = box.get('databaseUniversityDetails');

    List<String> universityNames = UniversityData.getUniversityNames(data);
    List<String> collegeNames = _university != null ? UniversityData.getCollegeNames(data, _university!) : [];
    List<String> courseNames = _university != null && _college != null ? UniversityData.getCoursesForUniversityAndCollege(data, _university!, _college!) : [];
    List<String> yearOptions = _course != null ? UniversityData.getYearsForCourse(data, _university!, _college!, _course!) : [];
    List<String> semesterOptions = _year != null ? UniversityData.getSemestersForYear(data, _university!, _college!, _course!, _year!) : [];
    setState(() {
      _semesters = semesterOptions;
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/suaAdministration.jpg',
              fit: BoxFit.fill,
              height: context.height(),
              width: context.width(),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  color: scaffoldDark,
                ),
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                width: context.width(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichTextWidget(
                            list: [
                              TextSpan(
                                text: 'Let\'s finish \n',
                                style: boldTextStyle(color: white, size: 20),
                              ),
                              TextSpan(
                                text: 'signing you up.....',
                                style: boldTextStyle(color: white, size: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                      16.height,
                      DropdownButtonFormField(
                        dropdownColor: Colors.black87,
                        isExpanded: true,
                        decoration: waInputDecoration(
                          hint: "Select your university",
                        ),
                        value: _university,
                        items: universityNames.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Tooltip(
                              message: value, // Display full text on hover
                              child: Text(
                                value,
                                style: secondaryTextStyle(color: white),
                                overflow: TextOverflow.ellipsis, // Truncate long text with ellipsis
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            ref.read(signupDataProvider.notifier).updateUniversity(value);
                            _university = value;
                            _college = null;
                            _course = null;
                            _year = null;
                            _semester = null;
                          });
                        },
                      ),
                      16.height,
                      DropdownButtonFormField(
                        // menuMaxHeight: 50,
                        // itemHeight: 100,
                        dropdownColor: Colors.black87,
                        isExpanded: true,
                        decoration: waInputDecoration(
                          hint: "Select your college/school",
                        ),
                        value: _college,
                        items: collegeNames.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                                height: 50,
                                child: Text(
                                  value,
                                  style: secondaryTextStyle(color: white),
                                )),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            ref.read(signupDataProvider.notifier).updateCollege(value);
                            _college = value;
                            _course = null;
                            _year = null;
                            _semester = null;
                          });
                        },
                      ),
                      16.height,
                      DropdownButtonFormField(
                        dropdownColor: Colors.black87,
                        isExpanded: true,
                        decoration: waInputDecoration(
                          hint: "Select your course",
                        ),
                        value: _course,
                        items: courseNames.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: secondaryTextStyle(color: white)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            ref.read(signupDataProvider.notifier).updateCourse(value);
                            _course = value;
                            _year = null;
                            _semester = null;
                          });
                        },
                      ),
                      16.height,
                      DropdownButtonFormField(
                        dropdownColor: Colors.black87,
                        isExpanded: true,
                        decoration: waInputDecoration(
                          hint: "Select your year of study",
                        ),
                        value: _year,
                        items: yearOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: secondaryTextStyle(color: white)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            ref.read(signupDataProvider.notifier).updateYear(value);
                            _year = value;
                            _semester = null;
                          });
                        },
                      ),
                      16.height,
                      DropdownButtonFormField(
                        dropdownColor: Colors.black87,
                        isExpanded: true,
                        decoration: waInputDecoration(
                          hint: "Select your semester of study",
                        ),
                        value: _semester,
                        items: semesterOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: secondaryTextStyle(color: white)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            ref.read(signupDataProvider.notifier).updateSemester(value);
                            _semester = value;
                          });
                        },
                      ),
                      16.height,
                      RichTextWidget(
                        list: [
                          TextSpan(
                            text: 'You have agreed to our ',
                            style: secondaryTextStyle(color: grey, size: 14),
                          ),
                          TextSpan(text: 'Terms of Services\n', style: boldTextStyle(color: white, size: 12)),
                          TextSpan(
                            text: 'when connection to sign up.',
                            style: secondaryTextStyle(color: grey, size: 14),
                          ),
                        ],
                      ),
                      32.height,
                      customButton(
                        isLoading: _loading,
                        context: context,
                        textColor: white,
                        width: context.width(),
                        text: 'Sign Up',
                        onTap: () {
                          setState(() {
                            _isLoading = true;
                          });
                          ref.watch(signupDataProvider.notifier).getSemesters(semesterOptions);

                          submit(widget.email!, widget.password!);
                          setState(() {
                            _isLoading = false;
                          });
                          // NoteListScreen().launch(context);
                        },
                      ),
                      32.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?', style: primaryTextStyle(color: grey)),
                          4.width,
                          Text('Sign In', style: primaryTextStyle(color: white)).onTap(
                            () {
                              const Login().launch(context);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
