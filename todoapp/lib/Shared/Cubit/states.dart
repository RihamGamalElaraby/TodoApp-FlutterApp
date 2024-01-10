import 'package:flutter/material.dart';

abstract class AppStates {}

class initalstate extends AppStates {}

class AppChangeBottomNaVbar extends AppStates {}

class AppCreateDatabase extends AppStates {}

class AppGetDatabaseLoadingState extends AppStates {}

class AppGetDatabase extends AppStates {}

class AppInsertDatabase extends AppStates {}

class AppUpdateDatabase extends AppStates {}

class AppDeleteDatabase extends AppStates {}

class AppChangeBottomSheetChange extends AppStates {}
