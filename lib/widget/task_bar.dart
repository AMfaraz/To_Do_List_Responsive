import 'package:flutter/material.dart';

class TaskBar extends StatelessWidget {

  final String text;
  final int id;

  TaskBar({required this.text, required this.id});

  Widget build(BuildContext context) {
    return Card(

      child: ListTile(
        leading: Text(id.toString()),
        title: Text(text, style: Theme
            .of(context)
            .textTheme
            .titleSmall,)
    ),
    );
  }
}