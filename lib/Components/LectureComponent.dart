import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:study_app/Components/comments.dart';
import 'package:study_app/Components/simbiComponent.dart';
import 'package:study_app/Providers/iconProvider.dart';
import 'package:study_app/mindex.dart';

class SS extends ConsumerStatefulWidget {
  const SS({super.key, required this.moduleCode});

  final String moduleCode;

  @override
  _SSState createState() => _SSState();
}

class _SSState extends ConsumerState<SS> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final tabNames = ['Lecture', 'Simbi', 'Chat', 'Assignment', 'Practical Report', 'Research Paper', 'Compendium', 'Quiz'];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabNames.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final path = ref.read(signupDataProvider.notifier).getiGlobalPath();
    final studyMaterialOptions = ref.read(studyMaterialTypeProvider);
    final downloadedFiles = ref.watch(downloadTaskProvider.notifier).getDownloadedDocMaps();

    DownloadTaskk downloadTaskk = ref.watch(downloadTaskProvider);
    List<String> activeDocuments = downloadTaskk.downloadTasks;
    double progress = downloadTaskk.progress;

    return SafeArea(
      child: Scaffold(
          backgroundColor: mpAppBackGroundColor,
          key: _scaffoldKey,
          drawer: const DrawerScreen(),
          appBar: CustomAppBar(
            tabBar: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: mpAppTextColor,
              indicatorColor: mpAppButtonColor,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: studyMaterialOptions.map((type) {
                return Tab(text: type);
              }).toList(),
            ),
            scaffoldKey: _scaffoldKey,
          ),
          body: DefaultTabController(
            length: studyMaterialOptions.length,
            child: TabBarView(
              controller: _tabController,
              children: studyMaterialOptions.map((type) {
                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('$path/${widget.moduleCode}/studyMaterials').where('type', isEqualTo: type).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error.toString()}'));
                    } else if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (!snapshot.hasData) {
                      final List<Map<String, dynamic>> rawData = snapshot.data!.docs.map((doc) {
                        return doc.data() as Map<String, dynamic>;
                      }).toList();
                      print(rawData);

                      // ref.watch(rawDataProvider.notifier).state = rawData;

                      if (type == 'Lecture') {
                        final List<StudyMaterial> docs = rawData.map((data) {
                          return StudyMaterial(
                            number: data['number'],
                            id: data['id'],
                            name: data['name'],
                            downloadURL: data['downloadURL'],
                            type: data['type'],
                          );
                        }).toList();
                        return ListView.separated(
                          separatorBuilder: (BuildContext context, int index) => Divider(
                            color: Colors.white.withOpacity(0.2),

                            // thickness: 100,
                          ),
                          itemCount: docs.length,
                          itemBuilder: (context, index) {
                            final doc = docs[index];
                            final basename = doc.name.split('.').first;
                            final ext = doc.name.split('.').last;
                            final iconPath = ref.watch(iconPathProvider(ext));

                            // // bool isDownloaded = false;
                            bool isDownloaded = downloadedFiles?.any((downloadedFile) {
                                  return downloadedFile['downloadURL'] == doc.downloadURL;
                                }) ??
                                false;

                            return GestureDetector(
                              onTap: () {
                                if (downloadedFiles!.contains(doc.downloadURL)) {
                                  // ref.watch(downloadTaskProvider.notifier).openTask(rawData, doc.downloadURL);
                                } else {}
                              },
                              child: CustomCard(Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CustomText(
                                                text: basename,
                                                fontSize: 20,
                                              ),
                                            ],
                                          ),
                                          8.height,
                                          Row(
                                            // crossAxisAlignment: CrossAxisAlignment.baseline,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                text: doc.number,
                                              ),
                                              15.width,
                                              Image.asset(
                                                iconPath,
                                                height: 15,
                                                width: 15,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      // buildDownloadButton2(name, url, ref),

                                      isDownloaded
                                          ? GestureDetector(
                                              onTap: () {
                                                ref.watch(downloadTaskProvider.notifier).openTask(rawData, doc.downloadURL);
                                              },
                                              child: const Icon(
                                                Icons.file_download_done,
                                                color: greenColor,
                                                size: 30,
                                              ),
                                            )
                                          : !activeDocuments.contains(doc.downloadURL)
                                              ? GestureDetector(
                                                  onTap: () {
                                                    ref.watch(downloadTaskProvider.notifier).downloadTask(rawData, doc.downloadURL);
                                                  },
                                                  child: const Icon(
                                                    Icons.file_download_rounded,
                                                    color: white,
                                                    size: 30,
                                                  ),
                                                )
                                              : activeDocuments.contains(doc.downloadURL) && progress <= 0
                                                  ? const CircularProgressIndicator()
                                                  : CircularPercentIndicator(
                                                      radius: 20.0,
                                                      lineWidth: 5.0,
                                                      percent: progress,
                                                      center: Text(
                                                        progress > 0 ? '${(progress * 100).toStringAsFixed(0)}%' : 'Starting...',
                                                        style: const TextStyle(fontSize: 10),
                                                      ),
                                                      circularStrokeCap: CircularStrokeCap.round,
                                                      progressColor: Colors.white,
                                                      // animation: true,
                                                    )
                                    ],
                                  ))),
                            );
                          },
                        );
                      }
                    }
                    return type == 'Simbi'
                        ? SimbiComponent(documents: snapshot.data!.docs)
                        : type == 'Chat'
                            ? const Chat()
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: greenColor,
                                ),
                              );
                  },
                );
              }).toList(),
            ),
          )),
    );
  }
}

class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard(
    this.child, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: mpAppBackGroundColor2,
      elevation: 5,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: child,
    );
  }
}
