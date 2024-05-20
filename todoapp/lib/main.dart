import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Layouts/HomeLayout.dart';
import 'package:todoapp/theme/themes.dart';

import 'Shared/Cubit/blocObserver.dart';
import 'Shared/Cubit/cubit.dart';
import 'Shared/Cubit/states.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..CreateDataBase(),
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return MaterialApp(
            title: 'Flutter Demo',
            theme: buildLightTheme(),
            darkTheme: buildDarkTheme(),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}
