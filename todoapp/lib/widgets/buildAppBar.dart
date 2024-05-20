import 'package:flutter/material.dart';
import 'package:todoapp/Shared/Cubit/cubit.dart';

PreferredSizeWidget buildAppBar(BuildContext context, AppCubit cubit) {
  final theme = Theme.of(context);
  return AppBar(
    backgroundColor: theme.primaryColor,
    actions: [
      Switch(
        value: cubit.isDark,
        onChanged: (value) {
          cubit.toggleTheme();
        },
      )
    ],
    title: Center(
      child: Text(
        cubit.Titles[cubit.CurrentIndex],
        style: TextStyle(
          color: theme.textTheme.headline6!.color,
          fontFamily: theme.textTheme.headline6!.fontFamily,
          fontStyle: theme.textTheme.headline6!.fontStyle,
        ),
      ),
    ),
  );
}
