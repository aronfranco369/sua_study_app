import 'package:study_app/Providers/gg.dart';
import 'package:study_app/mindex.dart';

class YourWidget extends ConsumerStatefulWidget {
  const YourWidget({super.key});

  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends ConsumerState<YourWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<Box<Map<dynamic, dynamic>>>(
          valueListenable: ref.read(sstarredDocMapsProvider).listenable(),
          builder: (context, box, child) {
            // Use box.values to access the values in your Box<Map<String, dynamic>>
            final documents = box.values.toList(); // Convert values to a list for easier manipulation

            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final document = documents[index];
                final number = document['number'];
                final name = document['name'];
                final type = document['type'];

                return ListTile(
                  title: Text('Number: $number'),
                  subtitle: Text('Name: $name\nType: $type'),
                  // Implement your onTap logic here
                );
              },
            );
          },
        ),
      ),
    );
  }
}
