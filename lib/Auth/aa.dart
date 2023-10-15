import 'package:study_app/Auth/logout.dart';
import 'package:study_app/mindex.dart';

class MSelectTopicScreen extends StatefulWidget {
  static String tag = '/MSelectTopicScreen';

  const MSelectTopicScreen({super.key});

  @override
  MSelectTopicScreenState createState() => MSelectTopicScreenState();
}

class MSelectTopicScreenState extends State<MSelectTopicScreen> {
  late List<String> getListOfSelectTopic;
  late List<bool> isSelectedList;

  @override
  void initState() {
    super.initState();
    getListOfSelectTopic = ["Semester 1", "Semester 2", "Semester 3", "Semester 4", "Semester 5", "Semester 6"];
    isSelectedList = List.generate(getListOfSelectTopic.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Select the college your course is in.', style: TextStyle(color: Colors.white, fontSize: 18)).paddingAll(16).expand(),
                  Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(8),
                    child: Text('Next', style: TextStyle(color: isSelectedList.contains(true) ? Colors.white : Colors.grey)),
                  ).onTap(() {
                    if (isSelectedList.where((element) => element).length >= 3) {
                      SignOut().launch(context);
                    } else {
                      toasty(context, "Please select at least 3 topics.");
                    }
                  }, splashColor: Colors.transparent, hoverColor: Colors.transparent, highlightColor: Colors.transparent)
                ],
              ),
              const SizedBox(height: 8),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // alignment: WrapAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // runAlignment: WrapAlignment.center,
                  children: List.generate(getListOfSelectTopic.length, (index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: isSelectedList[index] ? Colors.transparent : Colors.grey),
                        color: isSelectedList[index] ? Colors.lime : Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
                      child: Text(getListOfSelectTopic[index], style: const TextStyle(color: Colors.white, fontSize: 14)),
                    ).onTap(() {
                      setState(() {
                        isSelectedList[index] = !isSelectedList[index];
                      });
                    }, splashColor: Colors.transparent, hoverColor: Colors.transparent, highlightColor: Colors.transparent);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
