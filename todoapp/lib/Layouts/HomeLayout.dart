import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Shared/Cubit/cubit.dart';
import 'package:todoapp/Shared/Cubit/states.dart';
import 'package:todoapp/widgets/buildAppBar.dart';
import 'package:todoapp/widgets/buildBottomNavBar.dart';
import 'package:todoapp/widgets/buildFloatingAcrtionButton.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  var titleContoller = TextEditingController();
  var dataContoller = TextEditingController();
  var timeContoller = TextEditingController();
  var statusContoller = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {
        if (state is AppInsertDatabase) {
          Navigator.pop(context);
        }
      },
      builder: (BuildContext context, AppStates) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          appBar: buildAppBar(context, cubit),
          body: ConditionalBuilder(
            condition: AppStates is! AppGetDatabaseLoadingState,
            builder: (context) => cubit.screens[cubit.CurrentIndex],
            fallback: (context) => const Center(
              child: LinearProgressIndicator(),
            ),
          ),
          floatingActionButton: buildFloatingActionButton(context, cubit),
          bottomNavigationBar: buildBottomNavigationBar(context, cubit),
        );
      },
    );
  }
}
