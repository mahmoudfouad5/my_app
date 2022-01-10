import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/components.dart';
import 'package:my_app/data.dart';
import 'tasks_cubit.dart';

class BolcDoneTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit,TasksStates>(listener: (context, state) {

    },
      builder: (context, state) {
        TasksCubit cubit =TasksCubit
            .get(context);
        return taskslistview(
            cubit.doneTasks,cubit );
      },);
  }
}
