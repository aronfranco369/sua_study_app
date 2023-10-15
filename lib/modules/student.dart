import 'package:hive/hive.dart';

part 'student.g.dart';

@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  final String university;

  @HiveField(1)
  final String college;

  @HiveField(2)
  final String course;

  @HiveField(3)
  final String year;

  @HiveField(4)
  final String semester;

  @HiveField(5)
  final String phonenum;

  @HiveField(6)
  final String email;

  @HiveField(7)
  final String username;

  @HiveField(8)
  final String registrationNumber;

  Student({
    required this.university,
    required this.college,
    required this.course,
    required this.year,
    required this.semester,
    required this.phonenum,
    required this.username,
    required this.email,
    required this.registrationNumber,
  });

  Student copyWith({
    String? university,
    String? course,
    String? year,
    String? semester,
    String? college,
    String? phonenum,
    String? email,
    String? username,
    String? registrationNumber,
  }) {
    return Student(
      university: university ?? this.university,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      username: username ?? this.username,
      course: course ?? this.course,
      year: year ?? this.year,
      semester: semester ?? this.semester,
      college: college ?? this.college,
      phonenum: phonenum ?? this.phonenum,
      email: email ?? this.email,
    );
  }
}
