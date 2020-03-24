import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:lifecounter/commom/hive_model/count.dart';
import 'package:lifecounter/commom/config/config.dart';

class TimeCounterProvider with ChangeNotifier {
  TimeCounterProvider() {
    init();
  }

  Box<CountItemModel> _countBox;
  Box<RecordModel> _recordBox;

  ValueListenable<Box<CountItemModel>> get listenable =>
      Hive.box<CountItemModel>(Config.TIME_COUNT_BOX_NAME).listenable();

  bool get loading => _loading;
  bool _loading = false;

  Future<void> init() async {
    _loading = true;
    notifyListeners();
    _registerAdapters();
    _countBox = await Hive.openBox<CountItemModel>(Config.TIME_COUNT_BOX_NAME);
    _recordBox = await Hive.openBox<RecordModel>(Config.TIME_COUNT_RECORD_BOX_NAME);
    _loading = false;
    notifyListeners();
  }

  void _registerAdapters() {
    Hive.registerAdapter<CountItemModel>(CountItemModelAdapter());
    Hive.registerAdapter<CountType>(CountTypeAdapter());
    Hive.registerAdapter<RecordModel>(RecordModelAdapter());
  }

  Future<void> addCountItem(CountItemModel item) async {
    await _countBox?.add(item);
  }

  Future<void> addRecord(int index, CountItemModel item) async {
    item.records ??= HiveList<RecordModel>(_recordBox);
    final record = RecordModel.withDefaultValue();
    await _recordBox.add(record);
    item.records.add(record);
    item.count = item.records.length;
    await _countBox.put(index, item);
  }

  @override
  void dispose() {
    super.dispose();
    _recordBox?.close();
  }
}
