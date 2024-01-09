import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/Screens/ArchivedScreen.dart';
import 'package:todoapp/Screens/FinishedScreen.dart';
import 'package:todoapp/Screens/TaskScreen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int CurrentIndex = 0;
  List<Widget> screens = [
    TaskScreen(),
    FinishedScreen(),
    ArchivedScreen(),
  ];
  List<String> Titles = ['Tasks Screen', 'Finished Screen', 'Archived Screen'];
  late Database database;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CreateDataBase();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 241, 179, 217),
        title: Center(
            child: Text(
          Titles[CurrentIndex],
          style: TextStyle(
              color: Colors.white,
              fontFamily: AutofillHints.creditCardGivenName,
              fontStyle: FontStyle.italic),
        )),
      ),
      body: screens[CurrentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottomSheetShown) {
            Navigator.pop(context);
            isBottomSheetShown = false;
            setState(() {
              fabIcon = Icons.edit;
            });
          } else {
            scaffoldKey.currentState!.showBottomSheet((context) => Container(
                  width: double.infinity,
                  height: 120.0,
                  color: Colors.red,
                ));
            isBottomSheetShown = true;
            setState(() {
              fabIcon = Icons.add;
            });
          }
        },
        child: Icon(fabIcon),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: CurrentIndex,
          onTap: (index) {
            setState(() {
              CurrentIndex = index;
            });
            print(index);
          },
          backgroundColor: Colors.grey,
          elevation: 15.0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.checklist), label: 'Finished'),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive_outlined), label: 'Archived'),
          ]),
    );
  }

  void CreateDataBase() async {
    database = await openDatabase('todo.db', version: 1,
        onCreate: (database, version) {
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
      print('databaseopened');
    });
  }

  void InserttoDataBase() async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks (title, date, time, status) VALUES("First task", "011", "dd", "hi")')
          .then((value) {
        print('$value inserted done');
      }).catchError((error) {
        print('Error while inserting: ${error.toString()}');
      });
    });
  }

  void DeleteFromDataBase() {}
  void UpdateDatabase() {}
}
