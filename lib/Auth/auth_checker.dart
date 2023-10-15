import 'package:study_app/mindex.dart';

class AuthChecker extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Create an instance of FirebaseAuth

  AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      // Listen to changes in authentication state
      stream: _auth.idTokenChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // If the connection state is waiting, display a loading screen
          return CircularProgressIndicator();
        } else {
          if (snapshot.hasError) {
            // If there's an error, display the login screen
            return const ControllerScreen();
          } else {
            final user = snapshot.data;
            if (user != null) {
              // If a user is authenticated, navigate to the home screen
              return const MPDashboardScreen();
            } else {
              // If no user is authenticated, display the login screen
              return const ControllerScreen();
            }
          }
        }
      },
    );
  }
}
