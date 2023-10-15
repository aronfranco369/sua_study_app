import 'package:study_app/Auth/dataa.dart';
import 'package:study_app/mindex.dart';

class ControllerScreen extends ConsumerStatefulWidget {
  const ControllerScreen({super.key});
  @override
  ControllerScreenState createState() => ControllerScreenState();
}

class ControllerScreenState extends ConsumerState<ControllerScreen> {
  @override
  Widget build(BuildContext context) {
    final firebaseData = ref.watch(firebaseDataProvider);
    return firebaseData.when(
      data: (data) {
        ref.watch(unidatabaseProvider.notifier).addUniData(data.value!);
        return Scaffold(
          body: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    'assets/images/suaAdministration.jpg',
                    fit: BoxFit.cover,
                    height: context.height(),
                    width: context.width(),
                  ),
                  Container(
                    width: context.width(),
                    height: context.height(),
                    color: Colors.black26,
                  ),
                  Column(
                    children: [
                      Text('Admin Management Panel', style: boldTextStyle(color: white, size: 30)),
                      16.height,
                      Text(
                        'Upload and Manage Study Materials for your fellow Students',
                        style: primaryTextStyle(color: white),
                        textAlign: TextAlign.center,
                      ),
                      16.height,
                      button(
                        textColor: white,
                        width: context.width(),
                        context: context,
                        text: 'Get Started',
                        onTap: () {
                          const Signup1().launch(context);
                        },
                      ),
                      16.height,
                      AppButton(
                        color: context.cardColor,
                        text: 'Log in',
                        textStyle: boldTextStyle(),
                        width: context.width(),
                        shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        onTap: () {
                          Login().launch(context);
                        },
                      ),
                    ],
                  ).paddingSymmetric(vertical: 16, horizontal: 16)
                ],
              ),
            ],
          ),
        );
      },
      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
        // Handle the case when the future is still loading
        // You can show a loading indicator here
      },
      error: (error, stackTrace) {
        return Center(
          child: Text('Error in getting data'),
        );
      },
    );
  }
}
