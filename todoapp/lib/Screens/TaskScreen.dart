import 'package:flutter/material.dart';
import 'package:todoapp/Shared/reuseabluComponent.dart';
import 'package:todoapp/Shared/globalVariables.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => buildTaskItem(tasks[index]),
      separatorBuilder: (context, index) => Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey,
      ),
      itemCount: tasks.length,
    );
  }
}
