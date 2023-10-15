import 'package:study_app/mindex.dart';

class DrawerScreen extends ConsumerStatefulWidget {
  const DrawerScreen({super.key});

  @override
  DrawerScreenState createState() => DrawerScreenState();
}

class DrawerScreenState extends ConsumerState<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> drawerList = ref.read(signupDataProvider.notifier).provideSemesters();
    return Theme(
      data: ThemeData(canvasColor: mpAppBackGroundColor3),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 150,
              color: mpAppBackGroundColor3,
            ),
            Container(
              color: mpAppBackGroundColor3,
              padding: const EdgeInsets.only(bottom: 16),
              child: GestureDetector(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: drawerList.map((semester) {
                        return GestureDetector(
                          onTap: () async {
                            // Update the semester
                            ref.read(signupDataProvider.notifier).updateSemester(semester);

                            // Wait for the state update to complete
                            await Future.delayed(Duration.zero);

                            // Now, the state should be updated correctly
                            final currentSemester = ref.read(signupDataProvider).semester;
                            // print(currentSemester);

                            // Save student and path to Hive
                            await ref.read(signupDataProvider.notifier).saveStudentandPathToHive();

                            // // Print the global path
                            final globalPath = ref.read(signupDataProvider.notifier).getiGlobalPath();
                            Navigator.of(context).pop();
                            print(globalPath);
                          },
                          child: SizedBox(
                            height: 65,
                            child: Card(
                              color: mpAppBackGroundColor2,
                              elevation: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(semester, style: primaryTextStyle(color: white)).paddingAll(8),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: white,
                                    size: 15,
                                  ),
                                ],
                              ).paddingOnly(left: 15, right: 25),
                            ),
                          ),
                        );
                      }).toList(),
                    ).paddingAll(8),
                    GestureDetector(
                      onTap: () {
                        MPProfileScreen().launch(context);
                      },
                      child: SizedBox(
                        height: 65,
                        child: Card(
                          color: mpAppBackGroundColor2,
                          elevation: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Profile', style: primaryTextStyle(color: white)).paddingAll(8),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: white,
                                size: 15,
                              ),
                            ],
                          ).paddingOnly(left: 15, right: 25),
                        ),
                      ).paddingAll(8),
                    ),
                    16.height,
                    AppButton(
                      color: mpAppButtonColor,
                      width: 140,
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: Text('Sign Out', style: boldTextStyle(color: Colors.white, size: 14)),
                    ).cornerRadiusWithClipRRect(16).center(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("Cancel", style: secondaryTextStyle(color: Colors.white)).onTap(() {
          finish(context);
          finish(context);
        }).paddingOnly(top: 4, bottom: 4),
        32.width,
        Text("OK", style: secondaryTextStyle(color: Colors.white)).paddingOnly(right: 8, top: 4, bottom: 4).onTap(() {
          const MPDashboardScreen().launch(context);
        }),
      ],
    );
    AlertDialog alert = AlertDialog(
      backgroundColor: mpBottomBgColor,
      content: Text("Are you sure , you Want to sign out ?", style: boldTextStyle(color: Colors.white)),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
