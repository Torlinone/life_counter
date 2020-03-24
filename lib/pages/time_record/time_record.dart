import 'package:flutter/material.dart';
import 'package:lifecounter/commom/hive_model/count.dart';

class TimeRecordPage extends StatelessWidget {
  final List<RecordModel> records;

  TimeRecordPage(this.records);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('记录历史'), centerTitle: true),
      body: records == null || records.isEmpty
          ? Container()
          : ListView.builder(
              itemCount: records.length,
              itemBuilder: (BuildContext context, int index) => RecordItemWidget(records[index]),
            ),
    );
  }
}

class RecordItemWidget extends StatelessWidget {
  RecordItemWidget(this.record);

  final RecordModel record;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(record.title ?? '-'),
      subtitle: Text(record.value?.toString() ?? '100'),
    );
  }
}
