import 'dart:io';

import 'package:flutter/material.dart';
import './models/task.dart';
import './widget/tasks_list.dart';
import './widget/new_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.amberAccent,
        errorColor: Colors.indigoAccent,
        textTheme: TextTheme(
            titleSmall: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.blueGrey,
            ),
            labelSmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            bodySmall: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: 'OpenSans',
                color: Colors.deepPurple)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Tasks> tasks = [];

  int taskNumber = 1;

  void _addNewTask(String text) {
    final anotherTask = Tasks(task: text, id: taskNumber);
    setState(() {
      tasks.add(anotherTask);
    });
    taskNumber++;
  }

  void _deleteTask(int id) {
    setState(() {
      tasks.removeWhere((element) => element.id == id);
      taskNumber--;
    });
  }

  void _showAddTaskDialog(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: null,
            child: NewTask(
              addFunc: _addNewTask,
            ),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text("To Do List"),
      actions: [
        IconButton(
          onPressed: () => _showAddTaskDialog(context),
          icon: Icon(Icons.add),
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  1,
              // margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: TaskList(listTask: tasks, deleteFunc: _deleteTask),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddTaskDialog(context),
      ),
    );
  }
}
