import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

var emailController = TextEditingController();
var formkey = GlobalKey<FormState>();

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty){
                    return "Email is required";
                  }
                  if (!value.contains('@')||!value.contains('.')){
                    return 'Enter a valid Email';
                  }
                  return null;
                } ,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email),
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
                  "Sent",
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
}
