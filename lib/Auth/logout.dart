import 'package:study_app/Providers/gg.dart';
import 'package:study_app/Providers/hh.dart';
import 'package:study_app/mindex.dart';

class SignOut extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  SignOut({super.key});

  Future<void> _signOut() async {
    await _auth.signOut();
  }

  // Function to show the sign-out confirmation dialog
  Future<void> _showSignOutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Sign Out'),
              onPressed: () {
                _signOut(); // Call the sign-out function
                AuthChecker().launch(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                _showSignOutDialog(context); // Show the sign-out dialog
                ref.read(rrecentDocumentMapsProvider.notifier).clearBox();
                ref.read(starreddDocumentMapsProvider.notifier).clearBox();
              },
              child: const Text('Sign Out'),
            ),
          );
        },
      ),
    );
  }
}
