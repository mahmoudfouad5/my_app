import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'user.dart';
class MassengerScreen extends StatelessWidget {
  List<MyUser> Users =[
    MyUser('mahmoud'    ,'how are you fool ', true),
    MyUser('ali'    ,'how are you fool ', false),
    MyUser('moud'    ,'how are you fool ', false),
    MyUser('mah'    ,'how are you fool ', true),
    MyUser('mamoud'    ,'how are you fool ', false),
    MyUser('hmoud'    ,'how are you fool ', true),
    MyUser('ahmoud'    ,'how are you fool ', true),
  ];
  String _url =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Steve_Jobs_Headshot_2010-CROP2.jpg/1200px-Steve_Jobs_Headshot_2010-CROP2.jpg";

  @override
  Widget build(BuildContext context) {
    Users.add(MyUser('mahmoud fouad', 'hoasd asasdadad', true));
    MyUser Khaled = MyUser('khaled', 'how are you pro fool ', false);
    Users.add(Khaled);
    return Scaffold(
      // appBar: AppBar(
      //     backgroundColor: Colors.white,
      //     elevation: 0,
      //     leading: myLeading(),
      //     title: Text(
      //       "Chats",
      //       style: TextStyle(
      //           fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
      //     ),
      //     actions: [
      //       myIconButton(Icons.camera_alt),
      //       myIconButton(Icons.edit),
      //     ]),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        child: Column(
          children: [
            buildTopBar(),
            buildNotificationReninder(),
            buildSearch(),
            Expanded(
              child: ListView.builder(itemBuilder:(context, index) {
                return buildChatItam(index);
              },
              itemCount: Users.length,
              ),
            ),
            // Expanded(
            //   child: ListView(
            //     children: [
            //       buildChatItam(),
            //       buildChatItam(),
            //       buildChatItam(),
            //       buildChatItam(),
            //       buildChatItam(),
            //       buildChatItam(),
            //       buildChatItam(),
            //       buildChatItam(),
            //       buildChatItam(),
            //       buildChatItam(),
            //       buildChatItam(),
            //       buildChatItam(),
            //       buildChatItam(),
            //       buildChatItam(),
            //
            //     ],
            //   ),
            // )
          ],
        ),
      )),
    );
  }

  Widget myLeading() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(_url),
            radius: 29,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 10,
          ),
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 9,
            child: Text('5'),
          ),
        ],
      ),
    );
  }

  Widget myIconButton(IconData iconData) {
    return CircleAvatar(
      backgroundColor: Colors.grey[300],
      radius: 23,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          iconData,
          color: Colors.black,
          size: 27,
        ),
      ),
    );
  }

  Widget buildTopBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          myLeading(),
          SizedBox(
            width: 15,
          ),
          Text(
            "Chats",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          myIconButton(Icons.camera_alt),
          SizedBox(
            width: 10,
          ),
          myIconButton(Icons.edit),
        ],
      ),
    );
  }

  Widget buildNotificationReninder() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 18),
      color: Colors.blue,
      child: Row(
        children: [
          Text(
            "All Notification off until 1:00PM",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          Spacer(),
          Text(
            "TURN ON",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                hintStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChatItam(int index) {
    MyUser myUser = Users[index];
    return Container(
      child: Row(
        children: [SizedBox(height: 60,),
          CircleAvatar(
            backgroundImage: NetworkImage(_url),
            radius: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(myUser.username,
                style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
            ),
                ),
                Text(
                  myUser.lastmaseag,
                   maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18,
                      color: (myUser.seen)?Colors.grey:Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
         
          Visibility(
            visible: !myUser.seen,
            child: CircleAvatar(
              
              radius: 9,
              backgroundColor:Colors.blue,

            ),
          ),
        

        ],

      ),

    );
  }
}
