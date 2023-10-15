import 'package:study_app/mindex.dart';

class SettingsComponent extends StatefulWidget {
  const SettingsComponent({super.key});

  @override
  State<SettingsComponent> createState() => _SettingsComponentState();
}

class _SettingsComponentState extends State<SettingsComponent> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: const Text('Settings Component'),
    ));
  }
}
