import 'package:study_app/mindex.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/suaAdministration.jpg',
              fit: BoxFit.fill,
              height: context.height(),
              width: context.width(),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  color: scaffoldDarkColor,
                ),
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                width: context.width(),
                height: context.height() * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Lets send you a\nnew password....', style: boldTextStyle(color: white, size: 22)),
                      ],
                    ),
                    32.height,
                    AppTextField(
                      textStyle: primaryTextStyle(color: white),
                      cursorColor: white,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: buildSHInputDecoration(
                        'Email',
                      ),
                    ),
                    16.height,
                    16.height,
                    button(
                      context: context,
                      textColor: white,
                      width: context.width(),
                      text: 'Lets give you a new password',
                      onTap: () {
                        // NoteListScreen().launch(context);
                      },
                    ),
                    32.height,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
