import 'package:intl/intl.dart';
import 'package:study_app/mindex.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController messageEditingController = TextEditingController();
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  Widget chatMessages() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('/final/Sokoine University of Agriculture(SUA)/Veterinary Medicine/Year 1/Semester 1/MT 565/chats').orderBy('timestamp').snapshots(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                controller: _scrollController,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final chats = snapshot.data!.docs.toList();
                  final chat = chats[index];
                  final timestamp = chat["timestamp"];

                  return MessageTile(
                    message: chat["message"],
                    sendByMe: chat["sendByMe"],
                    uploadedBy: chat["sender"],
                    timestamp: chat["timestamp"],
                  );
                })
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Container(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
            child: chatMessages(),
          ),
        ),
        40.height,
        Container(
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: mpAppBackGroundColor,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageEditingController,
                    style: const TextStyle(color: Colors.white),
                    decoration: waInputDecoration(
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                      hint: "Message ...",
                      borderColor: Colors.blue.withOpacity(0.5),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                send(),
                IconButton(icon: const Icon(Icons.arrow_downward), color: Colors.white, onPressed: scrollToEnd)
              ],
            ),
          ),
        ),
      ],
    );
  }

  void scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOut,
    );
  }

  Widget send() {
    if (isLoading) {
      return const CircularProgressIndicator(
        color: Colors.blue,
      );
    } else {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)], begin: FractionalOffset.topLeft, end: FractionalOffset.bottomRight),
                borderRadius: BorderRadius.circular(40)),
            padding: const EdgeInsets.all(12),
            child: GestureDetector(
              onTap: () {
                addMessage();
                scrollToEnd();
              },
              child: Image.asset(
                "assets/images/send.png",
                height: 25,
                width: 25,
              ),
            ),
          ),
        ],
      );
    }
  }

  Future<void> addMessage() async {
    DateTime? time = DateTime.now();

    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {"sender": 'Aron', 'timestamp': Timestamp.fromDate(time), "message": messageEditingController.text, 'sendByMe': true};

      setState(() {
        isLoading = true;
      });

      try {
        await FirebaseFirestore.instance.collection("/final/Sokoine University of Agriculture(SUA)/Veterinary Medicine/Year 1/Semester 1/MT 565/chats").add(chatMessageMap);

        setState(() {
          isLoading = false;
          messageEditingController.text = "";
        });
      } catch (e) {
        print("Error sending message: $e");
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> addBlankMessage() async {
    DateTime? time = DateTime.now();
    Map<String, dynamic> chatMessageMap = {
      'sendByMe': false,
      "sender": '@Developer',
      'timestamp': Timestamp.fromDate(time),
      "message": 'This section was created to give you insight tricks,methods and how the instructors handle Tests, UE , Quizes, Answering formats and Marking style of this course',
    };

    await FirebaseFirestore.instance.collection("/final/Sokoine University of Agriculture(SUA)/Veterinary Medicine/Year 1/Semester 1/MT 565/chats").doc().set(chatMessageMap);

    setState(() {
      time = null;
    });
  }
}

String getTime(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm a');
  String formattedString = formatter.format(dateTime);
  return formattedString;
}

class MessageTile extends StatelessWidget {
  final String message;
  final String uploadedBy;
  final bool sendByMe;
  final Timestamp timestamp;

  const MessageTile({
    super.key,
    required this.message,
    required this.sendByMe,
    required this.uploadedBy,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: sendByMe ? 0 : 24, right: sendByMe ? 24 : 0),
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: sendByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: sendByMe ? const EdgeInsets.only(left: 30) : const EdgeInsets.only(right: 30),
            padding: const EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: sendByMe
                    ? const BorderRadius.only(topLeft: Radius.circular(23), topRight: Radius.circular(23), bottomLeft: Radius.circular(23))
                    : const BorderRadius.only(topLeft: Radius.circular(23), topRight: Radius.circular(23), bottomRight: Radius.circular(23)),
                gradient: LinearGradient(
                  colors: sendByMe ? [const Color(0xff007EF4), const Color(0xff2A75BC)] : [const Color(0x1AFFFFFF), const Color(0x1AFFFFFF)],
                )),
            child: Text(message, textAlign: TextAlign.start, style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'OverpassRegular', fontWeight: FontWeight.w300)),
          ),
          3.height,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(uploadedBy, style: const TextStyle(color: Colors.white)),
              const SizedBox(width: 10),
              Text(getTime(timestamp), style: const TextStyle(color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }
}
