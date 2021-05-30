import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:isa_nepal/api/api_services.dart';
import 'screens.dart';

class Maindrawer extends StatefulWidget {
  const Maindrawer({Key key}) : super(key: key);

  @override
  _MaindrawerState createState() => _MaindrawerState();
}

class _MaindrawerState extends State<Maindrawer> {
  APIService apiService = new APIService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        Gallery.image == null || Gallery.image == ""
                            ? AssetImage("assets/profile.png")
                            : MemoryImage(base64Decode(Gallery.image))),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  Gallery.firstName + Gallery.lastName,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  leading: Icon(
                    Icons.person,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text("My Profile",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyBookingScreen()));
                  },
                  leading: Icon(
                    Icons.book,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text("My Bookings",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationPage()));
                  },
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text("Notifications",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsScreen()));
                  },
                  leading: Icon(
                    Icons.settings,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text("Settings",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ),
                ListTile(
                  onTap: () {
                    Gallery.startup = true;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text("Log Out",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text("Contact Us",
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text("9828554096",
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey)),
                ),
              ],
            )),
      ),
    ]);
  }
}
