import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_doapp/data/database.dart';
import 'package:to_doapp/model/notemodel.dart';
import 'package:to_doapp/util/dialogbox.dart';
import 'package:to_doapp/util/todo_stile.dart';

import 'model/todoitem.dart';

class Homepage extends StatefulWidget{
  const Homepage({super.key});
  @override
  State<Homepage> createState()=> _homepagestate();}





class _homepagestate extends State<Homepage>{
  TextEditingController _controller=TextEditingController();
  tododatabase dp= tododatabase();
  final _box=Hive.box('box');
  @override
  void initState(){
    if(_box.get('getdata')==null){
      dp.createinitdata();

    }else{
      dp.loadData();
    }
    super.initState();
  }
  void checkchange(bool? value,int index){
    setState(() {
      if (index >= 0 && index < dp.todolist.length) {
        // Toggle the 'isCompleted' property of the TodoItem
        dp.todolist[index].isCompleted = !dp.todolist[index].isCompleted;
      }
    });
    dp.updateData();
  }
  void savetask(){
    setState(() {
      dp.todolist.add(TodoItem(_controller.text, false));
      _controller.clear();
    });
    dp.updateData();
    Navigator.of(context).pop();

  }



  void createtask(){
    showDialog(context: context, builder:(context){
      return dialogBox(
        controller: _controller,
        onsave:
        savetask
        ,
        oncancel:
            ()=>
            Navigator.of(context).pop()


        ,

      );
    });
  }
  void deletetask(int index){
    setState(() {
      dp.todolist.removeAt(index);
    });
    dp.updateData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(centerTitle: true,title:Text('To Do') ,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createtask,
          child: Icon(Icons.add),
        ),
        body:
        ListView.builder(itemCount: dp.todolist.length,
          itemBuilder:(context,index){
            return ToDotile(nm: notemoddel(taskname: dp.todolist[index].taskName,
                taskcomplet: dp.todolist[index].isCompleted,
                onChanged: (value)=>checkchange(value,index),
                deletetask: (Context ) => deletetask(index) ));



            /*ToDotile(taskname: dp.todolist[index][0],
              taskcomplet: dp.todolist[index][1],
              onChanged: (value)=>checkchange(value,index),
              deletetask: (Context ) => deletetask(index),);
              */

          } ,)

    );

  }
}