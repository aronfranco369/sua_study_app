import 'package:study_app/mindex.dart';

final starredDocMapsProvider = Provider<Box<List<dynamic>>>((ref) {
  return Hive.box('starredDocMaps');
});

final starredDocumentMapsProvider = StateNotifierProvider<StarredDocuments, List<Map<String, dynamic>>>(
  (ref) => StarredDocuments(ref),
);

class StarredDocuments extends StateNotifier<List<Map<String, dynamic>>> {
  final Ref ref;

  StarredDocuments(this.ref) : super(ref.read(starredDocsProvider));

  bool checkExist(List<Map<String, dynamic>> state, Map<String, dynamic> map) {
    return state.any((element) => element['id'] == map['id']); // Assuming each document has a unique 'id'.
  }

  void updateBox(Map<String, dynamic> document) {
    addToRecent(document);

    final box = ref.read(starredDocMapsProvider);
    box.put('starredDocMaps', state);
    print(box);
  }

  void addToRecent(Map<String, dynamic> document) {
    List<Map<String, dynamic>> currentState = List.from(state); // Clone the current state

    bool exists = checkExist(currentState, document);

    if (exists) {
      // If the document already exists, update it in the cloned state.
      currentState.removeWhere((element) => element['id'] == document['id']);
      currentState.insert(0, document);
    } else {
      // If the document doesn't exist, add it to the first position in the cloned state.
      currentState.insert(0, document);
    }

    state = currentState; // Update the state directly using the setter provided by StateNotifier.
    print(state);
  }
}

final starredDocsProvider = Provider<List<Map<String, dynamic>>>((ref) {
  final box = ref.read(starredDocMapsProvider);
  final list = box.get('starredDocMaps')!.toList();
  List<Map<String, dynamic>> resultList = [];

  for (var item in list) {
    if (item is Map<String, dynamic>) {
      // If the item is already a Map<String, dynamic>, add it to the result list as is.
      resultList.add(item);
    } else if (item is Map) {
      // If the item is a Map (with dynamic values), convert it to Map<String, dynamic>.
      Map<String, dynamic> stringKeyMap = {};
      item.forEach((key, value) {
        stringKeyMap[key.toString()] = value;
      });
      resultList.add(stringKeyMap);
    } else {
      // Handle other cases if needed, such as converting JSON strings to Map.
      // You can add additional logic here based on your requirements.
    }
  }

  return resultList;
});
