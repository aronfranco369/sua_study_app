// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentAdapter extends TypeAdapter<Student> {
  @override
  final int typeId = 0;

  @override
  Student read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Student(
      university: fields[0] as String,
      college: fields[1] as String,
      course: fields[2] as String,
      year: fields[3] as String,
      semester: fields[4] as String,
      phonenum: fields[5] as String,
      username: fields[7] as String,
      email: fields[6] as String,
      registrationNumber: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Student obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.university)
      ..writeByte(1)
      ..write(obj.college)
      ..writeByte(2)
      ..write(obj.course)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.semester)
      ..writeByte(5)
      ..write(obj.phonenum)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.username)
      ..writeByte(8)
      ..write(obj.registrationNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
