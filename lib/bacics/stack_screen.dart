import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  String _url="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Steve_Jobs_Headshot_2010-CROP2.jpg/1200px-Steve_Jobs_Headshot_2010-CROP2.jpg";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack"),
      centerTitle: true,),
      body: Padding(padding: EdgeInsets.all(10),
      child:Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(_url),
          ),
          CircleAvatar(
            radius: 13,
            backgroundColor: Colors.white,
          ),

          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.green,

          )
        ],
      ) ),

    );

  }
  Widget buildSimpleStack(){
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.black,
          height: 300,
          width: 300,

        ),
        Container(
          color: Colors.red,
          height: 250,
          width: 250,

        ),
        Container(
          color: Colors.green,
          height: 200,
          width: 200,

        ),

      ],
    );
  }
}
