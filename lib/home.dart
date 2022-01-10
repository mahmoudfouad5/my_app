import 'package:flutter/material.dart';
import 'package:my_app/active_tasks_screen.dart';
import 'package:my_app/archive_tasks_screen.dart';
import 'package:my_app/components.dart';
import 'package:my_app/done_tasks_screen.dart';
import 'package:sqflite/sqflite.dart';

import 'data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();
var formkey = GlobalKey<FormState>();
List<Widget> screens = [
  ActiveTasksScreen(),
  DoneTasksScreen(),
  ArchiveTasksScreen()
];
List<String> titles = ["Active", "Done", "Archive"];
int bottomNavigationBarItemIndex = 0;



class _HomeScreenState extends State<HomeScreen> {


  _HomeScreenState(
      ){
    print('constrctor is run ');
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init state run');
    openMyDatabase();
  }
  bool isBottomSheetExpaded =false;
  @override
  Widget build(BuildContext context) {
    print('build is run');
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          titles[bottomNavigationBarItemIndex],
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          print(value);
          bottomNavigationBarItemIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: bottomNavigationBarItemIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Active'),
          BottomNavigationBarItem(icon: Icon(Icons.done_all), label: 'done'),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'archive'),
        ],
      ),
      floatingActionButton: Visibility(
        visible: (bottomNavigationBarItemIndex == 0),
        child: FloatingActionButton(
          onPressed: () {

            if (isBottomSheetExpaded){
              if(formkey.currentState!.validate()){
                setState(() {

                });
                String title =titlecontroller.text;
                String data =datacontroller.text;
                String time =timecontroller.text;
                insertTask(title:title,date: data,time: time );
                Navigator.of(context).pop();

                isBottomSheetExpaded =false;
                setState(() {

                });
                timecontroller.text="";
                datacontroller.text="";
                titlecontroller.text="";

              }

            }
            else{
              scaffoldKey.currentState!
                  .showBottomSheet((context) => builtItemSheet())
                  .closed.then((value) => isBottomSheetExpaded = false);
              setState(() {

              });
              isBottomSheetExpaded = true;
              return builtItemSheet();

            };


          },
          child: isBottomSheetExpaded ?Icon(Icons.add):Icon(Icons.edit),
        ),
      ),
      body: screens[bottomNavigationBarItemIndex],
    );
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
            context: context,
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
      context: context,
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
        getTask();

      },

    );
  }
  void insertTask({String? title, String? date, String? time}) async {
    // Insert some records in a transaction
    await database!.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO Tasks(title, date, time, status) VALUES("$title", "$date", "$time", "active")');
      print('RAW INSERT ID => $id');
      getTask();
    });

  }
 void getTask() async {
    // Get the records
   activeTasks  = await database!.rawQuery('SELECT * FROM Tasks WHERE status ="active"');
   doneTasks  = await database!.rawQuery('SELECT * FROM Tasks WHERE status ="done"');
   archiveTasks  = await database!.rawQuery('SELECT * FROM Tasks WHERE status ="archive"');


  }

 void UpdateTask({String? status ,int? taskid}) async {
    // Update some record
    await database!.rawUpdate(
        'UPDATE Tasks SET status = ?  WHERE id = ?',['$status',taskid]);

  }
  void DeletedTask (int taskid)async{
    // Delete a record
     await database!
        .rawDelete('DELETE FROM Tasks WHERE id = ?', [taskid]);
  }
  String? validator (String value){
    if (value.isEmpty)

      return "Required";
    else {
      return null;
    }
  }

}
