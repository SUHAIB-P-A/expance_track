// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catagory_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryModelAdapter extends TypeAdapter<Category_Model> {
  @override
  final int typeId = 1;

  @override
  Category_Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category_Model(
      id: fields[0] as String,
      name: fields[1] as String,
      type: fields[3] as catagory_type,
      isDeleted: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Category_Model obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isDeleted)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class catagorytypeAdapter extends TypeAdapter<catagory_type> {
  @override
  final int typeId = 2;

  @override
  catagory_type read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return catagory_type.income;
      case 1:
        return catagory_type.expance;
      default:
        return catagory_type.income;
    }
  }

  @override
  void write(BinaryWriter writer, catagory_type obj) {
    switch (obj) {
      case catagory_type.income:
        writer.writeByte(0);
        break;
      case catagory_type.expance:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is catagorytypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
