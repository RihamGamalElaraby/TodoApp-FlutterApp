import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/Shared/Cubit/cubit.dart';
import 'package:todoapp/Shared/Cubit/states.dart';
import 'package:todoapp/Shared/globalVariables.dart';

class HomeLayout extends StatelessWidget {
  var titleContoller = TextEditingController();
  var dataContoller = TextEditingController();
  var timeContoller = TextEditingController();
  var statusContoller = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..CreateDataBase(),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (BuildContext context, AppStates state) {
          if (state is AppInsertDatabase) {
            Navigator.pop(context);
          }
        }, builder: (BuildContext context, AppStates) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 241, 179, 217),
              title: Center(
                  child: Text(
                cubit.Titles[cubit.CurrentIndex],
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: AutofillHints.creditCardGivenName,
                    fontStyle: FontStyle.italic),
              )),
            ),
            body: ConditionalBuilder(
              condition: !(AppStates is AppGetDatabaseLoadingState),
              builder: (context) => cubit.screens[cubit.CurrentIndex],
              fallback: (context) => Center(
                child: LinearProgressIndicator(),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState?.validate() ?? true) {
                    cubit.InserttoDataBase(
                      title: titleContoller,
                      time: timeContoller,
                      date: dataContoller,
                    );
                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        elevation: 40,
                        (context) => Container(
                          color: Color.fromARGB(255, 245, 207, 230),
                          padding: EdgeInsets.all(20.0),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
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
                                      decoration: InputDecoration(
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // TextFormField(
                                    //   onTap: () {
                                    //     print('Describtiontapped');
                                    //   },
                                    //   decoration: InputDecoration(
                                    //       icon: Icon(Icons.description),
                                    //       labelText: "Enter Describtion",
                                    //       hintText: "Describtion"),
                                    //   controller: statusContoller,
                                    //   keyboardType: TextInputType.text,
                                    //   validator: (value) {
                                    //     if (value == null || value.isEmpty) {
                                    //       return 'Please enter some text';
                                    //     }
                                    //     return null;
                                    //   },
                                    // ),
                                    SizedBox(
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
                                      decoration: InputDecoration(
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      // enabled: false,
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse('2030-12-31'),
                                        ).then((value) {
                                          dataContoller.text =
                                              DateFormat.yMMMd().format(value!);
                                        });
                                      },
                                      decoration: InputDecoration(
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
                    cubit.ChangeBottomSheet(isShow: false, Icon: Icons.edit);
                    titleContoller.clear();
                    statusContoller.clear();
                    timeContoller.clear();
                    dataContoller.clear();
                  });
                  cubit.ChangeBottomSheet(isShow: true, Icon: Icons.add);
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.CurrentIndex,
                onTap: (index) {
                  AppCubit.get(context).changeIndex(index);
                  print(index);
                },
                backgroundColor: Colors.grey,
                elevation: 15.0,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu), label: 'Tasks'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.checklist), label: 'Finished'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.archive_outlined), label: 'Archived'),
                ]),
          );
        }));
  }
}
