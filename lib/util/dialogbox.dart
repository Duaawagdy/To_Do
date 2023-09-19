import 'package:flutter/material.dart';
import 'package:to_doapp/util/Bottens.dart';

class dialogBox extends StatelessWidget{
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;
   dialogBox({//super.key,
     required this.controller
     ,required this.onsave,
     required this.oncancel});
  @override
  Widget build(BuildContext context) {
   return AlertDialog(
     backgroundColor: Colors.indigoAccent,
       content:
   Container(
     height:120 ,
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         TextField(
controller: controller,
           decoration:
           InputDecoration(
               border: OutlineInputBorder(),
           hintText: 'Add New Task!') ,
         ),
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