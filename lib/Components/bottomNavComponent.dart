import 'package:study_app/mindex.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  static String tag = '/CustomBottomNavigationBar';
  final Function(int)? onTap;
  final int? index;

  const CustomBottomNavigationBar({super.key, this.onTap, this.index});

  @override
  CustomBottomNavigationBarState createState() => CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
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
    return BottomNavigationBar(
      unselectedItemColor: Colors.grey.shade400,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontSize: 0),
      unselectedLabelStyle: const TextStyle(fontSize: 0),
      currentIndex: widget.index!,
      onTap: widget.onTap,
      items: [
        bottomNavigationItem(Icons.home_outlined),
        bottomNavigationItem(Icons.chat_bubble_outline),
        bottomNavigationItem(Icons.calendar_today_outlined),
        bottomNavigationItem(Icons.notifications_none),
        bottomNavigationItem(Icons.people_alt_outlined),
      ],
    );
  }

  bottomNavigationItem(IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 22),
      label: '',
      activeIcon: mlSelectedNavigationbarIcon(icon),
    );
  }
}

Widget mlSelectedNavigationbarIcon(IconData iconData) {
  return Container(
    padding: const EdgeInsets.all(10.0),
    decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.blue.withOpacity(0.1), borderRadius: radius(24)),
    child: Icon(iconData, size: 22, color: Colors.blue),
  );
}
