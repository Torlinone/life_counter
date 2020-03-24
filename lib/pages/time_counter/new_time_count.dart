import 'package:flutter/material.dart';
import 'package:lifecounter/commom/hive_model/count.dart';
import 'package:lifecounter/shared_state/time_counter.dart';
import 'package:provider/provider.dart';

class NewTimeCountPage extends StatefulWidget {
  @override
  _NewTimeCountPageState createState() => _NewTimeCountPageState();
}

class _NewTimeCountPageState extends State<NewTimeCountPage> {
  final TextEditingController _titleCtrl = TextEditingController();

  CountType _countType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countType = CountType.time;
  }

  @override
  void dispose() {
    super.dispose();
    _titleCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('新建计数器'), centerTitle: true),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(controller: _titleCtrl),
              RadioListTile<CountType>(
                groupValue: _countType,
                value: CountType.point,
                title: Text('计分'),
                onChanged: (CountType value) {
                  setState(() {
                    _countType = value;
                  });
                },
              ),
              RadioListTile<CountType>(
                groupValue: _countType,
                value: CountType.time,
                title: Text('计次'),
                onChanged: (CountType value) {
                  setState(() {
                    _countType = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(
              child: OutlineButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: FlatButton(
                child: Text('确定'),
                onPressed: () {
                  final provider = Provider.of<TimeCounterProvider>(context, listen: false);
                  var item = CountItemModel.withDefaultValue();
                  item.title = _titleCtrl.text;
                  provider.addCountItem(item);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
