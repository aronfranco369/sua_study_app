import 'package:study_app/mindex.dart';
import 'Lipsum.dart' as lipsum;

class MPNewsDetailScreen extends StatefulWidget {
  const MPNewsDetailScreen({super.key});

  @override
  MPNewsDetailScreenState createState() => MPNewsDetailScreenState();
}

class MPNewsDetailScreenState extends State<MPNewsDetailScreen> {
  bool _alreadySaved = false;

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
        title: Text('News Detail', style: boldTextStyle(color: white.withOpacity(0.9), size: 18)),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: white.withOpacity(0.9)),
        actions: [
          searchIconWidget(onPressed: () {
            const MPSearchScreen().launch(context);
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonCacheImageWidget(mpImages_11, 240, width: context.width(), fit: BoxFit.cover),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lipsum.createWord(numWords: 4), style: boldTextStyle(color: white.withOpacity(0.9))),
                    Icon(
                      _alreadySaved ? Icons.favorite_border : Icons.favorite_border,
                      color: _alreadySaved ? mpAppButtonColor.withOpacity(0.5) : mpAppButtonColor,
                    ).onTap(() {
                      setState(() {
                        _alreadySaved = !_alreadySaved;
                      });
                    }),
                  ],
                ),
                16.height,
                Text(lipsum.createParagraph(numParagraphs: 1), style: secondaryTextStyle(color: mpAppTextColor1, size: 14)),
                16.height,
                Text(lipsum.createParagraph(numParagraphs: 1), style: secondaryTextStyle(color: mpAppTextColor1, size: 14)),
                16.height,
                Text(lipsum.createParagraph(numParagraphs: 1), style: secondaryTextStyle(color: mpAppTextColor1, size: 14)),
              ],
            ).paddingAll(16),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(height: 70, child: playMusicWidget(context)),
    );
  }
}
