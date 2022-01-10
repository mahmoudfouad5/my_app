import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/components.dart';
import 'package:my_app/data.dart';

class ActiveTasksScreen extends StatefulWidget {
  @override
  _ActiveTasksScreenState createState() => _ActiveTasksScreenState();
}

class _ActiveTasksScreenState extends State<ActiveTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return taskslistview(activeTasks,null!);
  }
}
