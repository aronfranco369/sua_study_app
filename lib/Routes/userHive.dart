// import 'package:study_app/Routes/downloadOpenButtonWidget.dart';
// import 'package:study_app/mindex.dart';
// import 'package:study_app/modules/downloadTak.dart';

// class SShIVE extends ConsumerStatefulWidget {
//   const SShIVE({super.key});

//   @override
//   _SShIVEState createState() => _SShIVEState();
// }

// class _SShIVEState extends ConsumerState<SShIVE> with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   final tabNames = [
//     'Lecture',
//     'Assignment',
//     'Practical Report',
//     'Research Paper',
//     'Simbi',
//     'Quiz',
//     'Compendium',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: tabNames.length, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Color originalTextColor = ref.watch(originalColorProvider);
//     final module = ref.read(signupDataProvider.notifier).getModule();
//     final path = ref.read(signupDataProvider.notifier).getiGlobalPath();
//     final studyMaterialOptions = ref.read(studyMaterialTypeProvider);
//     final downloadedFiles = ref.read(signupDataProvider.notifier).getDownloadedDocuments();
//     final doc = ref.watch(downloadTaskProvider.notifier).getofflineDocs() as List<dynamic>;

//     return DefaultTabController(
//       length: studyMaterialOptions.length,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Study Materials'),
//         ),
//         body: Column(
//           children: [
//             Container(
//               color: Colors.black,
//               child: TabBar(
//                 controller: _tabController,
//                 isScrollable: true,
//                 labelColor: Colors.white,
//                 unselectedLabelColor: Colors.grey,
//                 indicator: UnderlineTabIndicator(
//                   borderSide: BorderSide(width: 2, color: Colors.white),
//                   insets: EdgeInsets.symmetric(horizontal: 16.0),
//                 ),
//                 tabs: studyMaterialOptions.map((type) {
//                   return Tab(text: type);
//                 }).toList(),
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: studyMaterialOptions.map((type) {
//                   final documents = doc.where((document) => document['type'] == type).toList();

//                   return ListView.builder(
//                     itemCount: documents.length,
//                     itemBuilder: (context, index) {
//                       final document = documents[index];
//                       final String name = document['name'] ?? '';
//                       final String studyMaterialType = document['type'] ?? '';
//                       final String studyMaterialNumber = document['number'] ?? '';
//                       final String url = document['downloadURL'] ?? '';
//                       final basename = name.split('.').first;
//                       final ext = name.split('.').last.toUpperCase();

//                       return GestureDetector(
//                         onTap: () {
//                           if (downloadedFiles!.contains(name)) {
//                             ref.watch(downloadTaskProvider.notifier).openTask(name);
//                             // ref.watch(signupDataProvider.notifier).clearDocumentsBox();
//                           } else {
//                             // ref.watch(downloadTaskProvider.notifier).getFirebaseDocsFromHive();
//                             ref.watch(downloadTaskProvider.notifier).downloadTask(name, url);
//                             // final docs = Hive.box('retrivedDocuments');
//                             // print(documents.map((doc) => doc.data()).toList().length);
//                           }
//                         },
//                         child: Card(
//                           color: Color(0xff1b242d),
//                           elevation: 3,
//                           margin: EdgeInsets.all(2),
//                           child: Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           CustomText(
//                                             text: basename,
//                                             fontSize: 20,
//                                           ),
//                                         ],
//                                       ),
//                                       Row(
//                                         // crossAxisAlignment: CrossAxisAlignment.baseline,
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           // _buildGlowingText(studyMaterialNumber),
//                                           // // _buildGlowingText(studyMaterialType),

//                                           // _getFileIcon(ext),

//                                           CustomText(
//                                             text: studyMaterialNumber,
//                                           ),
//                                           15.width,

//                                           CustomText(
//                                             text: ext,
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                   buildDownloadButton2(name, url, ref),
//                                 ],
//                               )),
//                         ),
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget _buildGlowingText(String text) {
//   return Container(
//     decoration: const BoxDecoration(
//       boxShadow: [
//         BoxShadow(
//           color: Color.fromRGBO(107, 165, 107, 1), // Change the color to your desired glow color
//           // blurRadius: 5.0, // Adjust the blur radius for the desired glow effect
//           // spreadRadius: 1.0, // Adjust the spread radius for the desired glow effect
//         ),
//       ],
//     ),
//     child: CustomText(
//       text: text,
//       fontSize: 12,
//     ),
//   );
// }

// Widget _getFileIcon(String ext) {
//   switch (ext.toLowerCase()) {
//     case 'pdf':
//       return Icon(
//         Icons.picture_as_pdf,
//         color: Colors.red,
//         size: 15, // Customize the icon color
//       );
//     case 'docx':
//       return Icon(
//         Icons.description,
//         color: Colors.blue,
//         size: 15, // Customize the icon color
//       );
//     // Add more cases for other file types as needed
//     default:
//       return Icon(
//         Icons.insert_drive_file,
//         color: Colors.grey,
//         size: 15, // Customize the default icon color
//       );
//   }
// }
