//import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:study_app/mindex.dart';

class MPSongsScreen extends StatefulWidget {
  const MPSongsScreen({super.key});

  @override
  MPSongsScreenState createState() => MPSongsScreenState();
}

class MPSongsScreenState extends State<MPSongsScreen> {
  List<MusicModel> disCoverList = getDisCoverList();
  List<MusicModel> songsList = getSongsList();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mpAppBackGroundColor,
        key: _scaffoldKey,
        drawer: const DrawerScreen(),
        body: Consumer(builder: (context, ref, child) {
          final path = ref.read(signupDataProvider.notifier).getiGlobalPath();

          //  StreamBuilder(
          //   stream: FirebaseFirestore.instance.collection(path!).where('code', isNotEqualTo: '').snapshots(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Shimmer.fromColors(
          //         baseColor: Colors.grey[300]!,
          //         highlightColor: Colors.grey[100]!,
          //         child: Container(),
          //       );
          //     } else if (snapshot.hasError) {
          //       return Text('Error: ${snapshot.error}');
          //     } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          //       return const Center(child: Text('Sorry there is no any module added in this course'));
          //     } else {
          //       // Assuming 'Note' is your data model.
          //       final List<Module> modules = snapshot.data!.docs.map((doc) {
          //         final data = doc.data();

          //         return Module(
          //           name: data['name'],
          //           id: data['id'],
          //           code: data['code'],
          //           credit: data['credit'],
          //           status: data['status'],
          //           instructors: data['instructors'],
          //           path: data['path'],
          //         );
          //       }).toList();)

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.separated(
                  itemCount: songsList.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(
                    color: Colors.white.withOpacity(0.6),

                    height: 10,
                    // thickness: 100,
                  ),
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    MusicModel data = songsList[index];

                    return Container(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'FT 307',
                                  fontSize: 22,
                                ),
                                CustomText(text: 'Core'),
                              ],
                            ),
                            5.height,
                            const CustomText(text: 'Technology of Spices'),
                            5.height,
                            Row(
                              children: [
                                const CustomText(text: 'Credits : 15'),
                                5.width,
                                const CustomText(text: '| '),
                                const CustomText(text: 'Prof.Juma'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }));
  }
}

// class MPSongsScreen extends StatefulWidget {
//   const MPSongsScreen({super.key});

//   @override
//   MPSongsScreenState createState() => MPSongsScreenState();
// }

// class MPSongsScreenState extends State<MPSongsScreen> {
//   List<MusicModel> disCoverList = getDisCoverList();
//   List<MusicModel> songsList = getSongsList();

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//     init();
//   }

//   Future<void> init() async {
//     //
//   }

//   @override
//   void setState(fn) {
//     if (mounted) super.setState(fn);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: mpAppBackGroundColor,
//       key: _scaffoldKey,
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             _scaffoldKey.currentState!.openDrawer();
//           },
//           icon: Icon(Icons.menu, color: white.withOpacity(0.9)),
//         ),
//         backgroundColor: mpAppBackGroundColor,
//         elevation: 0.0,
//         title: Text("Modules", style: boldTextStyle(color: Colors.white.withOpacity(0.9))),
//         actions: [
//           searchIconWidget(onPressed: () {
//             const MPSearchScreen().launch(context);
//           }),
//         ],
//       ),
//       drawer: const DrawerScreen(),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ListView.separated(
//                   itemCount: songsList.length,
//                   separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.white.withOpacity(0.1), indent: 50),
//                   physics: const NeverScrollableScrollPhysics(),
//                   padding: const EdgeInsets.all(8),
//                   shrinkWrap: true,
//                   itemBuilder: (BuildContext context, int index) {
//                     MusicModel data = songsList[index];

//                     return Container(
//                       margin: const EdgeInsets.all(8),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               CustomText(
//                                 text: 'module',
//                                 fontSize: 24,
//                               ),
//                               CustomText(text: 'status'),
//                             ],
//                           ),
//                           5.height,
//                           CustomText(text: 'name'),
//                           5.height,
//                           Row(
//                             children: [
//                               CustomText(text: 'Credits : ${'module.credit'}'),
//                               5.width,
//                               const CustomText(text: '| '),
//                               CustomText(text: '${'instructor[' ']'}.${'instructor[' ']'}'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//           // Positioned(bottom: 0, left: 0, right: 0, child: playMusicWidget(context)),
//         ],
//       ),
//     );
//   }
// }
