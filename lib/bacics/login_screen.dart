
import 'package:flutter/material.dart';
import 'package:my_app/bacics/forget_password_screen.dart';
import 'package:my_app/bacics/register_screen.dart';
import 'messenger_screen.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'login Screen',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: Container(
          //بيبعد عن اللى بره
          //margin: EdgeInsets.all(15),
          //بيبعد عن حواف الكونتينر من جوه
          padding: EdgeInsets.all(15),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  "LoginScreen",

                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),

                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.red,
                height: 40,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPasswordScreen(),));
                },
                child: Text("Forget password", style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Does Not Have account ?"),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen(),));
                    },
                    child: Text("Sign Up",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,

                      ),),
                  )
                ],)

            ],

          ),
        ),
      ),
    );
  }

  }


