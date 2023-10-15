import 'package:percent_indicator/percent_indicator.dart';

import 'package:study_app/mindex.dart';

Widget buildDownloadButton2(StudyMaterial doc, List<Map<String, dynamic>> rawData, WidgetRef ref) {
  DownloadTaskk downloadTaskk = ref.watch(downloadTaskProvider);
  final downloadedFiles = ref.watch(downloadTaskProvider.notifier).getDownloadedDocMaps();

  List<String> activeDocuments = downloadTaskk.downloadTasks;
  double progress = downloadTaskk.progress;

  return ValueListenableBuilder(
    valueListenable: Hive.box<List<Map<String, dynamic>>>('downloadedDocMaps').listenable(), // Replace with your ValueListenable
    builder: (BuildContext context, box, child) {
      bool isDownloaded = downloadedFiles?.any((downloadedFile) {
            return downloadedFile['downloadURL'] == doc.downloadURL;
          }) ??
          false;

      isDownloaded
          ? kElevatedButton(
              onPressed: () {
                ref.watch(downloadTaskProvider.notifier).openTask(rawData, doc.downloadURL);
                // ref.watch(downloadTaskProvider.notifier).openTask(doc.downloadURL);
              },
              text: 'Open',
            )
          : !activeDocuments.contains(doc.downloadURL)
              ? kElevatedButton(
                  onPressed: () {
                    // ref.watch(downloadTaskProvider.notifier).getFirebaseDocsFromHive();
                    // ref.watch(downloadTaskProvider.notifier).findMapsByURLs(retrivedDoc, downloadedDoc);
                    ref.watch(downloadTaskProvider.notifier).downloadTask(rawData, doc.downloadURL);
                  },
                  text: 'Download',
                )
              : activeDocuments.contains(doc.downloadURL) && progress <= 0
                  ? const CircularProgressIndicator()
                  : CircularPercentIndicator(
                      radius: 20.0,
                      lineWidth: 5.0,
                      percent: progress,
                      center: Text(
                        progress > 0 ? '${(progress * 100).toStringAsFixed(0)}%' : 'Starting...',
                        style: const TextStyle(fontSize: 10),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.purple,
                      // animation: true,
                    );

      return const Text('DATA');
    },
  );
}

class kElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const kElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 100,
      child: ElevatedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}

Widget _getFileIcon(String ext) {
  switch (ext.toLowerCase()) {
    case 'pdf':
      return const Icon(
        Icons.picture_as_pdf,
        color: Colors.red,
        size: 15, // Customize the icon color
      );
    case 'docx':
      return const Icon(
        Icons.description,
        color: Colors.blue,
        size: 15, // Customize the icon color
      );
    // Add more cases for other file types as needed
    default:
      return const Icon(
        Icons.insert_drive_file,
        color: Colors.grey,
        size: 15, // Customize the default icon color
      );
  }
}
