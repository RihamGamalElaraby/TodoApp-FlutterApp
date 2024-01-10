import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Shared/Cubit/states.dart';
import 'package:todoapp/Screens/ArchivedScreen.dart';
import 'package:todoapp/Screens/FinishedScreen.dart';
import 'package:todoapp/Screens/TaskScreen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  AppCubit() : super(initalstate());

  static AppCubit get(context) => BlocProvider.of(context);
  int CurrentIndex = 0;
  late Database database;
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  List<Widget> screens = [
    TaskScreen(),
    FinishedScreen(),
    ArchivedScreen(),
  ];
  List<String> Titles = ['Tasks Screen', 'Finished Screen', 'Archived Screen'];

  void changeIndex(int index) {
    CurrentIndex = index;
    emit(AppChangeBottomNaVbar());
  }

  void ChangeBottomSheet({
    required bool isShow,
    required IconData Icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = Icon;

    emit(AppChangeBottomSheetChange());
  }

  void CreateDataBase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) {
      print('databasecreated');
      database
          .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
          .then((value) {
        print('Table created');
      }).catchError((error) {
        print('Error: ${error.toString()}');
      });
    }, onOpen: (database) {
      getData(database);

      print('databaseopened');
    }).then((value) {
      database = value;
      emit(AppCreateDatabase());
    });
  }

  void getData(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];

    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else
          archivedTasks.add(element);
      });

      emit(AppGetDatabase());
    });
  }

  void InserttoDataBase({
    required TextEditingController title,
    required TextEditingController time,
    required TextEditingController date,
  }) {
    database.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO tasks (title, date, time, status) VALUES("${title.text}", "${date.text}", "${time.text}", "new")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabase());
        getData(database);
      });
    });
  }

  void UpdateDatabase({
    required String status,
    required int id,
  }) {
    database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', '$id']).then((value) {
      getData(database);
      emit(AppUpdateDatabase());
    });
  }

  void DeleteFromDataBase({
    required int id,
  }) {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getData(database);
      emit(AppDeleteDatabase());
    });
  }
}
