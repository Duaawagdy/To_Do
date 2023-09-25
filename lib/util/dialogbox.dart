import 'package:flutter/material.dart';
import 'package:to_doapp/util/Bottens.dart';

class dialogBox extends StatelessWidget{
  final controller;
  final controllerFrom;
  final controllerTo;
  VoidCallback onsave;
  VoidCallback oncancel;
   dialogBox({//super.key,
     required this.controller
     ,required this.onsave,
     required this.oncancel, required this.controllerFrom,required this.controllerTo});
  @override
  Widget build(BuildContext context) {
   return AlertDialog(
     backgroundColor: Colors.indigoAccent,
       content:
   Container(
     height:220 ,
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         TextField(
        controller: controller,
           decoration:
           InputDecoration(
               border: OutlineInputBorder(),
           hintText: 'Add New Task!') ,
         ),Row(children: [
           Text('from  '),
           SizedBox(
             height: 35,
             width: 75,
             child: TextField(
               controller: controllerFrom,
               decoration:
               InputDecoration(
                   border: OutlineInputBorder(),
                  ) ,
             ),
           ),Text('    To  '),
           SizedBox(
             height: 35,
             width: 75,
             child: TextField(
               showCursor: false,
               controller: controllerTo,
               decoration:
               InputDecoration(

                 border: OutlineInputBorder(),
               ) ,
             ),
           )
         ],),
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             bottun(text: "add", onPressed:onsave,),
             SizedBox(width: 12,),
             bottun(text: 'cancel', onPressed: oncancel,)

           ],
         )
       ],
     ),
   ));
  }
}