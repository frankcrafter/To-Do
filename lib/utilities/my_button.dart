import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnName;
  final Icon? iconType;
  final double fontSize;
  const MyButton({
    super.key,
    required this.onPressed,
    required this.btnName,
    required this.iconType,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: iconType,
      label: Text(btnName),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsetsGeometry.fromLTRB(25, 15, 25, 15),
        textStyle: TextStyle(fontSize: fontSize),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.2,
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        elevation: 1,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      onPressed: onPressed,
    );
  }
}
