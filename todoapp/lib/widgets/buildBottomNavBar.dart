import 'package:flutter/material.dart';
import 'package:todoapp/Shared/Cubit/cubit.dart';

Widget buildBottomNavigationBar(BuildContext context, AppCubit cubit) {
  final theme = Theme.of(context);
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: cubit.CurrentIndex,
    onTap: (index) {
      AppCubit.get(context).changeIndex(index);
      print(index);
    },
    backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
    elevation: 15.0,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.menu, color: theme.iconTheme.color),
        label: 'Tasks',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.checklist, color: theme.iconTheme.color),
        label: 'Finished',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.archive_outlined, color: theme.iconTheme.color),
        label: 'Archived',
      ),
    ],
  );
}
