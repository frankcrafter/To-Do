import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/database.dart';
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
  final _myBox = Hive.box("my_box");
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TASKLIST") == null) {
      db.createData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();
  final _updateController = TextEditingController();
  late int taskAmount = db.taskList.length;

  // checkbox
  void onChecked(int index, bool? value) {
    setState(() {
      db.taskList[index][1] = !db.taskList[index][1];
    });
    db.updateData();
  }

  // create task
  void onSave() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        db.taskList.add([_controller.text, false]);
        _controller.clear();
      }
    });
    db.updateData();
  }

  // dialog for edit task
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
    db.updateData();
  }

  //edit task
  void updateTask(int index) {
    setState(() {
      if (!db.taskList[index][1] && _updateController.text.isNotEmpty) {
        db.taskList[index][0] = _updateController.text;
      }
      _updateController.clear();
    });
    db.updateData();
    Navigator.of(context).pop();
  }

  // delete a task
  void deleteTask(int index) {
    setState(() {
      db.taskList.removeAt(index);
    });
    db.updateData();
  }

  // update theme
  void updateTheme() {
    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
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
              ),
              icon: Icon(
                Theme.of(context).brightness == Brightness.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
              onPressed: updateTheme,
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
          db.taskList.isNotEmpty ? MyBox(taskList: db.taskList) : EmptyPage(),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.only(top: 0),
              child: ListView.builder(
                itemCount: db.taskList.length,
                itemBuilder: (context, index) {
                  return Task(
                    taskName: db.taskList[index][0],
                    taskCompleted: db.taskList[index][1],
                    onChanged: (value) => onChecked(index, value),
                    onDismissed: (direction) => deleteTask(index),
                    onPressed: () => editTask(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
