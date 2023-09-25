import 'package:flutter/material.dart';

class notemoddel{
  notemoddel( {
 required this.taskfrom,required this.taskto,
    required this.taskname,
    required this.taskcomplet,
    required this.onChanged,
    required this.deletetask
  });
  final String taskname;
  final String taskfrom;
  final String taskto;
  final bool taskcomplet;
  Function(bool?)? onChanged;
  Function(BuildContext?)? deletetask;
}