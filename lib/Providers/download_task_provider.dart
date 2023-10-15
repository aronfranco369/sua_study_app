import 'dart:io';

import 'package:study_app/Providers/hh.dart';
import 'package:study_app/Providers/recentDocsProvider.dart';

import '../mindex.dart';

final downloadTaskProvider = StateNotifierProvider<DownloadTaskNotifier, DownloadTaskk>((ref) {
  return DownloadTaskNotifier(ref);
});

class DownloadTaskNotifier extends StateNotifier<DownloadTaskk> {
  DownloadTaskNotifier(this.ref)
      : super(const DownloadTaskk(
          documentName: '',
          downloadUrl: '',
          progress: 0.00,
          downloadTasks: [],
          downloadedDocuments: [],
          openedDocuments: [],
        ));

  final Ref ref;

  Map<String, dynamic>? getCurrentDownloadTask(List<Map<String, dynamic>> documents, String url) {
    try {
      for (var map in documents) {
        if (map['downloadURL'] == url) {
          return map;
        }
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> downloadTask(List<Map<String, dynamic>> documents, String url) async {
    final currentMap = getCurrentDownloadTask(documents, url);
    print(currentMap);
    final documentName = currentMap!['name'];

    try {
      final directory = await getExternalStorageDirectory(); // Use getExternalStorageDirectory instead of getDownloadsDirectory
      final filePath = '${directory!.path}/$documentName';
      state = state.copyWith(downloadTasks: [...state.downloadTasks, url]);

      try {
        await Dio().download(
          url,
          filePath,
          onReceiveProgress: (received, total) {
            state = state.copyWith(progress: (received / total));
          },
        );
      } on DioException catch (e) {
        print(e);
      }

      await addDownloadedDocMaps(currentMap);

      state = state.copyWith(downloadTasks: List.from(state.downloadTasks)..remove(url));

      showToast('Downloaded document');
    } catch (e) {
      print(' $e');
    }
  }

  // List<String> getDownloadedDocuments() {
  //   final box = Hive.box<List<String>>('downloadedDocuments');
  //   List<String>? downloadedDocuments = box.get('downloadedDocuments', defaultValue: []);
  //   return downloadedDocuments!;
  // }

  Future<void> addDownloadedDocMaps(Map<String, dynamic>? map) async {
    final box = Hive.box<List<dynamic>>('downloadedDocMaps');
    final downloadedFiles = box.get('downloadedDocMaps', defaultValue: []);
    downloadedFiles!.add(map!);
    await box.put('downloadedDocMaps', downloadedFiles);
    print(downloadedFiles);
  }

  List<dynamic>? getDownloadedDocMaps() {
    final box = Hive.box<List<dynamic>>('downloadedDocMaps');
    return box.get('downloadedDocMaps', defaultValue: []);
  }

  Future<void> openTask(List<Map<String, dynamic>> documents, String downloadURL) async {
    final currentMap = getCurrentDownloadTask(documents, downloadURL);
    if (currentMap == null) {
      print('No matching document found.');
      return;
    }

    final documentName = currentMap['name'];

    final directory = await getExternalStorageDirectory(); // Use getExternalStorageDirectory instead of getDownloadsDirectory
    final filePath = '${directory!.path}/$documentName';

    try {
      bool fileExists = await File(filePath).exists();
      if (fileExists) {
        await OpenFile.open(filePath);

        ref.watch(recentDocumentsProvider.notifier).updateBox(currentMap);
        ref.watch(rrecentDocumentMapsProvider.notifier).addToRecent(currentMap);
        print(currentMap);
        print('Success opening $documentName');
      } else {
        print('File does not exist: $documentName');
      }
    } catch (e) {
      print('Error opening $documentName: $e');
    }
  }

  Future<void> clearDocumentsBox() {
    final box = Hive.box<List<dynamic>>('downloadedDocMaps');
    return box.clear();
  }
}
