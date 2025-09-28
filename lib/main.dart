import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'pages/HomePage.dart';

void main() async {
  //init Hive
  await Hive.initFlutter();
  var hiveBox=await Hive.openBox('todobox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.yellow,)  ),
      home: HomePage(),

    );
  }
}
