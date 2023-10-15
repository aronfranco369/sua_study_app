import 'package:study_app/mindex.dart';

final studyMaterialTypeProvider = StateProvider<List<String>>((ref) {
  // Define your list of study material options here.
  return [
    'Lecture',
    'Assignment',
    'Practical Report',
    'Research Paper',
    'Simbi',
    'Quiz',
    'Compendium',
  ];
});

final simbiTypeProvider = StateProvider<List<String>>((ref) {
  // Define your list of study material options here.
  return [
    'Test 1',
    'Test 2',
    'University Exam',
    'Quiz',
    'Suppplementary Exam',
    'Quiz',
  ];
});

// Create a provider for the list of years as strings
final yearsProvider = Provider<List<String>>((ref) {
  // Get the current year
  int currentYear = DateTime.now().year;

  // Create an empty list to store the years as strings
  List<String> yearsList = [];

  // Generate years from the current year to ten years in the past and convert to strings
  for (int year = currentYear; year >= currentYear - 10; year--) {
    yearsList.add(year.toString()); // Convert the year to a string and add to the list
  }

  // Return the list of years as strings
  return yearsList;
});
