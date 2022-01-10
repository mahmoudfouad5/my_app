import 'package:flutter/material.dart';
import 'messenger_screen.dart';

class SecondScreen extends StatefulWidget {
   SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
   bool ismale = true;

int sliderCounter =160;
int weight =60;
int age =20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.black,
        width:double.infinity ,
        child: Column(
          children: [
            Expanded(child: Container(color:Colors.black,height: 10 ,
            child: Row(
              children: [
                Expanded(child: InkWell(
                  onTap: () {
                    setState(() {

                    });
                    ismale =true;
                    print('is male $ismale');
                  },
                  child: Container(margin:EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: (ismale)?Colors.blue:Colors.grey,

                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(Icons.male,
                      // size: 125,),
                      Image.asset('images/male.png',height: 75,),
                      SizedBox(height: 10,),

                      Text("male",style:
                        TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                        ),)
                    ],
                  ),),
                )),
                Expanded(child: InkWell(

                  onTap: (){
                    setState(() {

                    });
                    ismale=false;
                    print('Is Male $ismale');
                  },

                  child: Container(margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (ismale)?Colors.grey:Colors.pink,
                  ),
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(Icons.female,
                      //   size: 125,),
                      Image.asset("images/female.png",height: 75,),
                      SizedBox(height: 10,),
                      Text("female",style:
                      TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                      ),)
                    ],
                  ),),
                )),
              ],
            ),)),
            Expanded(child: Container(height: 10 ,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:Colors.grey,

            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Text(
                  "Height",
                  style: TextStyle(
                    fontSize: 25
                  ),
                ),
                Text("$sliderCounter Cm",
                style: TextStyle(
                  fontSize: 25
                ),),
                Slider(
                  value: sliderCounter.toDouble(),
                    min: 150,
                  max: 200,
                  onChanged: (value) {
                    sliderCounter=value.toInt();

                    print(value);
                    setState(() {

                    });
                  },

                )
              ],
            )
              ,)),
            Expanded(child: Container(color:Colors.black,height: 10 ,
              child: Row(
                children: [
                  Expanded(child: Container(margin:EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue,

                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("Weight",style:
                        TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                        ),),
                        Text("$weight KG",style:
                        TextStyle(
                          fontSize: 23,
                          fontStyle: FontStyle.italic,
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            CircleAvatar(
                              child: InkWell(
                                child: Icon(
                                  Icons.remove

                                ),
                                onTap: () {
                                  weight--;
                                  setState(() {

                                  });

                                },
                              ),
                            ),
                            CircleAvatar(
                              child: InkWell(
                                child: Icon(
                                  Icons.add,
                                ),
                                onTap: () {

                                  weight++;
                                  setState(() {

                                  });
                                },
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),)),
                  Expanded(child: Container(margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("Age",style:
                        TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                        ),),
                        Text("$age",style:
                        TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                        ),),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            CircleAvatar(
                              child: InkWell(

                                child: Icon(
                                    Icons.remove

                                ),
                                onTap: (){
                                  age--;
                                 setState(() {

                                 });
                                }
                                ,
                              ),
                            ),
                            CircleAvatar(
                              child: InkWell(
                                child: Icon(
                                  Icons.add,
                                ),
                                onTap: () {
                                  age++;
                                  setState(() {

                                  });
                                },
                              ),
                            ),

                          ],
                        ),
                      ],


                    ),)),
                ],
              ),)),
            Container(color:Colors.red,
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
ShowCustomDialog();

              },
              child: Text(
                "Calculate",style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              ),

            ),),

  ]
        ),
      ),
    );
  }
  ShowCustomDialog(){
    Dialog customDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
         width: 100,
        height: 100,
        child:
        TextButton(


          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MassengerScreen() ));
          },
          child: Text(

            "ok Bay"
          ),
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext)=>customDialog);
  }

  }

