import 'package:study_app/Auth/logout.dart';
import 'package:study_app/Routes/moduleScreen.dart';
import 'package:study_app/mindex.dart';

class MPDashboardScreen extends StatefulWidget {
  static String tag = '/MPDashboardScreen';

  const MPDashboardScreen({super.key});

  @override
  MPDashboardScreenState createState() => MPDashboardScreenState();
}

class MPDashboardScreenState extends State<MPDashboardScreen> {
  TextEditingController searchController = TextEditingController();

  List<DrawerList> drawerList = getDrawerList();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int currentIndex = 0;

  final tabs = [
    const Users(),
    const MPTabBarSignInScreen(),
    const MPSongsScreen(),
    SignOut(),
  ];

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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: mpAppBackGroundColor,
        key: _scaffoldKey,
        appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
        drawer: const DrawerScreen(),
        body: Stack(
          children: [
            tabs[currentIndex],
            Positioned(
              left: 0,
              right: 0,
              bottom: 1,
              child: BottomNavigationBar(
                selectedItemColor: mpAppButtonColor,
                unselectedItemColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                backgroundColor: mpBottomBgColor.withOpacity(0.9),
                currentIndex: currentIndex,
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.note_alt), label: 'Modules'),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Recent'),
                  BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
                ],
                onTap: (index) {
                  currentIndex = index;
                  setState(() {});
                },
              ).cornerRadiusWithClipRRect(30).paddingOnly(left: 16, right: 16, bottom: 5),
            )
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
    this.tabBar, // Make TabBar optional
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;
  final TabBar? tabBar; // Declare TabBar as nullable

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: mpAppBackGroundColor,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      title: const Center(
        child: Text(
          'UniStudy',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      bottom: tabBar != null
          ? PreferredSize(
              preferredSize: tabBar!.preferredSize,
              child: tabBar!,
            )
          : null, // Set bottom to null if tabBar is not provided
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (tabBar?.preferredSize.height ?? 0));
}
