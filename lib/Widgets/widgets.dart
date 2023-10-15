import 'package:study_app/mindex.dart';

const scaffoldDark = Color(0xff1b242d);
const button1Color = Color(0xFF716df6);
const button2Color = Color(0xFF5753e6);

InputDecoration waInputDecoration({
  IconData? prefixIcon,
  String? hint,
  Color? bgColor,
  Color? borderColor,
  EdgeInsets? padding,
  TextStyle? hintStyle,
}) {
  return InputDecoration(
    contentPadding: padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    counter: const Offstage(),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: borderColor ?? const Color(0xFF6C56F9))),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
    ),
    fillColor: bgColor ?? const Color(0xFF6C56F9).withOpacity(0.04),
    hintText: hint,
    prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: const Color(0xFF6C56F9)) : null,
    hintStyle: hintStyle ?? secondaryTextStyle(),
    filled: true,
  );
}

class customTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const customTextField({
    super.key,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: waInputDecoration(hint: hint),
    );
  }
}

class BuildRow extends StatelessWidget {
  final String label;
  final Widget inputField;

  const BuildRow(
    this.label,
    this.inputField, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(label),
          10.width,
          const SizedBox(width: 8.0),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: inputField,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 12,
    this.fontStyle = FontStyle.normal, // Default font size is 10
    this.fontWeight = FontWeight.normal,
    this.fontFamily = 'OverpassRegular',
    // Default font size is 10

    this.color = Colors.white,
  });

  final String text;
  final double fontSize;
  final Color color;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      text,
      style: TextStyle(color: color, fontSize: fontSize, fontStyle: fontStyle, fontWeight: FontWeight.bold, fontFamily: fontFamily),
    );
  }
}

class customRow extends StatelessWidget {
  final String label;
  final Widget inputField;
  const customRow(this.label, this.inputField, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(label),
          const SizedBox(width: 8.0),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: inputField,
            ),
          ),
        ],
      ),
    );
  }
}

Widget customButton({
  double? width,
  String? text,
  Color? textColor,
  bool isLoading = false,
  Function? onTap,
  required BuildContext context,
}) {
  return Container(
    width: context.width(),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      gradient: const LinearGradient(
        colors: [button1Color, button2Color],
        begin: FractionalOffset.topLeft,
        end: FractionalOffset.centerRight,
      ),
    ),
    child: TextButton(
      onPressed: onTap as void Function()?,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Visibility(
            visible: !isLoading,
            child: Text(
              text!,
              style: boldTextStyle(color: textColor),
            ),
          ),
          Visibility(
            visible: isLoading,
            child: const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    ),
  );
}

InputDecoration buildSHInputDecoration(
  String name, {
  Widget? prefixIcon,
  Widget? suffixIcon,
  Color? textColor,
  String? helperText,
}) {
  return InputDecoration(
    errorStyle: secondaryTextStyle(color: Colors.red, fontStyle: FontStyle.italic),
    errorMaxLines: 2,
    focusColor: white,
    contentPadding: const EdgeInsets.only(left: 16),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    helperText: helperText,
    helperStyle: secondaryTextStyle(color: textColor, fontStyle: FontStyle.italic),
    hintText: name,
    hintStyle: secondaryTextStyle(color: textColor),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(
          color: button2Color,
          width: 0.5,
        )),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0), borderSide: const BorderSide(color: grey, width: 0.5)),
  );
}

Widget button({double? width, String? text, Color? textColor, Function? onTap, required BuildContext context}) {
  return Container(
    width: context.width(),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      //color: SHSecondaryColor
      gradient: const LinearGradient(
        colors: [button1Color, button2Color],
        begin: FractionalOffset.topLeft,
        end: FractionalOffset.centerRight,
      ),
    ),
    child: TextButton(
      onPressed: onTap as void Function()?,
      child: Text(
        text!,
        style: boldTextStyle(color: textColor),
      ),
    ),
  );
}

class CustomRow extends StatelessWidget {
  final String label;
  final String instruction;
  final Widget inputField;

  const CustomRow(this.label, this.inputField, {Key? key, required this.instruction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              instruction,
              style: boldTextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(label),
              10.width,
              const SizedBox(width: 8.0),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: inputField,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey[800],
    textColor: Colors.white,
  );
}

BoxDecoration boxDecoration({double radius = 2, Color color = Colors.transparent, Color? bgColor, var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow ? defaultBoxShadow(shadowColor: shadowColorGlobal) : [const BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

class AuthConstantWidget extends StatelessWidget {
  final Widget authWidget;
  const AuthConstantWidget({
    Key? key,
    required this.authWidget,
  }) : super(key: key);

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
                child: authWidget,
              ),
            )
          ],
        ),
      ),
    );
  }
}
