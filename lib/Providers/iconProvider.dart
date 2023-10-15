import 'package:study_app/mindex.dart';

String getIconPath(String extension) {
  switch (extension) {
    case 'pdf':
      // return 'assets/icons/pdf-file.png';
      return 'assets/icons/icons8-pdf-48.png';
    case 'doc':
    case 'docx':
      // return 'assets/icons/word.png';
      return 'assets/icons/icons8-microsoft-word-48.png';
    case 'ppt':
    case 'pptx':
      // return 'assets/icons/powerpoint.png';
      return 'assets/icons/icons8-power-point-48.png';
    case 'xls':
    case 'xlsx':
      // return 'assets/icons/excel.png';
      return 'assets/icons/icons8-excel-48.png';
    default:
      // return 'assets/icons/pdf-file.png'; // You can set a default icon for other file types
      return 'assets/icons/icons8-pdf-16.png'; // You can set a default icon for other file types
  }
}

final iconPathProvider = StateProvider.family<String, String>((ref, extensn) {
  return getIconPath(extensn);
});
