// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:study_app/mindex.dart';

part 'downloadTak.freezed.dart';

@freezed
class DownloadTaskk with _$DownloadTaskk {
  const DownloadTaskk._();
  const factory DownloadTaskk({
    required String documentName,
    required String downloadUrl,
    required double progress,
    required List<String> downloadTasks,
    required List<Map<String, dynamic>> downloadedDocuments,
    required List<Map<String, dynamic>> openedDocuments,
  }) = _DownloadTaskk;
}

// class DownloadTak {
//   final String documentName;
//   final String downloadUrl;
//   final double progress;
//   final List<String> downloadTasks;
//    final List<Map<String, dynamic>> downloadedDocuments;
//      final List<Map<String, dynamic>> openedDocuments;
//   DownloadTak({
//     required this.documentName,
//     required this.downloadUrl,
//     required this.progress,
//     required this.downloadTasks,
//     required this.downloadedDocuments,
//     required this.openedDocuments,
//   });

  

//   DownloadTak copyWith({
//     String? documentName,
//     String? downloadUrl,
//     double? progress,
//     List<String>? downloadTasks,
//     List<Map<String, dynamic>>? downloadedDocuments,
//     List<Map<String, dynamic>>? openedDocuments,
//   }) {
//     return DownloadTak(
//       documentName: documentName ?? this.documentName,
//       downloadUrl: downloadUrl ?? this.downloadUrl,
//       progress: progress ?? this.progress,
//       downloadTasks: downloadTasks ?? this.downloadTasks,
//       downloadedDocuments: downloadedDocuments ?? this.downloadedDocuments,
//       openedDocuments: openedDocuments ?? this.openedDocuments,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'documentName': documentName,
//       'downloadUrl': downloadUrl,
//       'progress': progress,
//       'downloadTasks': downloadTasks,
//       'downloadedDocuments': downloadedDocuments,
//       'openedDocuments': openedDocuments,
//     };
//   }

// factory DownloadTak.fromMap(Map<String, dynamic> map) {
//   return DownloadTak(
//     documentName: map['documentName'] as String,
//     downloadUrl: map['downloadUrl'] as String,
//     progress: map['progress'] as double,
//     downloadTasks: List<String>.from(map['downloadTasks'] as List<String>),
//     downloadedDocuments: List<Map<String, dynamic>>.from(map['downloadedDocuments'] as List<Map<String, dynamic>>),
//     openedDocuments: List<Map<String, dynamic>>.from(map['openedDocuments'] as List<Map<String, dynamic>>),
//   );
// }

//   String toJson() => json.encode(toMap());

//   factory DownloadTak.fromJson(String source) => DownloadTak.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'DownloadTak(documentName: $documentName, downloadUrl: $downloadUrl, progress: $progress, downloadTasks: $downloadTasks, downloadedDocuments: $downloadedDocuments, openedDocuments: $openedDocuments)';
//   }

//   @override
//   bool operator ==(covariant DownloadTak other) {
//     if (identical(this, other)) return true;
//     final listEquals = const DeepCollectionEquality().equals;
  
//     return 
//       other.documentName == documentName &&
//       other.downloadUrl == downloadUrl &&
//       other.progress == progress &&
//       listEquals(other.downloadTasks, downloadTasks) &&
//       listEquals(other.downloadedDocuments, downloadedDocuments) &&
//       listEquals(other.openedDocuments, openedDocuments);
//   }

//   @override
//   int get hashCode {
//     return documentName.hashCode ^
//       downloadUrl.hashCode ^
//       progress.hashCode ^
//       downloadTasks.hashCode ^
//       downloadedDocuments.hashCode ^
//       openedDocuments.hashCode;
//   }
//   }


