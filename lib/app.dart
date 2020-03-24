import 'package:flutter/material.dart';
import 'package:lifecounter/pages/time_counter/time_counter.dart';

class LifeCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Counter',
      home: TimeCounterPage(),
    );
  }
}
