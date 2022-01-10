import 'package:flutter/material.dart';

class MySimpleListView extends StatelessWidget {
  List<String> names = ['mahmoud',
    'ali',
    'mahmoud',
    'mahmoud',
    'mahmoud',

    'mahmoud',
    'mahmoud',
    'als',
        'ali',
    'mahmoud',
    'mahmoud',
    'mahmoud',

    'mahmoud',
    'mahmoud','ali',
    'mahmoud',
    'mahmoud',
    'mahmoud',

    'mahmoud',
    'mahmoud',
    'als',
        'ali',
    'mahmoud',
    'mahmoud',
    'mahmoud',

    'mahmoud',
    'mahmoud','ali',
    'mahmoud',
    'mahmoud',
    'mahmoud',

    'mahmoud',
    'mahmoud',
    'als',
        'ali',
    'mahmoud',
    'mahmoud',
    'mahmoud',

    'mahmoud',
    'mahmoud',
    'als'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
         // alignment: Alignment.center,
          child: Text(names[index],
            textAlign: TextAlign.center,
            style: TextStyle(

            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.blueAccent,

          ),),
        );
      },
        itemCount:names.length
        ,

      ),

    );
  }
}
