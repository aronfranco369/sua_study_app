import 'package:study_app/mindex.dart';

class MPNewsScreen extends StatefulWidget {
  final String? name;

  const MPNewsScreen({super.key, this.name});

  @override
  MPNewsScreenState createState() => MPNewsScreenState();
}

class MPNewsScreenState extends State<MPNewsScreen> {
  List<NewsList> recentNewsList = getNewsList();

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
        backgroundColor: mpAppBackGroundColor,
        title: Text(widget.name!, style: boldTextStyle(color: white.withOpacity(0.9), size: 18)),
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: white.withOpacity(0.9)),
        actions: [
          searchIconWidget(onPressed: () {
            const MPSearchScreen().launch(context);
          }),
        ],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Trending', style: boldTextStyle(color: white.withOpacity(0.9))).paddingOnly(left: 16),
            8.height,
            SizedBox(
              height: 230,
              child: ListView.builder(
                itemCount: recentNewsList.length,
                padding: const EdgeInsets.only(left: 8, right: 8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  NewsList data = recentNewsList[index];
                  return SizedBox(
                    width: 240,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonCacheImageWidget(data.img, 150, width: 230, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                        8.height,
                        Text(data.name!, style: boldTextStyle(color: white.withOpacity(0.9))),
                        8.height,
                        Text(data.description!, maxLines: 2, overflow: TextOverflow.ellipsis, style: secondaryTextStyle(color: mpAppTextColor1)),
                      ],
                    ),
                  ).onTap(() {
                    const MPNewsDetailScreen().launch(context);
                  }, highlightColor: Colors.transparent, splashColor: Colors.transparent, hoverColor: Colors.transparent).paddingOnly(left: 8, right: 8);
                },
              ),
            ),
            8.height,
            Text('Recent News', style: boldTextStyle(color: white.withOpacity(0.9))).paddingSymmetric(horizontal: 16),
            ListView.builder(
              itemCount: recentNewsList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                NewsList data = recentNewsList[index];

                return Container(
                  color: mpAppCardColor,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonCacheImageWidget(data.img, 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.name!, style: boldTextStyle(color: white.withOpacity(0.9))),
                          4.height,
                          Text(data.description!, maxLines: 2, overflow: TextOverflow.ellipsis, style: secondaryTextStyle(color: mpAppTextColor1)),
                        ],
                      ).expand()
                    ],
                  ),
                ).onTap(() {
                  const MPNewsDetailScreen().launch(context);
                }, highlightColor: Colors.transparent, splashColor: Colors.transparent, hoverColor: Colors.transparent);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(height: 70, child: playMusicWidget(context)),
    );
  }
}
