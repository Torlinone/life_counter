// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountTypeAdapter extends TypeAdapter<CountType> {
  @override
  final typeId = 1;

  @override
  CountType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CountType.time;
      case 1:
        return CountType.point;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, CountType obj) {
    switch (obj) {
      case CountType.time:
        writer.writeByte(0);
        break;
      case CountType.point:
        writer.writeByte(1);
        break;
    }
  }
}

class CountItemModelAdapter extends TypeAdapter<CountItemModel> {
  @override
  final typeId = 0;

  @override
  CountItemModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountItemModel(
      createTime: fields[0] as DateTime,
      updateTime: fields[1] as DateTime,
      syncTime: fields[2] as DateTime,
      description: fields[4] as String,
      count: fields[5] as int,
      title: fields[3] as String,
      id: fields[7] as String,
    )
      ..type = fields[6] as CountType
      ..records = (fields[8] as HiveList)?.castHiveList()
      ..period = fields[9] as int;
  }

  @override
  void write(BinaryWriter writer, CountItemModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.createTime)
      ..writeByte(1)
      ..write(obj.updateTime)
      ..writeByte(2)
      ..write(obj.syncTime)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.count)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.records)
      ..writeByte(9)
      ..write(obj.period);
  }
}

class RecordModelAdapter extends TypeAdapter<RecordModel> {
  @override
  final typeId = 2;

  @override
  RecordModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecordModel(
      createTime: fields[0] as DateTime,
      updateTime: fields[1] as DateTime,
      recordTime: fields[2] as DateTime,
      value: fields[3] as int,
      parentId: fields[6] as String,
    )
      ..title = fields[4] as String
      ..description = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, RecordModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.createTime)
      ..writeByte(1)
      ..write(obj.updateTime)
      ..writeByte(2)
      ..write(obj.recordTime)
      ..writeByte(3)
      ..write(obj.value)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.parentId);
  }
}
