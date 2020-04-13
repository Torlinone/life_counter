import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lifecounter/commom/hive_model/count.dart';
import 'package:lifecounter/pages/time_counter/new_time_count.dart';
import 'package:lifecounter/pages/time_record/time_record.dart';
import 'package:lifecounter/shared_state/time_counter.dart';
import 'package:lifecounter/widgets/count_item.dart';
import 'package:provider/provider.dart';

class TimeCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TimeCounterProvider>(
      builder: (BuildContext context, TimeCounterProvider provider, _) => Scaffold(
        appBar: AppBar(title: Text('Time Counter')),
        body: provider.loading
            ? Center(child: CircularProgressIndicator())
            : ValueListenableBuilder(
                valueListenable: provider.listenable,
                builder: (BuildContext context, Box<CountItemModel> box, _) {
                  if (box.values.isNotEmpty) {
                    return CounterList(list: box.values.toList(), provider: provider);
                  }

                  return Container();
                },
              ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
//            provider.addCountItem(CountItemModel.withDefaultValue());
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NewTimeCountPage()));
          },
        ),
      ),
    );
  }
}

class CounterList extends StatelessWidget {
  CounterList({this.list, this.provider});

  final List<CountItemModel> list;
  final TimeCounterProvider provider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        final data = list[index];

        return TimeCountItem(
          data: data,
          onTap: () {
            if (data.records != null && data.records.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => TimeRecordPage(data.records.toList()),
                ),
              );
            }
          },
          addOnTap: () {
            provider.addRecord(index, data);
          },
        );
      },
    );
    ;
  }
}
