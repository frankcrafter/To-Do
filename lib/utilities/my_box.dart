import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  final List taskList;
  const MyBox({super.key, required this.taskList});

  @override
  Widget build(BuildContext context) {
    double getProgress(taskList) {
      int done = taskList.where((t) => t[1] == true).length;
      return taskList.isEmpty ? 0 : done / taskList.length;
    }

    double progress = getProgress(taskList);
    int percent = (progress * 100).round();

    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(15, 0, 15, 15),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(40),
                  blurRadius: 20,
                  spreadRadius: 1,
                  offset: Offset(0, 10),
                ),
              ],
              border: BoxBorder.all(
                width: 2,
                color: Theme.of(context).colorScheme.surface,
              ),
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.fromLTRB(50, 50, 50, 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //leftCenter(
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(
                          begin: 0,
                          end: getProgress(taskList),
                        ),
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastEaseInToSlowEaseOut,
                        builder: (context, value, child) {
                          return Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                                    backgroundColor: Theme.of(
                                      context,
                                    ).colorScheme.primary,
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
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondary,
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
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Text(
                        taskList.length.toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
