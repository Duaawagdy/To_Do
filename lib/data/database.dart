import 'package:hive/hive.dart';
import '../model/todoitem.dart';

class tododatabase {
  List<TodoItem> todolist = [];
  final _box = Hive.box('box');

  void createinitdata() {
    todolist = [
      TodoItem('Make your tasks!', false),
    ];
  }

  void loadData() {
    final dynamicData = _box.get('getdata');
    if (dynamicData != null) {
      todolist = (dynamicData as List<dynamic>).map((item) {
        if (item is List<dynamic>) {
          return TodoItem(item[0] as String, item[1] as bool);
        } else if (item is bool) {
          // Handle boolean values if necessary
          // For example, you can add a default TodoItem
          return TodoItem('Default Task', item);
        } else {
          // Handle other data types if needed
          return TodoItem('Default Task', false);
        }
      }).toList();
      print(todolist);
    }
  }

  void updateData() {
    final dynamicData = todolist.map((item) => [item.taskName, item.isCompleted]).toList();
    _box.put('getdata', dynamicData);
    print(todolist);
  }
}
