import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 117, 5),
        // leading: ,
        title: Center(
            child: const Text(
          'ToDo App',
          style: TextStyle(
              color: Colors.white,
              fontFamily: AutofillHints.creditCardGivenName,
              fontStyle: FontStyle.italic),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          // type: ,
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
