import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var titleContoller = TextEditingController();
var dataContoller = TextEditingController();
var timeContoller = TextEditingController();
var statusContoller = TextEditingController();

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
Widget buildForm(BuildContext context) {
  final theme = Theme.of(context);
  return Form(
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
            icon: Icon(Icons.title, color: theme.iconTheme.color),
            labelText: "Enter Title",
            hintText: "Title",
          ),
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
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((value) {
              timeContoller.text = value!.format(context).toString();
            });
          },
          decoration: InputDecoration(
            icon: Icon(Icons.watch, color: theme.iconTheme.color),
            labelText: "Enter Time",
            hintText: "Time",
          ),
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
          onTap: () {
            showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime.parse('2030-12-31'),
            ).then((value) {
              dataContoller.text = DateFormat.yMMMd().format(value!);
            });
          },
          decoration: InputDecoration(
            icon: Icon(Icons.date_range, color: theme.iconTheme.color),
            labelText: "Enter Data",
            hintText: "Date",
          ),
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
  );
}
