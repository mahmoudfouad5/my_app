import 'package:flutter/material.dart';
import 'package:my_app/bloc/tasks_cubit.dart';

Widget myTextFormField({
  @required FormFieldValidator<String>? validator,
  bool passwordvisibly = false,
  @required TextEditingController? controller,
  TextInputType? textInputType = TextInputType.text,
  @required String? label,
  @required IconData? prefixIcon,
  Widget? suffixIcon,
  GestureTapCallback? onTap,
}) {
  return TextFormField(
      onTap: onTap,
      validator: validator,
      obscureText: passwordvisibly,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon));
}

Widget taskslistview(List<Map<dynamic, dynamic>> list, TasksCubit cubit) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) => Dismissible(
      key: Key(list[index]["id"].toString()),
      background: Container(
        child: Icon(Icons.cancel),
        color: Colors.red,

      ),


      onDismissed:(direction) {
        if(direction==DismissDirection.endToStart){

        }
        if(direction==DismissDirection.startToEnd){
          
        }
        cubit.deleteTask( list[index]);
      } ,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${list[index]['title']}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cubit.UpdateTask(status: "done", taskid: list[index]["id"]);
                  },
                  icon: Icon(Icons.done),
                  color: Colors.red,
                ),
                IconButton(
                  onPressed: () {
                    cubit.UpdateTask(status: "archive", taskid: list[index]["id"]);

                    },
                  icon: Icon(Icons.archive),
                  color: Colors.red,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Data:${list[index]['date']}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  "Time:${list[index]['time']}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
