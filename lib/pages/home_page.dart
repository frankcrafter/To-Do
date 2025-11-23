import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/pages/empty_page.dart';
import 'package:todo_app/utilities/my_box.dart';
import 'package:todo_app/utilities/my_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  late int taskAmount = taskList.length;

  List taskList = [
    ['coding new app', false],
    ['do homework', true],
    ['go to the gym', false],
  ];

  // checkbox
  void onChecked(int index, bool? value) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
  }

  // save task
  void onSave() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        taskList.add([_controller.text, false]);
        _controller.clear();
      }
    });
  }

  // delete a task
  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        foregroundColor: Colors.white,
        title: Text(
          "My To-Do List",
          style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(15, 15, 15, 15),
            child: MyTextField(controller: _controller, onPressed: onSave),
          ),
          taskList.isNotEmpty ? MyBox(taskList: taskList) : EmptyPage(),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return Task(
                  taskName: taskList[index][0],
                  taskCompleted: taskList[index][1],
                  onChanged: (value) => onChecked(index, value),
                  onDismissed: (direction) => deleteTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
