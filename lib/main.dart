import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_doapp/home_page.dart';
import 'package:hive/hive.dart';

void main() async{
  runApp(const MyApp());
  await Hive.initFlutter();
  var box =Hive.openBox('box');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home: homepage(),
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}
