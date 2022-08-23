import 'package:flutter/material.dart';
import '../models/task.dart';
import './task_bar.dart';

class TaskList extends StatelessWidget {
  List<Tasks> listTask;
  final Function deleteFunc;

  TaskList({required this.listTask, required this.deleteFunc});

  Widget build(BuildContext context) {
    // return Column(
    //   children:listTask.map((e){
    //     return TaskBar(text: e.task, id: e.id);
    //   }).toList(),
    // );

    return listTask.isEmpty ? Column(
      children: [
        Text(
          "No tasks yet!!",
          style: Theme
              .of(context)
              .textTheme
              .titleSmall,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          // child: Image(
          //   image: AssetImage('assets/images/waiting.png',),
          //   fit: BoxFit.cover,
          // ),
          child: Image.asset(
            'assets/images/waiting.png',
            fit: BoxFit.cover,
          ),

        )
      ],
    )
        : ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.blueGrey, width: 2, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(
              // leading: Text(listTask[index].id.toString()),
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 25,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

              title: Text(
                listTask[index].task,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall,
              ),
              trailing: IconButton(
                onPressed: () {
                  deleteFunc(index + 1);
                },
                icon: Icon(Icons.delete_rounded),
                color: Theme
                    .of(context)
                    .errorColor,
              ),
            ),
          ),
        );
      },
      itemCount: listTask.length,
    );
  }
}
