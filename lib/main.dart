import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:study_app/Auth/phoneVerification.dart';
import 'package:study_app/Auth/si2.dart';
import 'package:study_app/Providers/nbUtilis.dart';
import 'package:study_app/Providers/themeProvider.dart';
import 'package:study_app/Providers/themeTest.dart';
import 'package:study_app/Routes/test5.dart';

import 'mindex.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();

  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  // Hive.registerAdapter(BoxAdapter());
  Hive.registerAdapter(StudentAdapter());
  Hive.registerAdapter(StudyMaterialAdapter());
  Hive.registerAdapter(ModuleAdapter());

  await Hive.openBox<List<String>>('downloadedDocuments');
  await Hive.openBox<List<String>>('SuaCourseDetails');
  await Hive.openBox<List<dynamic>>('downloadedDocMaps');
  await Hive.openBox<List<dynamic>>('recentDocMaps');
  await Hive.openBox<List<dynamic>>('starredDocMaps');
  await Hive.openBox<Map<dynamic, dynamic>>('starredDocMapss');
  await Hive.openBox<List<dynamic>>('allStudyMaterials');
  await Hive.openBox<Map<dynamic, dynamic>>('rrecentDocMaps');
  await Hive.openBox<Map<dynamic, dynamic>>('databaseUniversityDetails');

  // await Hive.openBox<List<QueryDocumentSnapshot<Object?>>>('fetchedDocuments');
  // await Hive.openBox<User>('adminDemo');
  await Hive.openBox<List<Map<String, dynamic>>>('retrievedDocuments');
  await Hive.openBox<dynamic>('offlineDocs');

  await Hive.openBox<Student>('student');
  await Hive.openBox<bool?>('downloadStatusBox');
  // await Hive.openBox<Map<String, bool>>('downloadedDocuments');
  await Hive.openBox<String?>('path');
  await Hive.openBox<Module>('kModule');
  await Hive.openBox<List<dynamic>>('semesters');

  runApp(
    const ProviderScope(
      child: OverlaySupport.global(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: AuthChecker(),
    );
  }
}




// MaterialApp(
//       title: 'Flutter Demo',

//       theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),

//       darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),

//       themeMode: ThemeMode.dark,
//       home: ThemeTest(),
//       // home: StudyMaterialsGrid(),
//       // home: NoteListScreen(),
//       // home: FolderMoveScreen(),
//       // home: DocumentPage(),
//       debugShowCheckedModeBanner: false,
//     );



//  AdaptiveTheme(
//       light: FlexThemeData.light(scheme: FlexScheme.mandyRed),
//       dark: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
//       initial: AdaptiveThemeMode.light,
//       builder: (theme, darkTheme) => MaterialApp(
//           title: 'Adaptive Theme Demo',
//           theme: theme,
//           darkTheme: darkTheme,
//           home: Consumer(
//             builder: (context, ref, child) {
//               return AuthChecker();
//             },
//           )),
//     );