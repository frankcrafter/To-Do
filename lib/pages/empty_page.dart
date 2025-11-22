import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.task_alt_outlined,
            size: 100,
            color: Colors.deepPurple[400],
          ),
          SizedBox(height: 30),
          Text(
            "No Tasks Yet!",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade800,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Looks like you get some relax today 😎",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueGrey.shade400,
              height: 1.5,
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
