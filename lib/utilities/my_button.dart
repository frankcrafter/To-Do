import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  const MyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple[400],
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(5, 15, 5, 15),
        child: Text(
          "+  Add",
          style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
