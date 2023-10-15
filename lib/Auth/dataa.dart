import 'package:firebase_database/firebase_database.dart';
import 'package:study_app/mindex.dart';

final firebaseDataProvider = FutureProvider.autoDispose<AsyncValue<Map<dynamic, dynamic>>>(
  (ref) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref();
      DataSnapshot event = await ref.get();
      final data = event.value as Map<dynamic, dynamic>;
      print(data);
      return AsyncValue.data(data);
    } on FirebaseException catch (e) {
      print(e.message);
      return AsyncValue.error(e.toString(), StackTrace.current);
    }
  },
);

final unidatabaseHiveProvider = Provider<Box<Map<dynamic, dynamic>>>((ref) {
  return Hive.box('databaseUniversityDetails');
});

final unidatabaseProvider = StateNotifierProvider<UniDatabaseData, Box<Map<dynamic, dynamic>>>(
  (ref) => UniDatabaseData(
    ref.read(unidatabaseHiveProvider),
  ),
);

class UniDatabaseData extends StateNotifier<Box<Map<dynamic, dynamic>>> {
  final Box<Map<dynamic, dynamic>> box;

  UniDatabaseData(this.box) : super(box);

  void addUniData(Map<dynamic, dynamic> map) {
    try {
      box.put('databaseUniversityDetails', map);
      print(map);
      print(state);
    } on Exception catch (e) {
      print(e);
    }
  }

  Map<dynamic, dynamic>? getUniData() {
    final data = box.get('databaseUniversityDetails');
    print(data);
    return data;
  }
}
