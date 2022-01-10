import 'package:flutter/material.dart';
import 'package:my_app/bacics/counter_screen.dart';
import 'package:my_app/bloc/bloc_home.dart';
import 'package:my_app/home.dart';
import 'package:my_app/bacics/listview_bulider.dart';
import 'package:my_app/bacics/login_screen.dart';
import 'package:my_app/bacics/messenger_screen.dart';
import 'package:my_app/bacics/persons_screen.dart';
import 'package:my_app/bacics/second_screen.dart';
import 'package:my_app/bacics/single_selector.dart';
import 'package:my_app/bacics/stack_screen.dart';

void main() {
  runApp(Myapp());
}
class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),

        home: blocHomeScreen()
    );
  }

}
