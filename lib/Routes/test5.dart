// import 'package:study_app/mindex.dart';

// // final allStudyMaterialsHiveProvider = StateProvider((ref) => null)<Box<Map<dynamic, dynamic>>>((ref) {
// //   return Hive.box('allStudyMaterials');
// // });
// final allStudyMaterialsHiveProvider = StateProvider<Box<List<dynamic>>>((ref) {
//   return Hive.box('allStudyMaterials');
// });



// Future<void> getAllData(WidgetRef ref) async {
//   final path = ref.read(signupDataProvider.notifier).getiGlobalPath();
//   final snapshot = await FirebaseFirestore.instance.collection('$path/CODE/studyMaterials').get();

//   final List<Map<dynamic, dynamic>> allStudyMaterials = snapshot.docs.map((doc) {
//     return doc.data();
//   }).toList();

//   print(allStudyMaterials);

//   final box = ref.watch(allStudyMaterialsHiveProvider);

//   await box.clear();

// }

// // List<Map<dynamic, dynamic>>? getLectures(WidgetRef ref) {
// //   var boxes = ref.watch(allStudyMaterialsHiveProvider);
// //   List<Map<dynamic, dynamic>>? lectures = boxes.values.where((box) => box['type'] == 'Assignment').cast<Map<dynamic, dynamic>>().toList();
// //   // print(lectures);
// //   print(lectures);

// //   return lectures;
// // }

// class YourWidget extends ConsumerStatefulWidget {
//   const YourWidget({super.key});

//   @override
//   _YourWidgetState createState() => _YourWidgetState();
// }

// class _YourWidgetState extends ConsumerState<YourWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ValueListenableBuilder<Box<Map<dynamic, dynamic>>>(
//           // valueListenable: ref.read(allStudyMaterialsHiveProvider).listenable(),
//           builder: (context, box, child) {
//             List<Map<dynamic, dynamic>>? lectures = box.values.where((box) => box['type'] == 'Assignment').cast<Map<dynamic, dynamic>>().toList();
//             final documents = box.values.toList(); // Convert values to a list for easier manipulation

//             return ListView.builder(
//               itemCount: documents.length,
//               itemBuilder: (context, index) {
//                 final document = documents[index];
//                 final number = document['number'];
//                 final name = document['name'];
//                 final type = document['type'];

//                 return ListTile(
//                   title: Text('Number: $number'),
//                   subtitle: Text('Name: $name\nType: $type'),
//                   // Implement your onTap logic here
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
