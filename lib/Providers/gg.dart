import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:study_app/Providers/recentDocsProvider.dart';

final sstarredDocMapsProvider = Provider<Box<Map<dynamic, dynamic>>>((ref) {
  return Hive.box('starredDocMapss');
});

final starreddDocumentMapsProvider = StateNotifierProvider<StarredDocuments, Box<Map<dynamic, dynamic>>>(
  (ref) => StarredDocuments(
    ref.read(sstarredDocMapsProvider),
  ),
);

class StarredDocuments extends StateNotifier<Box<Map<dynamic, dynamic>>> {
  final Box<Map<dynamic, dynamic>> box;

  StarredDocuments(this.box) : super(box);

  void clearBox() {
    box.clear();
    print('Box cleared');
  }

  void addToRecent(Map<String, dynamic> map) {
    try {
      final id = map['id'];

      if (box.containsKey(id)) {
        // If the document already exists, move it to the first position

        box.delete(id); // Remove the existing entry
        print(box.values);
      } else {
        // If the document doesn't exist, add it to the first position
        box.put(id, map);
        print(box.values);
      }
    } catch (e) {
      print('hiveERROR: $e');
    }

    // Update the state to notify listeners
    state = box;
  }
}

// Usage:
// To add a document to the starred documents list, use:
// context.read(starredDocumentMapsProvider.notifier).addToRecent(documentMap);

final starredStateProvider = StateNotifierProvider<StarredStateNotifier, Map<String, bool>>((ref) {
  return StarredStateNotifier(ref);
});

class StarredStateNotifier extends StateNotifier<Map<String, bool>> {
  Ref ref;
  StarredStateNotifier(this.ref) : super({});

  void toggleStar(String docId) {
    state = {...state, docId: !(state[docId] ?? false)};
    getCurrentMap(docId);
    final currentMap = ref.watch(starredStateProvider.notifier).getCurrentMap(docId);
    ref.watch(starreddDocumentMapsProvider.notifier).addToRecent(currentMap!);
    print(state);
  }

  Map<String, dynamic>? getCurrentMap(String id) {
    final recentDocMaps = ref.watch(recentDocsProvider);
    try {
      for (var map in recentDocMaps) {
        if (map['id'] == id) {
          print(Map<String, dynamic>.from(map));
          return Map<String, dynamic>.from(map);
        }
      }
    } catch (e) {
      print('errorrrr');
    }

    return null;

    // Return null when no matching 'downloadURL' is found
  }
}
