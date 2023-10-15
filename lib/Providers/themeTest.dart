// import 'package:adaptive_theme/adaptive_theme.dart';
// import 'package:study_app/Providers/themeProvider.dart';
// import 'package:study_app/mindex.dart';

// class ThemeTest extends StatelessWidget {
//   const ThemeTest({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (context, ref, child) {
//         return AdaptiveTheme(

//           child: Scaffold(
          
//             appBar: AppBar(
//               title: const Text('goos'),
//             ),
//             body: ListView.builder(
//               itemCount: 10,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(leading: Text('Hello World'));
//               },
//             ),
//             floatingActionButton: FloatingActionButton(onPressed: () {
//               AdaptiveTheme.of(context).toggleThemeMode();
//               // ref.watch(themeDataProvider.notifier).setDark(context);
//             }),
//           ),
//         );
//       },
//     );
//   }
// }
