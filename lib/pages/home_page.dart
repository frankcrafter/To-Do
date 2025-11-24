import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/pages/empty_page.dart';
import 'package:todo_app/themes/theme_provider.dart';
import 'package:todo_app/utilities/dialog_box.dart';
import 'package:todo_app/utilities/my_box.dart';
import 'package:todo_app/utilities/my_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _updateController = TextEditingController();
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

  // edit task
  void editTask(int index) {
    setState(() {
      showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _updateController,
            onEdit: () => updateTask(index),
            onCancel: Navigator.of(context).pop,
          );
        },
      );
    });
  }

  //update task
  void updateTask(int index) {
    setState(() {
      if (!taskList[index][1]) {
        taskList[index][0] = _updateController.text;
      }
      _updateController.clear();
    });
    Navigator.of(context).pop();
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 15),
            child: IconButton(
              style: IconButton.styleFrom(
                padding: EdgeInsetsGeometry.all(15),
                backgroundColor: Theme.of(context).colorScheme.surface,
                side: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: Icon(
                Theme.of(context).brightness == Brightness.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
              onPressed: () {
                Provider.of<ThemeProvider>(
                  context,
                  listen: false,
                ).toggleTheme();
              },
            ),
          ),
        ],
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
                  onPressed: () => editTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
