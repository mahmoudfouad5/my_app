
import 'package:flutter/material.dart';

class PersonsScreen extends StatelessWidget {
String _url="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Steve_Jobs_Headshot_2010-CROP2.jpg/1200px-Steve_Jobs_Headshot_2010-CROP2.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Persons"),
      centerTitle: true,),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildPerson(name: 'mahmoud'),
              buildPerson(name: 'ali'),
              buildPerson(name: "mohamed"),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),

            ],
          ),
        ),
      ),

    );
  }
  Widget buildPerson({String name = "Steve Jobs"}){
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,

            backgroundImage: NetworkImage(_url),
          ),
          SizedBox(width: 10,),
          Text(name,style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),),
        ],
      ),
    );
  }
}
