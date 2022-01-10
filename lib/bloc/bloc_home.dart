import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/active_tasks_screen.dart';
import 'package:my_app/archive_tasks_screen.dart';
import 'package:my_app/bloc/tasks_cubit.dart';
import 'package:my_app/components.dart';
import 'package:my_app/done_tasks_screen.dart';
import 'package:sqflite/sqflite.dart';

import 'package:my_app/data.dart';

class blocHomeScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  BuildContext? context;
  TasksCubit? cubit;

  // _HomeScreenState(
  //     ){
  //   print('constrctor is run ');
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print('init state run');
  //   openMyDatabase();
  // }
  @override
  Widget build(BuildContext context) {
    this.context = context;
    print('build is run');
    return BlocProvider(
      create: (context) => TasksCubit(InitTasksState())..openMyDatabase(),
      child: BlocConsumer<TasksCubit, TasksStates>(
        listener: (context, state) {
          print(state);
          print(state is BottomSheetChangeState);
          if (state is BottomSheetChangeState) {
          } else if (state is InsertTaskState) {}
          else if (state is DeletedTaskState) {
            snackBar();
          }
        },
        builder: (context, state) {
           cubit = TasksCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit!.titles[cubit!.bottomNavigationBarItemIndex],
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                print(value);
                cubit!.changeBottomNavigationState(value);
                // setState(() {});
              },
              type: BottomNavigationBarType.shifting,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              currentIndex: cubit!.bottomNavigationBarItemIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Active'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.done_all), label: 'done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive), label: 'archive'),
              ],
            ),
            floatingActionButton: Visibility(
              visible: (cubit!.bottomNavigationBarItemIndex == 0),
              child: FloatingActionButton(
                onPressed: () {

                  if (cubit!.isBottomSheetExpaded) {
                    if (formkey.currentState!.validate()) {
                      // setState(() {});
                      String title = titlecontroller.text;
                      String data = datacontroller.text;
                      String time = timecontroller.text;
                      cubit!.insertTask(title: title, date: data, time: time);
                      Navigator.of(context).pop();

                      cubit!.isBottomSheetExpaded = false;
                      // setState(() {});
                      timecontroller.text = "";
                      datacontroller.text = "";
                      titlecontroller.text = "";
                    }
                  } else {
                    scaffoldKey.currentState!
                        .showBottomSheet((context) => builtItemSheet())
                        .closed
                        .then((value) => cubit!.changeBottomSheetState(false));
                    // setState(() {
                    //
                    // });
                    cubit!.changeBottomSheetState(true);
                    return builtItemSheet();
                  }
                  ;
                },
                child: cubit!.isBottomSheetExpaded
                    ? Icon(Icons.add)
                    : Icon(Icons.edit),
              ),
            ),
            body: cubit!.screens[cubit!.bottomNavigationBarItemIndex],
          );
        },
      ),
    );
  }
  snackBar(){
    final snackBar = SnackBar(
      duration: Duration(seconds: 3),
      content: Text('Task deleted'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
         // cubit!.UndoDeletedTask();
          cubit!.undoDeletedTask();

        },

      ),

    );
    ScaffoldMessenger.of(context!).showSnackBar(snackBar);

  }

  var titlecontroller = TextEditingController();
  var datacontroller = TextEditingController();
  var timecontroller = TextEditingController();

  builtItemSheet() {
    return Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              myTextFormField(
                  validator: (value) => validator(value!),
                  controller: titlecontroller,
                  label: "Title",
                  prefixIcon: Icons.title),
              SizedBox(height: 10),
              myTextFormField(
                onTap: () {
                  print('Data tapped');
                  return _PickDataDailog();
                },
                validator: (value) => validator(value!),
                controller: datacontroller,
                label: "Data",
                prefixIcon: Icons.date_range,
                textInputType: TextInputType.none,
              ),
              SizedBox(height: 10),
              myTextFormField(
                  onTap: () {
                    return PickTimeDailog();
                  },
                  validator: (value) => validator(value!),
                  controller: timecontroller,
                  label: "Time",
                  prefixIcon: Icons.timer,
                  textInputType: TextInputType.none),
            ],
          ),
        ));
  }

  void _PickDataDailog() {
    showDatePicker(
            context: context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now())
        .then((pickdata) {
      print('Data picked daialog');
      if (pickdata == null) return;
      print(pickdata.toString().split(" ")[0]);
      datacontroller.text = pickdata.toString().split(" ")[0];
    });
  }

  void PickTimeDailog() async {
    TimeOfDay initialTime = TimeOfDay.now();
    TimeOfDay? pickedTime = await showTimePicker(
      context: context!,
      initialTime: initialTime,
    );
    pickedTime.toString();
    String realTime = (pickedTime!.hour > 12)
        ? "${pickedTime.hour - 12}:${pickedTime.minute} PM"
        : "${pickedTime.hour}:${pickedTime.minute}AM";

    timecontroller.text = ('$realTime');
  }

  //open data base
  // insert record
  //get record
  //update record
  //delete record

  String? validator(String value) {
    if (value.isEmpty)
      return "Required";
    else {
      return null;
    }
  }
}
//مشكلة ان السناك بار مش شغال بيكرش
//مشكلة الساعة عند 12