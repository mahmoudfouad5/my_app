import 'package:flutter/material.dart';
import '../components.dart';

class RegisterScreen extends StatefulWidget  {


  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}
var emailController = TextEditingController();
var nameController = TextEditingController();
var passwordController = TextEditingController();
var confirmpasswordController = TextEditingController();
var formkey = GlobalKey<FormState>();
bool passwordvisibly = true;

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register',style: TextStyle(
          fontSize: 22,
        ),),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: formkey,
          child: Column(
            children: [

               TextFormField(
                validator: (value) =>_namevalidater(value!),
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Name'),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (value) =>_emailvalidater(value!),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (value) => _passwordvalidater(value!),
                obscureText: passwordvisibly,
                controller: passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Password'),

                  prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: (){
                        _changepasswordvisible();
                      },
                    )
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (value) =>_confirmvalidater(value!) ,
                obscureText: passwordvisibly,
                controller: confirmpasswordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Confirm Password'),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: (){
                      _changepasswordvisible();
                    },
                  ),
                ),
              ),
              SizedBox(height: 10,),
              MaterialButton(
                onPressed: () {
                  if(formkey.currentState!.validate()){

                  }
                  String email =emailController.text;
                  print(email);


                },
                color: Colors.red,
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _changepasswordvisible (){
    passwordvisibly=!passwordvisibly;
    setState(() {

    });

  }
  String? _namevalidater (String value){
    {
      if (value.isEmpty){

        return "Name is required";
      }
      if (value.length< 2){
        return 'Enter a valid Name';
      }
      return null;
    }
  }
  String? _emailvalidater (String value){
    {
      if (value.isEmpty){
        return "Email is required";
      }
      if (!value.contains('@')||!value.contains('.')){
        return 'Enter a valid Email';
      }
      return null;
    }
  }
  String? _passwordvalidater (String value){
    {
      if (value.isEmpty){
        return "Password is required";
      }
      if (value.length<6){
        return 'Enter a valid Email';
      }

      return null;
    }
  }
  String? _confirmvalidater (String value){
    {
      if (value.isEmpty){
        return "Confirm Password is required";
      }
      if (value.length<6){
        return 'Enter a valid Email';
      }
      if (passwordController.text!=value){
        return "Password Not Match";
      }
      return null;
    }

  }
}
