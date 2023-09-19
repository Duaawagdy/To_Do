import 'package:hive/hive.dart';

class tododatabase{
  List todolist=[

  ];
  final _box=Hive.box('box');
  void createinitdata(){
    todolist=[
      ['make your tasks!',false]
    ];

  }
  void loaddata(){
todolist=_box.get('getdata');
  }
  void updatadata(){
_box.put('getdata', todolist);
  }
}