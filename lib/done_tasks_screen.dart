import 'package:flutter/cupertino.dart';
import 'package:my_app/components.dart';
import 'package:my_app/data.dart';

class DoneTasksScreen extends StatefulWidget {

  @override
  _DoneTasksScreenState createState() => _DoneTasksScreenState();
}

class _DoneTasksScreenState extends State<DoneTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return taskslistview(doneTasks,null!);
  }
}
