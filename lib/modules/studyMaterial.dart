// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:study_app/mindex.dart';

part 'studyMaterial.g.dart';

@HiveType(typeId: 2)
class StudyMaterial {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String number;

  @HiveField(2)
  final String downloadURL;

  @HiveField(3)
  final String id;

  @HiveField(4)
  final String type;

  StudyMaterial({
    required this.name,
    required this.number,
    required this.downloadURL,
    required this.id,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'number': number,
      'downloadURL': downloadURL,
      'id': id,
      'type': type,
    };
  }

  // Add a factory constructor to create a Note instance from a map.
  factory StudyMaterial.fromMap(Map<String, dynamic> map) {
    return StudyMaterial(
      name: map['name'] as String,
      number: map['number'] as String,
      downloadURL: map['downloadURL'] as String,
      id: map['id'] as String,
      type: map['type'] as String,
    );
  }

  StudyMaterial copyWith({
    String? name,
    String? number,
    String? downloadURL,
    String? id,
    String? type,
  }) {
    return StudyMaterial(
      name: name ?? this.name,
      number: number ?? this.number,
      downloadURL: downloadURL ?? this.downloadURL,
      id: id ?? this.id,
      type: type ?? this.type,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudyMaterial.fromJson(String source) => StudyMaterial.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudyMaterial(name: $name, number: $number, downloadURL: $downloadURL, id: $id, type: $type)';
  }

  @override
  bool operator ==(covariant StudyMaterial other) {
    if (identical(this, other)) return true;

    return other.name == name && other.number == number && other.downloadURL == downloadURL && other.id == id && other.type == type;
  }

  @override
  int get hashCode {
    return name.hashCode ^ number.hashCode ^ downloadURL.hashCode ^ id.hashCode ^ type.hashCode;
  }
}
