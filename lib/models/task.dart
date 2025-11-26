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
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(15, 0, 15, 15),
      child: Dismissible(
        key: Key(taskName),
        direction: DismissDirection.endToStart,
        onDismissed: onDismissed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(120), // shadow color
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(15, 15, 20, 15),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                    activeColor: Theme.of(context).colorScheme.surface,
                    checkColor: Theme.of(context).colorScheme.inverseSurface,
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    taskName.toUpperCase(),
                    style: TextStyle(
                      color: taskCompleted
                          ? Theme.of(
                              context,
                            ).colorScheme.inversePrimary.withAlpha(150)
                          : Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationThickness: 2,
                      decorationColor: Theme.of(
                        context,
                      ).colorScheme.inversePrimary.withAlpha(150),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onPressed,
                  icon: !taskCompleted
                      ? Icon(
                          Icons.edit,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 20,
                        )
                      : Icon(null),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
