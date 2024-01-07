import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
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
}
