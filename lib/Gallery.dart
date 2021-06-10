import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:isa_nepal/Calendar.dart';
import 'package:isa_nepal/pallete.dart';
import 'api/api_services.dart';
import 'screens.dart';
import 'Maindrawer.dart';
import 'Photos.dart' as ph;
import 'Videos1.dart' as vd;
import 'package:http/http.dart' as https;

class Gallery extends StatefulWidget {
  static String firstName;
  static String lastName;
  static String image;
  static bool startup = true;

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  TabController tabcontroller;

  void getUserdata() async {
    String auth = APIService.token + ":" + APIService.username;
    var response;

    await https.get(
      "https://b74b24cc3331.ngrok.io/api/Profile/GetUserData",
      headers: {
        HttpHeaders.authorizationHeader: "Bearer " + auth,
        HttpHeaders.contentTypeHeader: "application/json"
      },
    ).then((response) {
      ;
      if (response.statusCode == 200) {
        setState(() {
          var result = json.decode(json.decode(response.body.toString()));
          Gallery.firstName = result["First_Name"];
          Gallery.lastName = result["Last_Name"];
          Gallery.image = result["ImageUrl"];
          Gallery.startup = false;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontroller = new TabController(vsync: this, length: 2);
    if (Gallery.startup == true) {
      getUserdata();
    }
  }

  @override
  void dispose() {
    tabcontroller.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: <Widget>[
          navbarItems(Icons.photo_album, 0),
          navbarItems(Icons.sports_basketball, 1),
          navbarItems(Icons.calendar_today, 2),
          navbarItems(Icons.person, 3),
        ],
      ),
      appBar: AppBar(
        backgroundColor: kWhite,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.grey,
            ),
        iconTheme: IconThemeData(color: Colors.black),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(140, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('ISA NEPAL',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold))),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/isa.png'),
              ),
            ],
          ),
        ),
        bottom: new TabBar(
          controller: tabcontroller,
          tabs: <Tab>[
            new Tab(
              icon: new Icon(
                Icons.photo,
                color: Colors.grey,
              ),
            ),
            new Tab(
              icon: new Icon(
                Icons.video_collection,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
      body: new TabBarView(
        controller: tabcontroller,
        children: <Widget>[new ph.Photos(), new vd.Player()],
      ),
      drawer: Drawer(
        child: Maindrawer(),
      ),
    );
  }

  Widget navbarItems(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Gallery()));
          } else if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BookingsScreen()));
          } else if (index == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Calendar()));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()));
          }
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 3.0, color: Colors.grey),
            bottom: BorderSide(
                width: 5.0,
                color: index == selectedIndex ? Colors.blue : Colors.white),
          ),
        ),
        child: Icon(
          icon,
          size: 30,
          color:
              index == selectedIndex ? Colors.blue : Colors.lightBlue.shade200,
        ),
      ),
    );
  }
}
