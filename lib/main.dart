import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_doapp/Home_page.dart';
import 'package:hive/hive.dart';

void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox('box');
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}