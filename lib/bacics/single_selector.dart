import 'package:flutter/material.dart';

class SingleSelector extends StatefulWidget {
  @override
  State<SingleSelector> createState() => _SingleSelectorState();
}

class _SingleSelectorState extends State<SingleSelector> {
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
 int selectorIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: (context, index) {
        return
          InkWell(
            onTap: (){
              print(index);
              selectorIndex =index;
              setState(() {

              });
            },
            child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: (index==selectorIndex)?Colors.blue:Colors.grey,
              borderRadius: BorderRadius.circular(20),

            ),
            width: double.infinity,
            margin: EdgeInsets.all(10),
            // alignment: Alignment.center,
            child: Text(names[index],
              textAlign: TextAlign.center,
              style: TextStyle(

                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,

              ),),
        ),
          );
      },
        itemCount:names.length
        ,

      ),

    );
  }
}
