import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {

  final Function addFunc;


  NewTask({required this.addFunc});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final tasksController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              decoration: InputDecoration(
                  labelText: "Task",
                  labelStyle:Theme.of(context).textTheme.labelSmall,
              ),
              keyboardType: TextInputType.text,
              autofocus: true,
              controller: tasksController,
            ),
            RaisedButton(
              onPressed: (){
                widget.addFunc(tasksController.text);
              },
              child: Text("Add Task"),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
          ]),
        ));
  }
}
