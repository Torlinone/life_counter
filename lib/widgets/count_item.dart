import 'package:flutter/material.dart';
import 'package:lifecounter/commom/hive_model/count.dart';

abstract class CountItemBase implements Widget {
  CountItemBase({@required this.data});

  final CountItemModel data;
}

/// 计数组件
class TimeCountItem extends StatelessWidget implements CountItemBase {
  TimeCountItem({Key key, @required this.data, this.onTap, this.addOnTap}) : super(key: key);

  @override
  final CountItemModel data;

  final VoidCallback onTap;
  final VoidCallback addOnTap;

  final double height = 60;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Color(0xFFFAFAFD), blurRadius: 8)],
        border: Border.all(width: 2, color: Color(0xFFD6A1FF)),
      ),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(14),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap ?? () {},
          child: Container(
            height: height + 4,
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: height,
                  width: height,
                  child: Center(
                    child: Text(
                      data?.count?.toString() ?? '0',
                      style: TextStyle(color: Color(0xFFD6A1FF), fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0x2F4A4ADF),
                    borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Text('${data.title ?? '新建计数'}'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Color(0xFFD6A1FF)),
                  onPressed: addOnTap ?? () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
