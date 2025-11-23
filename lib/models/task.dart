import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(DismissDirection) onDismissed;
  const Task({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(15, 0, 15, 15),
      child: Dismissible(
        key: Key(taskName),
        onDismissed: onDismissed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.deepPurple[400],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(100), // shadow color
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(15, 15, 25, 15),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.deepPurple[400],
                  side: BorderSide(color: Colors.white, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Expanded(
                  child: Text(
                    taskName.toUpperCase(),
                    style: TextStyle(
                      color: taskCompleted
                          ? Colors.white.withAlpha(150)
                          : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationThickness: 2,
                      decorationColor: Colors.white.withAlpha(150),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
