import 'package:firebase_database/firebase_database.dart';
import 'package:study_app/mindex.dart';

bool _passenable = true;

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Hive.box<String?>('path').clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                color: scaffoldDarkColor,
              ),
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              width: context.width(),
              height: context.height() * 0.55,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Welcome\nBack', style: boldTextStyle(color: white, size: 25)),
                      16.height,
                      TextFormField(
                        controller: emailController,
                        style: primaryTextStyle(color: white),
                        cursorColor: white,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: buildSHInputDecoration(
                          'Email',
                          textColor: Colors.grey,
                        ),
                        validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email",
                      ),
                      16.height,
                      TextFormField(
                        controller: passwordController,
                        style: primaryTextStyle(color: white),
                        cursorColor: white,
                        obscureText: _passenable,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: buildSHInputDecoration(
                          'Password',
                          textColor: Colors.grey,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _passenable = !_passenable;
                              });
                            },
                            child: Icon(
                              _passenable ? Icons.visibility_off : Icons.visibility,
                              color: white,
                            ),
                          ),
                        ),
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return ("Password is required for login");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Password(Min. 6 Character)");
                          }
                          return null;
                        },
                        onSaved: (value) {
                          passwordController.text = value!;
                        },
                      ),
                      16.height,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password?', style: boldTextStyle(color: white), textAlign: TextAlign.end).onTap(
                          () {
                            const ForgotPassword().launch(context);
                          },
                        ),
                      ),
                      20.height,
                      button(
                          context: context,
                          textColor: white,
                          width: context.width(),
                          text: 'Log In',
                          onTap: () {
                            login(emailController.text, passwordController.text, ref);
                          }),
                      32.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have account?', style: primaryTextStyle(color: grey)),
                          4.width,
                          Text('Get Started', style: boldTextStyle(color: white, size: 16)).onTap(
                            () {
                              const Signup1().launch(context);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> gh() async {
    final ref = FirebaseDatabase.instance.ref();

    final snapshot = await ref.child('universities/colleges/courses/years/semesters').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }

  void login(String email, String password, WidgetRef ref) async {
    if (_formKey.currentState!.validate()) {
      try {
        final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
        final user = userCredential.user;
        print(user);

        if (user != null) {
          // User is logged in successfully.
          await fetchUserData(user.uid, ref); // Fetch user's path here

          Fluttertoast.showToast(msg: 'Login Successful');

          AuthChecker().launch(context);
        }
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: e.code);
        // Handle login errors here
      }
    }
  }

  Future fetchUserData(String userUid, WidgetRef ref) async {
    // todo FETCH USER SEMESTERS
    // Here, you can implement code to fetch the user's path from Firebase or your database
    // For example, using Firebase Firestore:
    final userDoc = await FirebaseFirestore.instance.collection('QQ').doc(userUid).get();
    print(userDoc);
    if (userDoc.exists) {
      final path = userDoc.data()?['path'];
      final semesters = userDoc.data()?['semesters'];
      print(path);
      print(semesters);

      ref.watch(signupDataProvider.notifier).updateUniversity(userDoc.data()?['university']);
      ref.watch(signupDataProvider.notifier).updateCollege(userDoc.data()?['college']);
      ref.watch(signupDataProvider.notifier).updateCourse(userDoc.data()?['course']);
      ref.watch(signupDataProvider.notifier).updateYear(userDoc.data()?['year']);
      ref.watch(signupDataProvider.notifier).updateSemester(userDoc.data()?['semester']);
      ref.watch(signupDataProvider.notifier).updateUsername(userDoc.data()?['username']);
      ref.watch(signupDataProvider.notifier).updatephonenum(userDoc.data()?['phone']);
      ref.watch(signupDataProvider.notifier).updateEmail(userDoc.data()?['email']);
      ref.watch(signupDataProvider.notifier).saveStudentandPathToHive();

      await ref.watch(signupDataProvider.notifier).setGlobalPath(path);
      ref.watch(signupDataProvider.notifier).getSemesters(semesters);
    } else {
      print('failed');
      // Handle the case where the user document doesn't exist or doesn't have a 'path' field
      return 'failed'; // Replace with your default path or error handling logic
    }
  }
}
