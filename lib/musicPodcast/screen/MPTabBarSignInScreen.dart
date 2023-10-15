import 'package:study_app/Providers/hhUI.dart';
import 'package:study_app/mindex.dart';

class MPTabBarSignInScreen extends StatefulWidget {
  const MPTabBarSignInScreen({super.key});

  @override
  MPTabBarSignInScreenState createState() => MPTabBarSignInScreenState();
}

class MPTabBarSignInScreenState extends State<MPTabBarSignInScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: mpAppBackGroundColor,
        appBar: const TabBar(
          unselectedLabelColor: mpAppTextColor,
          labelColor: white,
          tabs: [
            Tab(child: Text('Recent')),
            Tab(child: Text('Starred')),
          ],
          indicatorColor: mpAppButtonColor,
          indicatorWeight: 3,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            RRecentDoc(),
            SingleChildScrollView(),
          ],
        ),
      ),
    );
  }
}
