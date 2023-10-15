import 'package:study_app/mindex.dart';

part 'module.g.dart';

@HiveType(typeId: 1)
class Module {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String code;

  @HiveField(2)
  final String credit;

  @HiveField(3)
  final String status;

  @HiveField(4)
  final List instructors;

  @HiveField(5)
  final String id;

  @HiveField(6)
  String path;

  Module({
    required this.name,
    required this.code,
    required this.credit,
    required this.status,
    required this.instructors,
    required this.id,
    required this.path,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'status': status,
      'credit': credit,
      'instructors': instructors,
      'id': id,
      'path': path,
    };
  }

  factory Module.fromMap(Map<String, dynamic> map) {
    return Module(
      id: map['id'] ?? '',
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      path: map['path'] ?? '',
      credit: map['credit'] ?? 0,
      status: map['status'] ?? '',
      instructors: map['instructors'] ?? [],
    );
  }
}



// data_model.dart
