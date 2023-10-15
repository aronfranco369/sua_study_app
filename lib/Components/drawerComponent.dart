import 'package:study_app/mindex.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // final semesterBox = Hive.box<List<String>>('semesters');
    // final drawerOptions = semesterBox.get('semesters');
    final drawerOptions = [
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6',
    ];

    // Check if drawerOptions is not null before using it in the for-in loop
    if (drawerOptions != null) {
      return Drawer(
        backgroundColor: scaffoldDark,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: scaffoldDark,
              ),
              child: Center(
                child: Text(
                  'Uni Study Lab',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            for (var option in drawerOptions)
              Card(
                color: white,
                child: ListTile(
                  title: CustomText(
                    fontSize: 15,
                    color: black,
                    text: option,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_outlined,
                    color: black,
                  ),
                  onTap: () {},
                ),
              ),
          ],
        ),
      );
    } else {
      // Handle the case where drawerOptions is null (e.g., show a loading indicator or an error message)
      return const CircularProgressIndicator(); // You can replace this with your preferred UI element.
    }
  }
}
