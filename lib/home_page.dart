import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_doapp/data/database.dart';
import 'package:to_doapp/util/dialogbox.dart';
import 'package:to_doapp/util/todo_stile.dart';

class homepage extends StatefulWidget{
   const homepage({super.key});
   @override
   State<homepage> createState()=> _homepagestate();}





class _homepagestate extends State<homepage>{
  TextEditingController _controller=TextEditingController();
  tododatabase dp= tododatabase();
  final _box=Hive.box('box');
  @override
  void initState(){
    if(_box.get('getdata')==null){
      dp.createinitdata();

    }else{
      dp.loaddata();
    }
    super.initState();
  }
  void checkchange(bool? value,int index){
    setState((){
    dp.todolist[index][1]=!dp.todolist[index][1];
    });
    dp.updatadata();
  }
  void savetask(){
    setState(() {
      dp.todolist.add([_controller.text,false]);
      _controller.clear();
    });
    dp.updatadata();
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
dp.updatadata();
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
          return ToDotile(taskname: dp.todolist[index][0],
            taskcomplet: dp.todolist[index][1],
            onChanged: (value)=>checkchange(value,index),
            deletetask: (Context ) => deletetask(index),);

        } ,)

    );

  }
}