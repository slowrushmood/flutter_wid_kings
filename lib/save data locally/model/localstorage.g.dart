// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localstorage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalStrorageAdapter extends TypeAdapter<LocalStrorage> {
  @override
  final int typeId = 0;

  @override
  LocalStrorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalStrorage()..paragraph = (fields[0] as List).cast<Paragraph>();
  }

  @override
  void write(BinaryWriter writer, LocalStrorage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.paragraph);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalStrorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
