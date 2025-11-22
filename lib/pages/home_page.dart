import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/pages/empty_page.dart';
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

  double getProgress() {
    int done = taskList.where((t) => t[1] == true).length;
    return taskList.isEmpty ? 0 : done / taskList.length;
  }

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
    double progress = getProgress();
    int percent = (progress * 100).round();

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
          taskList.isNotEmpty
              ? Padding(
                  padding: EdgeInsetsGeometry.fromLTRB(15, 0, 15, 15),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      border: BoxBorder.all(
                        width: 2.5,
                        color: Colors.deepPurple[400]!,
                      ),
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsetsGeometry.fromLTRB(15, 15, 15, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //leftCenter(
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TweenAnimationBuilder<double>(
                                tween: Tween<double>(
                                  begin: 0,
                                  end: getProgress(),
                                ),
                                duration: Duration(milliseconds: 350),
                                builder: (context, value, child) {
                                  return Column(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CircularProgressIndicator(
                                            backgroundColor: Colors.grey[500],
                                            constraints: BoxConstraints(
                                              minWidth: 100,
                                              minHeight: 100,
                                            ),
                                            value: value,
                                          ),
                                          Text(
                                            "$percent%",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                          //right Center(
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Total Task",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                taskList.length.toString(),
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.deepPurple[400],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : EmptyPage(),
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
