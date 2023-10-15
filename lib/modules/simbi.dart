import 'package:study_app/mindex.dart';
part 'simbi.g.dart';

@HiveType(typeId: 3)
class Simbi {
  @HiveField(0)
  final String year;

  @HiveField(1)
  final String downloadURL;

  @HiveField(2)
  final String id;

  @HiveField(3)
  final String type;

  @HiveField(4)
  final String subtype;

  @HiveField(5)
  final String name;

  Simbi({
    required this.year,
    required this.id,
    required this.downloadURL,
    required this.type,
    required this.subtype,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'year': year,
      'id': id,
      'downloadURL': downloadURL,
      'type': type,
      'subtype': subtype,
      'name': name,
    };
  }

  // Add a factory constructor to create a Note instance from a map.
  factory Simbi.fromMap(Map<String, dynamic> map) {
    return Simbi(
      id: map['id'] ?? '',
      year: map['year'] ?? '',
      downloadURL: map['downloadURL'] ?? '',
      type: map['type'] ?? '',
      subtype: map['subtype'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
