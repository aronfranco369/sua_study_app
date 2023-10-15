import 'package:study_app/mindex.dart';

class MPOurChoicesScreen extends StatefulWidget {
  const MPOurChoicesScreen({super.key});

  @override
  MPOurChoicesScreenState createState() => MPOurChoicesScreenState();
}

class MPOurChoicesScreenState extends State<MPOurChoicesScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<MusicModel> trendList1 = getTrendList1();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu, color: white),
        ),
        backgroundColor: mpAppBackGroundColor,
        bottom: TabBar(
          unselectedLabelColor: white.withOpacity(0.7),
          labelColor: white,
          tabs: const [
            Tab(child: Text('Trend')),
            Tab(child: Text('Recommended')),
          ],
          controller: _tabController,
          indicatorColor: mpAppButtonColor,
          indicatorWeight: 3,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        title: searchAlbumTextFiled(context),
        actions: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 16),
            decoration: boxDecorationWithShadow(
              boxShape: BoxShape.circle,
              decorationImage: DecorationImage(image: Image.network(mpImages_13).image, fit: BoxFit.cover),
            ),
          )
        ],
      ),
      drawer: const DrawerScreen(),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Our Choices For You", style: boldTextStyle(color: white)).paddingOnly(left: 16, top: 16),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    itemCount: trendList1.length,
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      MusicModel data = trendList1[index];

                      return Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonCacheImageWidget(data.img, 120, width: 250, fit: BoxFit.cover).cornerRadiusWithClipRRect(12),
                            8.height,
                            Text(data.title!, style: boldTextStyle(color: white)),
                            4.height,
                            Text(data.subtitle!, style: primaryTextStyle(color: white.withOpacity(0.5), size: 14)),
                          ],
                        ),
                      ).onTap(() {
                        MPNowPlayingScreen(data: data).launch(context);
                      });
                    },
                  ),
                ),
                Divider(color: white.withOpacity(0.1)),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Radio Station', style: boldTextStyle(color: white.withOpacity(0.8))),
                    Text('View All', style: secondaryTextStyle(color: mpAppButtonColor)).onTap(() {
                      const MPSongsScreen().launch(context);
                    }),
                  ],
                ).paddingOnly(left: 16, right: 16),
                ListView.separated(
                  itemCount: trendList1.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.white.withOpacity(0.1), indent: 70),
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    MusicModel data = trendList1[index];

                    return Container(
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          commonCacheImageWidget(data.img, 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                          16.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.title!, style: boldTextStyle(color: white)),
                              4.height,
                              Text(data.subtitle!, style: primaryTextStyle(color: white.withOpacity(0.5), size: 14)),
                            ],
                          ).expand(),
                          const Icon(Icons.play_circle_outline, color: mpAppButtonColor),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: ListView.separated(
              itemCount: trendList1.length,
              separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.white.withOpacity(0.1), indent: 70),
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                MusicModel data = trendList1[index];

                return Container(
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      commonCacheImageWidget(data.img, 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.title!, style: boldTextStyle(color: white)),
                          4.height,
                          Text(data.subtitle!, style: primaryTextStyle(color: white.withOpacity(0.5), size: 14)),
                        ],
                      ).expand(),
                      const Icon(Icons.play_circle_outline, color: mpAppButtonColor),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(height: 70, child: playMusicWidget(context)),
    );
  }
}
