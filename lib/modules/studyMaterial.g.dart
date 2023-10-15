// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studyMaterial.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudyMaterialAdapter extends TypeAdapter<StudyMaterial> {
  @override
  final int typeId = 2;

  @override
  StudyMaterial read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudyMaterial(
      name: fields[0] as String,
      number: fields[1] as String,
      downloadURL: fields[2] as String,
      id: fields[3] as String,
      type: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudyMaterial obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.downloadURL)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudyMaterialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
