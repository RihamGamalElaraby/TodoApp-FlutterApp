import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/widgets/buildTaskItem.dart';

Widget taskbuilder({
  required List<Map> tasks,
}) =>
    ConditionalBuilder(
        condition: tasks.isNotEmpty,
        builder: (context) => ListView.separated(
              itemBuilder: (context, index) =>
                  buildTaskItem(tasks[index], context),
              separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey,
              ),
              itemCount: tasks.length,
            ),
        fallback: (context) => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu,
                    size: 100.0,
                    color: Colors.grey,
                  ),
                  Text(
                    'No tasks Yet, Please add some tasks!',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ));
