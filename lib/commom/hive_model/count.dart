import 'package:hive/hive.dart';
import 'package:lifecounter/commom/utils/uuid.dart';

part 'count.g.dart';

@HiveType(typeId: 1)
enum CountType {
  @HiveField(0)
  time,
  @HiveField(1)
  point,
}

const CountTypeString = <CountType, String>{
  CountType.time: 'time',
  CountType.point: 'point',
};

@HiveType(typeId: 0)
class CountItemModel {
  @HiveField(0)
  DateTime createTime;

  @HiveField(1)
  DateTime updateTime;

  @HiveField(2)
  DateTime syncTime;

  @HiveField(3)
  String title;

  @HiveField(4)
  String description;

  @HiveField(5)
  int count;

  @HiveField(6)
  CountType type;

  @HiveField(7)
  String id;

  @HiveField(8)
  HiveList<RecordModel> records;

  @HiveField(9)
  int period;

  CountItemModel({
    this.createTime,
    this.updateTime,
    this.syncTime,
    this.description,
    this.count = 0,
    this.title,
    this.id,
  });

  CountItemModel.withDefaultValue({String description, int count = 0}) {
    final now = DateTime.now();
    createTime = now;
    updateTime = now;
    this.description = description;
    this.count = count;
    type = CountType.time;
    id = UuidUtil.v1();
    period = const Duration(days: 1).inMilliseconds;
  }
}

@HiveType(typeId: 2)
class RecordModel extends HiveObject {
  @HiveField(0)
  DateTime createTime;

  @HiveField(1)
  DateTime updateTime;

  @HiveField(2)
  DateTime recordTime;

  @HiveField(3)
  int value;

  @HiveField(4)
  String title;

  @HiveField(5)
  String description;

  @HiveField(6)
  String parentId;

  RecordModel({this.createTime, this.updateTime, this.recordTime, this.value, this.parentId});

  RecordModel.withDefaultValue({String description, int value = 1, String  parentId}) {
    final now = DateTime.now();
    createTime = now;
    updateTime = now;
    recordTime = now;
    this.value = value;
    this.parentId = parentId;
  }
}
