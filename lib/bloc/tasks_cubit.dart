
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/bloc_archive_tasks_screen.dart';
import 'package:my_app/bloc/bloc_done_tasks_screen.dart';
import 'package:sqflite/sqflite.dart';

import '../data.dart';
import 'bloc_active_tasks_screen.dart';

class TasksStates{}
class InitTasksState extends TasksStates{}
class InsertTaskState extends TasksStates{}
class DeletedTaskState extends TasksStates{}

class GetTasksState extends TasksStates{}
class BottomNavigationChangeState extends TasksStates{}
class BottomSheetChangeState extends TasksStates{}
class TasksCubit extends Cubit <TasksStates>{
  TasksCubit(TasksStates initialState) : super(initialState);
  static TasksCubit get(context)=> BlocProvider.of(context);


  List<String> titles = ["Active", "Done", "Archive"];
  List<Widget> screens = [
    BolcActiveTasksScreen(),
    BolcDoneTasksScreen(),
    BolcArchievTasksScreen()
  ];
  int bottomNavigationBarItemIndex = 0;
  bool isBottomSheetExpaded =false;

  void changeBottomNavigationState(int value){
    bottomNavigationBarItemIndex =value;

    emit(BottomNavigationChangeState());
  }
  void changeBottomSheetState(bool value){
    isBottomSheetExpaded =value ;

    emit(BottomSheetChangeState());
  }
  Database? database;

  void openMyDatabase() async {
    // open the database
    // Database database = await openDatabase(" ", version: 1,
    //     onCreate: (Database db, int version) async {
    //       // When creating the db, create the table
    //       await db.execute(
    //           'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    //     });
    database = await openDatabase(
      "tasksdatabase",
      version: 1,
      onCreate: (db, version) async{
        await db.execute(""
            "CREATE TABLE Tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT, status TEXT)");
      },
      // another way to received data base after create but first delete database = await in line (151)
      onOpen: (db) {
        print('onOpen');
        database =db;
        getTasks();

      },

    );
  }
  void insertTask({String? title, String? date, String? time,String status="active" }) async {
    // Insert some records in a transaction
    await database!.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO Tasks(title, date, time, status) VALUES("$title", "$date", "$time", "$status")');
      print('RAW INSERT ID => $id');
      getTasks();
    });

  }

  List<Map> activeTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  void getTasks() async {
    activeTasks =
    await database!.rawQuery('SELECT * FROM Tasks WHERE status = "active"');
    doneTasks =
    await database!.rawQuery('SELECT * FROM Tasks WHERE status = "done"');
    archiveTasks =
    await database!.rawQuery('SELECT * FROM Tasks WHERE status = "archive"');

    emit(GetTasksState());


  }

  void UpdateTask({String? status ,int? taskid}) async {
    // Update some record
    await database!.rawUpdate(
        'UPDATE Tasks SET status = ?  WHERE id = ?',['$status',taskid]);
getTasks();
  }

  Map<dynamic, dynamic>? _deletedTask;

  void deleteTask(Map list, {Map<dynamic, dynamic> ?task}) async {
    _deletedTask = task;

    await database!.rawDelete('DELETE FROM Tasks WHERE id = ?', [task!['id']]);
    emit(DeletedTaskState());
    getTasks();
  }
  void undoDeletedTask() {
    insertTask(
      title: _deletedTask?['title'],
      date: _deletedTask?['date'],
      time: _deletedTask?['time'],
      status: _deletedTask?['status'],
    );
  }


}