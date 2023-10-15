import 'package:study_app/Auth/logout.dart';
import 'package:study_app/Components/bottomNavComponent.dart';
import 'package:study_app/Providers/ggUI.dart';

import 'package:study_app/Routes/moduleScreen.dart';
import 'package:study_app/mindex.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentWidget = 0;
  List<Widget> widgets = [
    const MPTabBarSignInScreen(),
    const Users(),
    const YourWidget(),
    SignOut(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body: widgets[currentWidget],
        bottomNavigationBar: Container(color: black, child: showBottomDrawer()),
      ),
    );
  }

  Widget showBottomDrawer() {
    return CustomBottomNavigationBar(
      index: currentWidget,
      onTap: (index) {
        setState(() {});
        currentWidget = index;
      },
    );
  }
}

class NoteListScreen {}
