import 'package:study_app/mindex.dart';

class MPPopularSongScreen extends StatefulWidget {
  final MusicModel? data;

  const MPPopularSongScreen({super.key, this.data});

  static String tag = '/MPSongTypeScreen';

  @override
  MPPopularSongScreenState createState() => MPPopularSongScreenState();
}

class MPPopularSongScreenState extends State<MPPopularSongScreen> {
  List<MusicModel> songTypeList = getSongTypeList();

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
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(widget.data!.title!, style: boldTextStyle(color: Colors.white)),
        backgroundColor: mpAppBackGroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Albums', style: boldTextStyle(color: Colors.white)),
                Text('View All', style: primaryTextStyle(color: mpAppButtonColor)).paddingOnly(right: 8).onTap(() {
                  const MPSongsScreen().launch(context);
                }),
              ],
            ).paddingOnly(left: 16, right: 16, top: 8),
            10.height,
            Wrap(
              runAlignment: WrapAlignment.spaceBetween,
              alignment: WrapAlignment.center,
              spacing: 16.0,
              children: List.generate(
                songTypeList.length,
                (index) {
                  MusicModel data = songTypeList[index];

                  return SizedBox(
                    width: context.width() * 0.43,
                    child: Column(
                      children: [
                        commonCacheImageWidget(data.img, 160, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
                        4.height,
                        Text(data.title!, maxLines: 1, overflow: TextOverflow.ellipsis, style: boldTextStyle(color: white.withOpacity(0.9))),
                        4.height,
                        Text(data.subtitle!, maxLines: 2, overflow: TextOverflow.ellipsis, style: secondaryTextStyle(color: mpAppTextColor1)),
                        10.height,
                      ],
                    ).onTap(() {
                      MPNowPlayingScreen(data: data).launch(context);
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
