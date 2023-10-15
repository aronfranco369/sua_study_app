import 'dart:async';

import 'package:study_app/mindex.dart';

class MPSplashScreen extends StatefulWidget {
  static String tag = '/music_podcast';

  const MPSplashScreen({super.key});

  @override
  MPSplashScreenState createState() => MPSplashScreenState();
}

class MPSplashScreenState extends State<MPSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
    setStatusBarColor(mpAppBackGroundColor);
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));

    finish(context);
    const MPWalkThroughScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mpAppBackGroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          commonCacheImageWidget("https://i.ibb.co/4TTC8yN/logo.png", 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(100).center(),
          8.height,
          Text("Music Podcast", style: boldTextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
