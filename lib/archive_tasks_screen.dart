import 'package:flutter/cupertino.dart';
import 'package:my_app/components.dart';
import 'package:my_app/data.dart';

class ArchiveTasksScreen extends StatefulWidget {

  @override
  _ArchiveTasksScreenState createState() => _ArchiveTasksScreenState();
}

class _ArchiveTasksScreenState extends State<ArchiveTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return taskslistview(archiveTasks, null!);
  }
}
