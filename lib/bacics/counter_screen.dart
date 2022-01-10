import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
   CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
int counter =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('$counter',style: TextStyle(
          fontSize: 44
        ),)
        ,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counter++;
          print('$counter');
          setState(() {

          });
        },


        child: Icon(Icons.add),
      ),
    );

  }
}
