import 'package:study_app/mindex.dart';

class MPSignInAndSignUpScreen extends StatefulWidget {
  const MPSignInAndSignUpScreen({super.key});

  @override
  MPSignInAndSignUpScreenState createState() => MPSignInAndSignUpScreenState();
}

class MPSignInAndSignUpScreenState extends State<MPSignInAndSignUpScreen> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          commonCacheImageWidget(mpImages_16, 240, width: 240, fit: BoxFit.cover).cornerRadiusWithClipRRect(120),
          70.height,
          AppButton(
            color: scaffoldDarkColor,
            width: context.width(),
            onTap: () {
              const MPTabBarSignInScreen().launch(context);
            },
            child: Text('Sign in', style: boldTextStyle(color: mpAppButtonColor)),
          ).cornerRadiusWithClipRRect(24),
          16.height,
          AppButton(
            color: mpAppButtonColor,
            width: context.width(),
            onTap: () {
              const MPTabBarSignInScreen().launch(context);
            },
            child: Text('Sign up', style: primaryTextStyle(color: Colors.white)),
          ).cornerRadiusWithClipRRect(24),
          16.height,
          Text('Terms of Service', style: primaryTextStyle(color: mpAppButtonColor, size: 14))
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
