import 'package:study_app/mindex.dart';

class MPForgotPasswordScreen extends StatefulWidget {
  const MPForgotPasswordScreen({super.key});

  @override
  MPForgotPasswordScreenState createState() => MPForgotPasswordScreenState();
}

class MPForgotPasswordScreenState extends State<MPForgotPasswordScreen> {
  TextEditingController contEmailAddress = TextEditingController();
  TextEditingController contPassword = TextEditingController();
  TextEditingController contConfirmPassword = TextEditingController();

  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeConfirmPassword = FocusNode();

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
        elevation: 0.0,
        backgroundColor: mpAppBackGroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined, color: white),
          onPressed: () {
            finish(context);
          },
        ),
        centerTitle: true,
        title: Text('Forgot password', style: boldTextStyle(color: white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextField(
              controller: contEmailAddress,
              textStyle: primaryTextStyle(color: white),
              nextFocus: focusNodePassword,
              textFieldType: TextFieldType.EMAIL,
              cursorColor: Colors.white,
              decoration: buildInputDecoration('Your Email Address'),
            ),
            20.height,
            AppTextField(
              controller: contPassword,
              textStyle: primaryTextStyle(color: white),
              focus: focusNodePassword,
              nextFocus: focusNodeConfirmPassword,
              textFieldType: TextFieldType.PASSWORD,
              cursorColor: Colors.white,
              suffixIconColor: mpAppButtonColor,
              decoration: buildInputDecoration('Your New password'),
            ),
            20.height,
            AppTextField(
              controller: contConfirmPassword,
              textStyle: primaryTextStyle(color: white),
              focus: focusNodeConfirmPassword,
              textFieldType: TextFieldType.PASSWORD,
              cursorColor: Colors.white,
              suffixIconColor: mpAppButtonColor,
              decoration: buildInputDecoration('Confirm Password'),
            ),
            50.height,
            AppButton(
              color: mpAppButtonColor,
              width: context.width(),
              onTap: () {
                const MPTabBarSignInScreen().launch(context);
              },
              child: Text('Reset My Password', style: primaryTextStyle(color: Colors.white)),
            ).cornerRadiusWithClipRRect(24),
          ],
        ).paddingOnly(top: 100, left: 16, right: 16, bottom: 16),
      ),
    );
  }
}
