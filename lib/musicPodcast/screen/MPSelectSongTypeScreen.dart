import 'package:study_app/mindex.dart';

class MPSelectSongTypeScreen extends StatefulWidget {
  const MPSelectSongTypeScreen({super.key});

  @override
  MPSelectSongTypeScreenState createState() => MPSelectSongTypeScreenState();
}

class MPSelectSongTypeScreenState extends State<MPSelectSongTypeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<MusicModel> selectedSongTypeList = getSelectedSongTypeList();

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
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu, color: white),
        ),
        backgroundColor: mpAppBackGroundColor,
        elevation: 0.0,
        title: Text('What Do You Love?', style: boldTextStyle(color: Colors.white.withOpacity(0.9))),
        actions: [
          searchIconWidget(onPressed: () {
            const MPSearchScreen().launch(context);
          }),
        ],
      ),
      drawer: const DrawerScreen(),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: selectedSongTypeList.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            MusicModel data = selectedSongTypeList[index];

            return Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  commonCacheImageWidget(
                    data.img,
                    120,
                    width: context.width(),
                    fit: BoxFit.cover,
                  ),
                  Container(color: Colors.black.withOpacity(data.isSelect ? 0.8 : 0.5), height: 120),
                  Icon(Icons.done, color: data.isSelect ? mpAppButtonColor : Colors.transparent, size: 30),
                  Text(data.title!, style: boldTextStyle(color: data.isSelect ? Colors.transparent : white.withOpacity(0.9)))
                ],
              ).cornerRadiusWithClipRRect(10),
            ).cornerRadiusWithClipRRect(10).onTap(() {
              data.isSelect = !data.isSelect;
              setState(() {});
            }, highlightColor: Colors.transparent, splashColor: Colors.transparent, hoverColor: Colors.transparent);
          },
        ),
      ),
    );
  }
}
