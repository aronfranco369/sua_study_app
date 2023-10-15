import 'package:firebase_database/firebase_database.dart';
import 'package:study_app/mindex.dart';

final rawDataProvider = StateProvider<List<Map<String, dynamic>>>((ref) {
  return [];
});

final uuidProvider = Provider<String>((ref) {
  // Generate a new UUID.
  String uuid = const Uuid().v4();
  return uuid;
});

// final jsonDataProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
//   final Map<String, dynamic>? jsonData;
//   String jsonString = await rootBundle.loadString('assets/universityDetails.json');
//   print(jsonString);
//   jsonData = json.decode(jsonString);
//   print(jsonData);
//   return jsonData;
// });

final semestersProvider = FutureProvider<List<String>>((ref) async {
  // Reference to your database
  DatabaseReference reference = FirebaseDatabase.instance.ref();

  // Assuming 'universities' is your top-level key in the database
  final dataSnapshot = await reference.child('universities').once();

  // Extract semesters from the JSON data
  List<String> semesters = [];

  Map<dynamic, dynamic> universitiesData = {};
  universitiesData.forEach((key, value) {
    var colleges = value['colleges'] as List<dynamic>;
    for (var college in colleges) {
      var courses = college['courses'] as List<dynamic>;
      for (var course in courses) {
        var years = course['years'] as List<dynamic>;
        for (var year in years) {
          var semestersList = year['semesters'] as List<dynamic>;
          for (var semester in semestersList) {
            semesters.add(semester);
          }
        }
      }
    }
  });

  return semesters;
});
