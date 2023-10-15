import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final rrecentDocMapsProvider = Provider<Box<Map<dynamic, dynamic>>>((ref) {
  return Hive.box('rrecentDocMaps');
});

final rrecentDocumentMapsProvider = StateNotifierProvider<RRecentDocuments, Box<Map<dynamic, dynamic>>>(
  (ref) => RRecentDocuments(
    ref.watch(rrecentDocMapsProvider),
  ),
);

class RRecentDocuments extends StateNotifier<Box<Map<dynamic, dynamic>>> {
  final Box<Map<dynamic, dynamic>> box;

  RRecentDocuments(this.box) : super(box);

  void clearBox() {
    box.clear();
    print('Box cleared');
  }

  void addToRecent(Map<String, dynamic> map) {
    try {
      final id = map['id'];
      final timestamp = DateTime.now();

      map['timestamp'] = timestamp; //
      // Get current datetime

      if (box.containsKey(id)) {
        // If the document already exists, move it to the first position
        final existingMap = box.get(id);

        box.delete(id); // Remove the existing entry
        existingMap!['timestamp'] = timestamp; // Update timestamp
        box.put(id, existingMap); // Add it back to move it to the first position
      } else {
        map['timestamp'] = timestamp; // Add timestamp to new map
        box.put(id, map);
      }
    } catch (e) {
      print('hiveERROR: $e');
    }

    // Update the state to notify listeners
    state = box;
  }
}
