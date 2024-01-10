import 'package:flutter/material.dart';
import 'package:todoapp/Shared/Cubit/cubit.dart';

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).DeleteFromDataBase(id: model['id']);
        // AppCubit.get(context).DeleteFromDataBase(id: int.parse(model['id']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text('${model['time']}'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${model['title']}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    model['date'].toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .UpdateDatabase(status: 'done', id: model['id']);
                },
                icon: Icon(
                  Icons.check_box,
                  color: Colors.pink[700],
                )),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .UpdateDatabase(status: 'archived', id: model['id']);
                },
                icon: Icon(
                  Icons.archive,
                  color: Colors.amberAccent[200],
                ))
          ],
        ),
      ),
    );
