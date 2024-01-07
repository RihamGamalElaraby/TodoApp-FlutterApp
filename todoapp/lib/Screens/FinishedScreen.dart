import 'package:flutter/material.dart';

class FinishedScreen extends StatelessWidget {
  const FinishedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Finished',
      style: TextStyle(fontSize: 20, color: Colors.black),
    ));
  }
}
