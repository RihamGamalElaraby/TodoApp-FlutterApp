import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Layouts/HomeLayout.dart';

import 'Shared/Cubit/blocObserver.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 241, 179, 217)),
          useMaterial3: true,
        ),
        home: HomeLayout());
  }
}
