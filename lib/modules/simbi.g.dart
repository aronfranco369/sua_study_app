// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simbi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SimbiAdapter extends TypeAdapter<Simbi> {
  @override
  final int typeId = 3;

  @override
  Simbi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Simbi(
      year: fields[0] as String,
      id: fields[2] as String,
      downloadURL: fields[1] as String,
      type: fields[3] as String,
      subtype: fields[4] as String,
      name: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Simbi obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.year)
      ..writeByte(1)
      ..write(obj.downloadURL)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.subtype)
      ..writeByte(5)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SimbiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
