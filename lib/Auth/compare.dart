// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';
// import 'package:nb_utils/nb_utils.dart';

// import 'package:uni_admin/Auth/login.dart';

// import 'package:uni_admin/Routes/1.Screen.dart';

// import 'package:uni_admin/Providers/riverpod.dart';

// import 'package:uni_admin/modules/module.dart';
// import 'package:uni_admin/modules/studyMaterial.dart';
// import 'package:uni_admin/university_data.dart';
// import 'package:uni_admin/widgets.dart';
// import 'package:uuid/uuid.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// DateTime currentDate = DateTime.now();

// DateFormat dateFormat = DateFormat('dd-MMMM-yyyy-HH:mm:ss', 'en_US');
// String formattedDate = dateFormat.format(currentDate);

// var _isLogin = true;
// bool _passenable = true;

// String? role;
// String? _phonenum;
// String? _university;
// String? _college;
// String? _course;
// String? _year;
// String? _semester;
// Map<String, dynamic>? jsonData;

// class Signup2 extends ConsumerStatefulWidget {
//   final String? email;
//   final String? password;
//   final String? phonenum;
//   final String? username;
//   const Signup2({
//     super.key,
//     required this.email,
//     required this.password,
//     required this.phonenum,
//     required this.username,
//   });

//   @override
//   _Signup2State createState() => _Signup2State();
// }

// class _Signup2State extends ConsumerState<Signup2> {
//   bool _loading = false;

//   // late String error = 'Check any fields invalid or used before';

//   final _formKey = GlobalKey<FormState>();

//   Future _createFirestorePath(BuildContext context) async {
//     final globalPath = ref.read(pathProviderString);
//     ref.watch(signupDataProvider.notifier).setGlobalPath(globalPath);

//     ref.watch(signupDataProvider.notifier).saveAdminToHive();

//     final path = ref.read(signupDataProvider.notifier).getiGlobalPath();

//     Module course = Module(
//       name: '',
//       code: '',
//       status: '',
//       credit: '',
//       instructors: [],
//       id: '',
//       path: '',
//     );

//     try {
//       CollectionReference newCollection = FirebaseFirestore.instance.collection(path!);

//       await newCollection.doc().set(course.toMap());
//     } catch (e) {
//       Fluttertoast.showToast(
//         msg: '$e',
//         toastLength: Toast.LENGTH_LONG,
//         timeInSecForIosWeb: 10,
//       );
//     }
//   }

//   Future submit(String email, String password) async {
//     final path = ref.read(signupDataProvider.notifier).getiGlobalPath();
//     if (_formKey.currentState!.validate()) {
//       try {
//         final User? user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         ))
//             .user;

//         await FirebaseFirestore.instance.collection('Ausers').doc(user!.uid).set({
//           'username': widget.username,
//           'uid': user.uid,
//           'phone': widget.phonenum,
//           'university': _university,
//           'course': _course,
//           'college': _college,
//           'year': _year,
//           'path': path,
//           'semester': _semester,
//           'email': widget.email,
//           'password': widget.password,
//           'createdAt': FieldValue.serverTimestamp(),
//         });
//       } catch (e) {
//         Fluttertoast.showToast(
//           msg: '$e.',
//           toastLength: Toast.LENGTH_LONG,
//           timeInSecForIosWeb: 34,
//         );

//         return e.toString();
//       }
//     }
//   }

//   void getSemesters(List<String> semesterOptions) async {
//     final box = Hive.box<List<String>>('semesters');
//     await box.put('semesters', semesterOptions);

//     print(box);
//   }

//   Future<void> loadJsonData() async {
//     String jsonString = await rootBundle.loadString('assets/universityDetails.json');
//     setState(() {
//       jsonData = json.decode(jsonString);
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     init();
//     loadJsonData();
//   }

//   void init() async {
//     setStatusBarColor(Colors.transparent);
//   }

//   @override
//   void setState(fn) {
//     if (mounted) super.setState(fn);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(
//     BuildContext context,
//   ) {
//     List<String> universityNames = jsonData != null ? UniversityData.getUniversityNames(jsonData!) : [];
//     List<String> collegeNames = _university != null ? UniversityData.getCollegeNames(jsonData!, _university!) : [];
//     List<String> courseNames = _university != null && _college != null ? UniversityData.getCoursesForUniversityAndCollege(jsonData!, _university!, _college!) : [];
//     List<String> yearOptions = _course != null ? UniversityData.getYearsForCourse(jsonData!, _university!, _college!, _course!) : [];
//     List<String> semesterOptions = _year != null ? UniversityData.getSemestersForYear(jsonData!, _university!, _college!, _course!, _year!) : [];
//     // ref.listen<Signup2State>(signupControllerProvider, (
//     //   (previous, state) {
//     //     if (state is SignupStateError) {
//     //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     //         content: Text(state.error),
//     //       ));
//     //     }
//     //   },
//     // ));

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Image.asset(
//               'assets/images/suaAdministration.jpg',
//               fit: BoxFit.fill,
//               height: context.height(),
//               width: context.width(),
//             ),
//             Positioned(
//               bottom: 0,
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//                   color: scaffoldDark,
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
//                 width: context.width(),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           RichTextWidget(
//                             list: [
//                               TextSpan(
//                                 text: 'Let\'s finish \n',
//                                 style: boldTextStyle(color: white, size: 20),
//                               ),
//                               TextSpan(
//                                 text: 'signing you up.....',
//                                 style: boldTextStyle(color: white, size: 20),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       16.height,
//                       DropdownButtonFormField(
//                         dropdownColor: Colors.black87,
//                         isExpanded: true,
//                         decoration: waInputDecoration(
//                           hint: "Select your university",
//                         ),
//                         value: _university,
//                         items: universityNames.map((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value, style: secondaryTextStyle(color: white)),
//                           );
//                         }).toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             ref.read(signupDataProvider.notifier).updateUniversity(value);
//                             _university = value;
//                             _college = null;
//                             _course = null;
//                             _year = null;
//                             _semester = null;
//                           });
//                         },
//                       ),
//                       16.height,
//                       DropdownButtonFormField(
//                         dropdownColor: Colors.black87,
//                         isExpanded: true,
//                         decoration: waInputDecoration(
//                           hint: "Select your college/school",
//                         ),
//                         value: _college,
//                         items: collegeNames.map((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value, style: secondaryTextStyle(color: white)),
//                           );
//                         }).toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             ref.read(signupDataProvider.notifier).updateCollege(value);
//                             _college = value;
//                             _course = null;
//                             _year = null;
//                             _semester = null;
//                           });
//                         },
//                       ),
//                       16.height,
//                       DropdownButtonFormField(
//                         dropdownColor: Colors.black87,
//                         isExpanded: true,
//                         decoration: waInputDecoration(
//                           hint: "Select your course",
//                         ),
//                         value: _course,
//                         items: courseNames.map((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value, style: secondaryTextStyle(color: white)),
//                           );
//                         }).toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             ref.read(signupDataProvider.notifier).updateCourse(value);
//                             _course = value;
//                             _year = null;
//                             _semester = null;
//                           });
//                         },
//                       ),
//                       16.height,
//                       DropdownButtonFormField(
//                         dropdownColor: Colors.black87,
//                         isExpanded: true,
//                         decoration: waInputDecoration(
//                           hint: "Select your year of study",
//                         ),
//                         value: _year,
//                         items: yearOptions.map((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value, style: secondaryTextStyle(color: white)),
//                           );
//                         }).toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             ref.read(signupDataProvider.notifier).updateYear(value);
//                             _year = value;
//                             _semester = null;
//                           });
//                         },
//                       ),
//                       16.height,
//                       DropdownButtonFormField(
//                         dropdownColor: Colors.black87,
//                         isExpanded: true,
//                         decoration: waInputDecoration(
//                           hint: "Select your semester of study",
//                         ),
//                         value: _semester,
//                         items: semesterOptions.map((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value, style: secondaryTextStyle(color: white)),
//                           );
//                         }).toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             ref.read(signupDataProvider.notifier).updateSemester(value);
//                             _semester = value;
//                           });
//                         },
//                       ),
//                       16.height,
//                       RichTextWidget(
//                         list: [
//                           TextSpan(
//                             text: 'You have agreed to our ',
//                             style: secondaryTextStyle(color: grey, size: 14),
//                           ),
//                           TextSpan(text: 'Terms of Services\n', style: boldTextStyle(color: white, size: 12)),
//                           TextSpan(
//                             text: 'when connection to sign up.',
//                             style: secondaryTextStyle(color: grey, size: 14),
//                           ),
//                         ],
//                       ),
//                       32.height,
//                       customButton(
//                         isLoading: false,
//                         context: context,
//                         textColor: white,
//                         width: context.width(),
//                         text: 'Sign Up',
//                         onTap: () {
//                           getSemesters(semesterOptions);
//                           _createFirestorePath(context);
//                           submit(widget.email!, widget.password!);
//                           NoteListScreen().launch(context);
//                         },
//                       ),
//                       32.height,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('Already have an account?', style: primaryTextStyle(color: grey)),
//                           4.width,
//                           Text('Sign In', style: primaryTextStyle(color: white)).onTap(
//                             () {
//                               Login().launch(context);
//                             },
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
