import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDotile extends StatelessWidget{
  final String taskname;
  final bool taskcomplet;
  Function(bool?)? onChanged;
  Function(BuildContext?)? deletetask;
   ToDotile({super.key,
    required this.taskname,
    required this.taskcomplet,
    required this.onChanged,
     required this.deletetask
  });

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
     child: Slidable(
       endActionPane: ActionPane(
         motion: StretchMotion(),
         children: [
           SlidableAction(onPressed: deletetask,
           icon: Icons.delete,
           backgroundColor: Colors.red.shade300,
           borderRadius: BorderRadius.circular(12),)
         ],
       ),
       child: Container(
         width: 400,
         //width: double.maxFinite,
         padding: EdgeInsets.all(24),
         child:
         Row(
           children: [
             Checkbox(value: taskcomplet, onChanged: onChanged,
               activeColor: Colors.black,),
             Expanded(child: Text(taskname,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,decoration:taskcomplet? TextDecoration.lineThrough:TextDecoration.none),)),
           ],
         ),
         decoration: BoxDecoration(color: Colors.indigoAccent,
         borderRadius: BorderRadius.circular(12)
         ),
       ),
     ),
   );
  }

}