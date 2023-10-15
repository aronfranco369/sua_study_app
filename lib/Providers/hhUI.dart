import 'package:study_app/Providers/gg.dart';
import 'package:study_app/Providers/hh.dart';
import 'package:study_app/Routes/downloadOpenButtonWidget.dart';
import 'package:study_app/mindex.dart';

class RRecentDoc extends ConsumerStatefulWidget {
  const RRecentDoc({super.key});

  @override
  _RRecentDocState createState() => _RRecentDocState();
}

class _RRecentDocState extends ConsumerState<RRecentDoc> {
  @override
  Widget build(BuildContext context) {
    final starredState = ref.watch(starredStateProvider);
    return
        // Center(
        //     child: CustomText(
        //   text: 'Heelo',
        //   color: white,
        // ));

        ValueListenableBuilder<Box<Map<dynamic, dynamic>>>(
      valueListenable: ref.read(rrecentDocMapsProvider).listenable(),
      builder: (context, box, child) {
        // Use box.values to access the values in your Box<Map<String, dynamic>>
        final documents = box.values.toList()..sort((a, b) => (b['timestamp']).compareTo(a['timestamp']));

        // Sort documents by datetime in descending order (new to old)

        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final document = documents[index];
            final number = document['number'];
            final name = document['name'];
            final type = document['type'];
            final url = document['downloadURL'];

            final isStarred = starredState[document['id']] ?? false;
            final basename = name.split('.').first;
            final ext = name.split('.').last.toUpperCase();

            return Card(
              elevation: 3,
              margin: const EdgeInsets.all(2),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: basename,
                              fontSize: 20,
                            ),
                          ],
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // _buildGlowingText(studyMaterialNumber),
                            // // _buildGlowingText(studyMaterialType),

                            // _getFileIcon(ext),

                            CustomText(
                              text: number,
                            ),
                            15.width,

                            CustomText(
                              text: ext,
                            ),
                          ],
                        ),
                      ],
                    ),
                    // buildDownloadButton2(name, url, ref),

                    Row(children: [
                      kElevatedButton(
                        onPressed: () {
                          print('hello');
                          // ref.watch(downloadTaskProvider.notifier).openTask(rawData, doc.downloadURL);
                          // ref.watch(downloadTaskProvider.notifier).openTask(doc.downloadURL);
                        },
                        text: 'Open',
                      ),
                      IconButton(
                        icon: isStarred ? const Icon(Icons.star_rounded, color: Colors.green) : const Icon(Icons.star_outline_rounded, color: Colors.grey),
                        onPressed: () {
                          // ref.watch(starredStateProvider.notifier).getCurrentMap(doc['id']);
                          ref.watch(starredStateProvider.notifier).toggleStar(document['id']);
                          // ref.watch(starreddDocumentMapsProvider.notifier).clearBox();
                        },
                      ),
                    ])
                  ])),
            );
          },
        );
      },
    );
  }
}
