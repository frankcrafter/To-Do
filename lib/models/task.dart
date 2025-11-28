import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function()? onPressed;
  final Function(DismissDirection) onDismissed;
  const Task({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.onDismissed,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!taskCompleted);
        }
      },
      child: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(15, 0, 15, 15),
        child: Dismissible(
          key: Key(taskName),
          direction: DismissDirection.endToStart,
          onDismissed: onDismissed,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(40),
                  blurRadius: 20,
                  spreadRadius: 1,
                  offset: Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.circular(25),
              color: taskCompleted
                  ? Theme.of(context).colorScheme.inverseSurface
                  : Theme.of(context).colorScheme.surface,
              border: BoxBorder.all(
                width: 0.5,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.fromLTRB(15, 15, 20, 15),
              child: Row(
                children: [
                  Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                    activeColor: Theme.of(context).colorScheme.inverseSurface,
                    checkColor: Colors.white,
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        taskName,
                        style: TextStyle(
                          color: taskCompleted
                              ? Theme.of(context).colorScheme.tertiary
                              : Theme.of(context).colorScheme.inversePrimary,
                          decoration: taskCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          decorationThickness: 1.5,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  if (!taskCompleted)
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 20,
                      ),
                      onPressed: onPressed,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
