import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  const MyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.add),
      label: Text("Add"),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsetsGeometry.fromLTRB(25, 15, 25, 15),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 5,
        backgroundColor: Colors.deepPurple[400],
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
    );
  }
}
