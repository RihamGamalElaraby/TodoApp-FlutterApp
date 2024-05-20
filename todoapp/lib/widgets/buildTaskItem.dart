import 'package:flutter/material.dart';
import 'package:todoapp/Shared/Cubit/cubit.dart';

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).DeleteFromDataBase(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text('${model['time']}'),
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Theme.of(context).textTheme.bodyText1?.color,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${model['title']}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyText1?.color,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (model['priority'] != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.priority_high,
                            color: model['priority'] == 'High'
                                ? Colors.red
                                : model['priority'] == 'Medium'
                                    ? Colors.orange
                                    : Colors.green,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    model['date'].toString(),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).textTheme.bodyText2?.color,
                    ),
                  ),
                  if (model['description'] != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        model['description'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).textTheme.bodyText2?.color,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    AppCubit.get(context)
                        .UpdateDatabase(status: 'done', id: model['id']);
                  },
                  icon: Icon(
                    Icons.check_box,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    AppCubit.get(context)
                        .UpdateDatabase(status: 'archived', id: model['id']);
                  },
                  icon: Icon(
                    Icons.archive,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                // IconButton(
                //   onPressed: () {
                //     // Open an edit screen or modal to update the task details
                //     // Assuming AppCubit has a method to edit tasks
                //     // AppCubit.get(context).editTask(model['id']);
                //   },
                //   icon: Icon(
                //     Icons.edit,
                //     color: Theme.of(context).accentColor,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
