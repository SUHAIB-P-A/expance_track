// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransationModelAdapter extends TypeAdapter<TransationModel> {
  @override
  final int typeId = 3;

  @override
  TransationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransationModel(
      purpos: fields[1] as String,
      amount: fields[2] as double,
      date: fields[3] as DateTime,
      type: fields[4] as catagory_type,
      listitemscategory: fields[5] as Category_Model,
    )..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, TransationModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.purpos)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.listitemscategory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
