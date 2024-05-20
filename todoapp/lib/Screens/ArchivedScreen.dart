import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Shared/Cubit/cubit.dart';
import 'package:todoapp/Shared/Cubit/states.dart';

import '../widgets/taskBuilder.dart';

class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).archivedTasks;
        return taskbuilder(tasks: tasks);
      },
    );
  }
}
