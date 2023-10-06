import 'package:flutter/material.dart';

const kMainColor = Color(0XFF1D1E33);
const kInactiveMainColor = Color(0XFF111328);
const kWhiteColor = Color.fromARGB(255, 255, 254, 254);
const kDoneColor = Color.fromRGBO(117, 117, 117, 1);
const kSizedBox = SizedBox(height: 20);
const kEdgeEnset = EdgeInsets.only(
  top: 60,
  left: 30,
  right: 30,
);
const String kAppName = 'Bumble Tasks';
const kAppNameStyle =
    TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700);
const kTaskCounterStyle = TextStyle(color: Colors.white, fontSize: 15);
const kTaskTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

const String kAddTask = 'ADD TASK';
const kAddTaskStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w700,
  color: kMainColor,
);

const kSaveTask = 'Add Task';
const kSaveTaskStyle = TextStyle(color: kWhiteColor, fontSize: 24);
