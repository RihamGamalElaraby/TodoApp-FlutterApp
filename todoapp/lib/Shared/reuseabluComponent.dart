import 'package:flutter/material.dart';

Widget buildTaskItem(Map model) => Padding(
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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${model['Date']}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          )
        ],
      ),
    );
