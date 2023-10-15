import 'package:study_app/mindex.dart';

// ignore: must_be_immutable
class MPProfileScreen extends StatefulWidget {
  bool? isTab = false;

  MPProfileScreen({super.key, this.isTab});

  static String tag = '/ MPProfileScreen';

  @override
  MPProfileScreenState createState() => MPProfileScreenState();
}

class MPProfileScreenState extends State<MPProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mpAppBackGroundColor,
          title: Text("Profile", style: boldTextStyle(color: white.withOpacity(0.9), size: 18)),
          centerTitle: true,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: white.withOpacity(0.9)),
          elevation: 0.0,
        ),
        backgroundColor: mpAppBackGroundColor,
        body: SingleChildScrollView(child: Consumer(
          builder: (context, ref, child) {
            final student = ref.read(signupDataProvider.notifier).getUserData();
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.height,
                  commonCacheImageWidget(mpImages_4, 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(50).center(),
                  16.height,
                  ProfileText('Email', student!.email),
                  16.height,
                  ProfileText('Username', student.username),
                  16.height,
                  ProfileText('University', student.university),
                  16.height,
                  ProfileText('College', student.college),
                  16.height,
                  ProfileText('Course', student.course),
                  16.height,
                  ProfileText('Year', student.year),
                  16.height,
                  ProfileText('Semester', student.semester),
                  32.height,
                  Center(
                    child: AppButton(
                      color: mpAppButtonColor,
                      width: 140,
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      onTap: () {
                        // showAlertDialog(context);
                      },
                      child: Text('Update Profile', style: boldTextStyle(color: Colors.white, size: 14)),
                    ),
                  )
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}

class ProfileText extends StatelessWidget {
  final String property;
  final String value;

  const ProfileText(
    this.property,
    this.value, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double desiredSpacing = MediaQuery.of(context).size.width;
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            child: Text(
              property,
              style: boldTextStyle(color: Colors.white.withOpacity(0.8)),
            ),
          ),
          SizedBox(
            width: 20,
            child: Text(
              ':',
              style: boldTextStyle(color: Colors.white.withOpacity(0.8)),
            ),
          ),
          Flexible(
            child: SizedBox(
              width: desiredSpacing,
              child: Text(
                value,
                style: boldTextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
