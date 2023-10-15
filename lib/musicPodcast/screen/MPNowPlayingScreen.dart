import 'package:study_app/mindex.dart';

class MPNowPlayingScreen extends StatefulWidget {
  final MusicModel? data;

  const MPNowPlayingScreen({super.key, this.data});

  static String tag = '/MPNowPlayingScreen';

  @override
  MPNowPlayingScreenState createState() => MPNowPlayingScreenState();
}

class MPNowPlayingScreenState extends State<MPNowPlayingScreen> {
  double _currentSliderValue = 60;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<MusicModel> list = getAlbumGridList();

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
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu, color: white.withOpacity(0.9)),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        backgroundColor: mpAppBackGroundColor,
        elevation: 0.0,
        title: Text("Now Playing", style: boldTextStyle(color: Colors.white.withOpacity(0.9))),
        actions: [
          searchIconWidget(onPressed: () {
            const MPSearchScreen().launch(context);
          }),
        ],
      ),
      drawer: const DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.add_circle_outline_rounded, size: 20, color: Colors.white).onTap(() {
                  showBottom(context);
                }, highlightColor: Colors.transparent, splashColor: Colors.transparent, hoverColor: Colors.transparent),
                const Icon(Icons.send, color: Colors.white, size: 20).onTap(() {
                  toasty(context, "send", bgColor: Colors.white, textColor: Colors.black);
                }, highlightColor: Colors.transparent, splashColor: Colors.transparent, hoverColor: Colors.transparent),
              ],
            ).paddingOnly(left: 16, right: 16),
            32.height,
            commonCacheImageWidget(widget.data!.img, 360, width: 240, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
            16.height,
            Text(widget.data!.title!, style: boldTextStyle(color: Colors.white)),
            8.height,
            Text(widget.data!.subtitle!, style: secondaryTextStyle(color: Colors.white.withOpacity(0.5))),
            32.height,
            Slider(
              inactiveColor: Colors.white,
              activeColor: mpAppButtonColor,
              value: _currentSliderValue,
              min: 0,
              max: 100,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            22.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.arrow_back_ios, size: 25, color: Colors.white).onTap(() {
                  toasty(context, 'Previous', bgColor: Colors.white, textColor: Colors.black);
                }, highlightColor: Colors.transparent, splashColor: Colors.transparent, hoverColor: Colors.transparent),
                const Icon(Icons.play_circle_outline, color: mpAppButtonColor, size: 30).onTap(() {
                  toasty(context, 'Play', bgColor: Colors.white, textColor: Colors.black);
                }, highlightColor: Colors.transparent, splashColor: Colors.transparent, hoverColor: Colors.transparent),
                const Icon(Icons.arrow_forward_ios_sharp, color: Colors.white, size: 25).onTap(() {
                  toasty(context, 'Next', bgColor: Colors.white, textColor: Colors.black);
                }, highlightColor: Colors.transparent, splashColor: Colors.transparent, hoverColor: Colors.transparent),
              ],
            ),
          ],
        ).paddingOnly(left: 16, right: 16, bottom: 16),
      ),
    );
  }

  Future<void> showBottom(BuildContext context) async {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(''),
                  Text('Save Here', style: boldTextStyle()),
                  const Icon(Icons.add, color: Colors.grey).paddingOnly(right: 8),
                ],
              ),
              8.height,
              const Divider(thickness: 1),
              8.height,
              SizedBox(
                height: 130,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    MusicModel data = list[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonCacheImageWidget(data.img, 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                        4.height,
                        Text(data.title!, style: secondaryTextStyle(size: 13, color: Colors.grey), maxLines: 1),
                      ],
                    ).paddingOnly(left: 8, right: 8);
                  },
                ),
              ),
              const Divider(thickness: 1),
              4.height,
              Text('Cancel', style: secondaryTextStyle(size: 13, color: Colors.grey)).center().onTap(() {
                finish(context);
              })
            ],
          ),
        );
      },
    );
  }
}
