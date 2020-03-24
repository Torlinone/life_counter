import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifecounter/app.dart';
import 'package:lifecounter/shared_state/time_counter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  return runApp(OKToast(
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TimeCounterProvider(),
        )
      ],
      child: LifeCounterApp(),
    ),
  ));
}
