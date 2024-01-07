import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'tasks',
      style: TextStyle(fontSize: 20, color: Colors.black),
    ));
  }
}
