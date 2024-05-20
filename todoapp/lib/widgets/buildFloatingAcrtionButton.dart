import 'package:flutter/material.dart';
import 'package:todoapp/Shared/Cubit/cubit.dart';

var titleContoller = TextEditingController();
var dataContoller = TextEditingController();
var timeContoller = TextEditingController();
var statusContoller = TextEditingController();

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

Widget buildFloatingActionButton(BuildContext context, AppCubit cubit) {
  final theme = Theme.of(context);
  return FloatingActionButton(
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
                color: theme.backgroundColor,
                padding: const EdgeInsets.all(20.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: buildForm(context),
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
  );
}

buildForm(BuildContext context) {}
