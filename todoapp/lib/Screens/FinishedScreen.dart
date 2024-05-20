import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Shared/Cubit/cubit.dart';
import 'package:todoapp/Shared/Cubit/states.dart';
import 'package:todoapp/widgets/taskBuilder.dart';

class FinishedScreen extends StatelessWidget {
  const FinishedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).doneTasks;
        return taskbuilder(tasks: tasks);
      },
    );
  }
}
