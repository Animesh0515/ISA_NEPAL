import 'package:flutter/material.dart';
import 'package:isa_nepal/api/api_services.dart';

import 'Maindrawer.dart';
import 'pallete.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  APIService apiService = new APIService();
  // ignore: deprecated_member_use
  List<dynamic> notificationlst = new List<dynamic>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService.getNotifications().then((result) {
      setState(() {
        notificationlst = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      drawer: Drawer(
        child: Maindrawer(),
      ),
      body: notificationlst == null
          ? Container(child: Text("No Bookings"))
          : Container(
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Notifications",
                    style: TextStyle(
                        fontFamily: 'Calibar',
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ListView(
                    children: notificationlst.map((notificationlst) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              border: Border.all(color: Colors.grey),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.4),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: Offset(4, 4),
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(notificationlst["Notification"]),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ))
                ],
              ),
            ),
    );
  }
}
