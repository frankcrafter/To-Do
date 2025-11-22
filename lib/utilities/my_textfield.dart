import 'package:flutter/material.dart';
import 'package:todo_app/utilities/my_button.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final VoidCallback onPressed;
  const MyTextField({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "What you doing today?",
              hintStyle: TextStyle(color: Colors.grey[400]),
              contentPadding: EdgeInsetsGeometry.fromLTRB(20, 15, 20, 15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.deepPurple[200]!,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.deepPurple[400]!,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        MyButton(onPressed: onPressed),
      ],
    );
  }
}
