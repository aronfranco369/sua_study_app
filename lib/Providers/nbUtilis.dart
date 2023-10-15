import 'package:overlay_support/overlay_support.dart';
import 'package:study_app/mindex.dart';

class NbUtilis extends StatefulWidget {
  const NbUtilis({super.key});

  @override
  State<NbUtilis> createState() => _NbUtilisState();
}

class _NbUtilisState extends State<NbUtilis> {
  final now = DateTime.now().millisecondsSinceEpoch;
  final past = DateTime(2022).millisecondsSinceEpoch;
  bool shown = false;
  String ss = 'Hello';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: TimerWidget(
          function: () {
            // print('5 seconds passef');
          },
          child: Text(ss),
          duration: 10.seconds,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // print(now);
        // print(past);
        // print(formatTime(now));
        // print(formatTime(past));
      }),
    );
  }
}
