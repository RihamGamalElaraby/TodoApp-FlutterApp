import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Shared/Cubit/states.dart';
import 'package:todoapp/Shared/reuseabluComponent.dart';
import 'package:todoapp/Shared/Cubit/cubit.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newTasks;
        return taskbuilder(tasks: tasks);
      },
    );
  }
}
