import 'package:flutter/material.dart';
import 'screens.dart';

class Maindrawer extends StatelessWidget {
  const Maindrawer({Key key}) : super(key: key);
  final String name = "Animesh Rai";
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
                    backgroundImage: AssetImage('assets/nikesh.jpg')),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  name,
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
                  onTap: () {},
                  leading: Icon(
                    Icons.receipt,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text("About US",
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
