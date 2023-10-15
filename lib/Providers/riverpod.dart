import 'package:study_app/mindex.dart';

final studentBoxProvider = Provider<Box<Student>>((ref) {
  return Hive.box('Student');
});

final signupDataProvider = StateNotifierProvider<SignupDataNotifier, Student>((ref) {
  return SignupDataNotifier(
    ref,
    ref.read(studentBoxProvider),
  );
});

class SignupDataNotifier extends StateNotifier<Student> {
  final Box<Student> box;
  SignupDataNotifier(this.ref, this.box)
      : super(
          box.isEmpty
              ? Student(
                  university: '',
                  course: '',
                  year: '',
                  semester: '',
                  college: '',
                  phonenum: '',
                  email: '',
                  username: '',
                  registrationNumber: '',
                )
              : box.get('Student')!,
        );

  final Ref ref;

  void updateUniversity(String? value) {
    state = state.copyWith(university: value);
    print(state.university);
  }

  void updateCollege(String? value) {
    state = state.copyWith(college: value);
    print(state.college);
  }

  void updateCourse(String? value) {
    state = state.copyWith(course: value);
  }

  void updateEmail(String? value) {
    state = state.copyWith(email: value);
  }

  void updatephonenum(String? value) {
    state = state.copyWith(phonenum: value);
  }

  void updateYear(String? value) {
    state = state.copyWith(year: value);
  }

  void updateSemester(String? value) {
    state = state.copyWith(semester: value);
  }

  void updateUsername(String? value) {
    state = state.copyWith(username: value);
  }

  void updateRegNo(String? value) {
    state = state.copyWith(registrationNumber: value);
  }

  void getSemesters(List<dynamic> semesterOptions) async {
    final box = Hive.box<List<dynamic>>('semesters');
    await box.put('semesters', semesterOptions);
  }

  List<dynamic> provideSemesters() {
    final box = Hive.box<List<dynamic>>('semesters');
    final semesters = box.get('semesters')!.toList();
    print(semesters);
    return semesters;
  }

  Future<void> saveStudentandPathToHive() async {
    try {
      final signupData = state;

      final student = Student(
        university: signupData.university,
        course: signupData.course,
        registrationNumber: signupData.registrationNumber,
        year: signupData.year,
        semester: signupData.semester,
        college: signupData.college,
        phonenum: signupData.phonenum,
        email: signupData.email,
        username: signupData.username,
      );
      final box = Hive.box<Student>('Student');
      await box.put('Student', student);

      final path = 'final/${student.university}/${student.course}/${student.year}/${student.semester}';
      await setGlobalPath(path);
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: '$e',
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 10,
      );
    }
  }

  Future<void> setGlobalPath(String path) async {
    final box = Hive.box<String?>('path');
    await box.put('globalPath', path);
  }

  void addDownloadedDocuments(String document) async {
    // Get the Hive box for downloadedDocuments
    final box = Hive.box<List<String>>('downloadedDocuments');

    // Retrieve the current list of downloaded documents from the box
    List<String>? downloadedDocuments = box.get('downloadedDocuments', defaultValue: []);

    // Add the new document to the list
    downloadedDocuments!.add(document);

    // Put the updated list back into the Hive box
    await box.put('downloadedDocuments', downloadedDocuments);
  }

  List<String>? getDownloadedDocuments() {
    final box = Hive.box<List<String>>('downloadedDocuments');
    return box.get('downloadedDocuments', defaultValue: []);
  }

  Future<void> clearDocumentsBox() {
    final box = Hive.box<List<String>>('downloadedDocuments');
    return box.clear();
  }

  String? getiGlobalPath() {
    final box = Hive.box<String?>('path');
    return box.get('globalPath');
  }

  Module? getModule() {
    Box<Module> kModuleBox = Hive.box('kModule');
    return kModuleBox.get('module');
  }

  Student? getUserData() {
    final box = Hive.box<Student>('Student');
    return box.get('Student');
  }
}

// Create a provider for _instructorStatusOptions using Riverpod
final instructorStatusProvider = Provider<List<String>>((ref) {
  // You can modify this list dynamically if needed
  return [
    'Prof',
    'Dr',
    'Sir',
    'Miss',
    // Add more instructor status options as needed
  ];
});

// Create a provider for _courseStatusOptions using Riverpod
final courseStatusProvider = Provider<List<String>>((ref) {
  // You can modify this list dynamically if needed
  return [
    'Core',
    'Elective',
    // Add more course status options as needed
  ];
});

// Enum for study material options
enum StudyMaterialType {
  Lecture,
  Assignment,
  PracticalReport,
  ResearchPaper,
  Simbi,
  Quiz,
  Compendium,
}

// Provider for the selected study material type

final studyMaterialTypeProvider = Provider<List<String>>((ref) {
  // Define your list of study material options here.
  return ['Lecture', 'Simbi', 'Chat', 'Assignment', 'Practical Report', 'Research Paper', 'Compendium', 'Quiz'];
});

final simbiTypeProvider = Provider<List<String>>((ref) {
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

final boolProvider = Provider<bool>((ref) => false);
final downloadProgressProvider = Provider<double>((ref) => 0.0);
final originalColorProvider = Provider<Color>((ref) => Colors.black);

// Map<String, String> documentDownloadProgress = {};
final documentDownloadProgressProvider = StateProvider<Map<String, String>>((ref) => {});
final progressProvider = StateProvider<double>((ref) => 0.00);
