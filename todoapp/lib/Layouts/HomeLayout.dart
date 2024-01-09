import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/Screens/ArchivedScreen.dart';
import 'package:todoapp/Screens/FinishedScreen.dart';
import 'package:todoapp/Screens/TaskScreen.dart';
import 'package:todoapp/Shared/globalVariables.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var titleContoller = TextEditingController();
  var dataContoller = TextEditingController();
  var timeContoller = TextEditingController();
  var statusContoller = TextEditingController();

  int CurrentIndex = 0;
  List<Widget> screens = [
    const TaskScreen(),
    const FinishedScreen(),
    const ArchivedScreen(),
  ];
  List<String> Titles = ['Tasks Screen', 'Finished Screen', 'Archived Screen'];
  late Database database;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CreateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 179, 217),
        title: Center(
            child: Text(
          Titles[CurrentIndex],
          style: const TextStyle(
              color: Colors.white,
              fontFamily: AutofillHints.creditCardGivenName,
              fontStyle: FontStyle.italic),
        )),
      ),
      body: tasks.isEmpty
          ? const Center(child: LinearProgressIndicator())
          : screens[CurrentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottomSheetShown) {
            if (formKey.currentState?.validate() ?? true) {
              InserttoDataBase(
                      title: titleContoller,
                      time: timeContoller,
                      date: dataContoller,
                      description: statusContoller)
                  .then((value) {
                getData(database).then((value) {
                  Navigator.pop(context);
                  setState(() {
                    isBottomSheetShown = false;
                    fabIcon = Icons.edit;
                    tasks = value;
                    print(tasks);
                  });
                });
              });
            }
          } else {
            scaffoldKey.currentState!
                .showBottomSheet(
                  elevation: 40,
                  (context) => Container(
                    color: const Color.fromARGB(255, 245, 207, 230),
                    padding: const EdgeInsets.all(20.0),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                onTap: () {
                                  print('titletapped');
                                },
                                decoration: const InputDecoration(
                                    icon: Icon(Icons.title),
                                    labelText: "Enter Title",
                                    hintText: "Title"),
                                controller: titleContoller,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                onTap: () {
                                  print('Describtiontapped');
                                },
                                decoration: const InputDecoration(
                                    icon: Icon(Icons.description),
                                    labelText: "Enter Describtion",
                                    hintText: "Describtion"),
                                controller: statusContoller,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                // enabled: false,
                                onTap: () {
                                  showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now())
                                      .then((value) {
                                    timeContoller.text =
                                        value!.format(context).toString();
                                  });
                                },
                                decoration: const InputDecoration(
                                    icon: Icon(Icons.watch),
                                    labelText: "Enter Time",
                                    hintText: "Time"),
                                controller: timeContoller,
                                keyboardType: TextInputType.datetime,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                // enabled: false,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2030-12-31'),
                                  ).then((value) {
                                    dataContoller.text =
                                        DateFormat.yMMMd().format(value!);
                                  });
                                },
                                decoration: const InputDecoration(
                                    icon: Icon(Icons.date_range),
                                    labelText: "Enter Data",
                                    hintText: "Date"),
                                controller: dataContoller,
                                keyboardType: TextInputType.datetime,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .closed
                .then((value) {
              isBottomSheetShown = false;
              setState(() {
                fabIcon = Icons.edit;
              });
            });
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
          items: const [
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
      getData(database).then((value) {
        setState(() {
          tasks = value;
          print(tasks);
        });
      });

      print('databaseopened');
    });
  }

  Future<void> InserttoDataBase({
    required TextEditingController title,
    required TextEditingController time,
    required TextEditingController date,
    required TextEditingController description,
  }) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO tasks (title, date, time, status) VALUES("${title.text}", "${date.text}", "${time.text}", "${description.text}")',
      )
          .then((value) {
        print('$value inserted successfully');
      }).catchError((error) {
        print('Error while inserting: ${error.toString()}');
      });
    });
  }

  Future<List<Map<String, dynamic>>> getData(database) async {
    return await database.rawQuery('SELECT * FROM tasks');
  }

  void DeleteFromDataBase() {}
  void UpdateDatabase() {}
}
