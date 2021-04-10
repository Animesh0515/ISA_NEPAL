import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isa_nepal/api/api_services.dart';
import 'package:isa_nepal/model/CalendarModel.dart';
import 'package:isa_nepal/pallete.dart';
import 'Maindrawer.dart';
import 'screens.dart';
import 'dart:async';

import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller;
  int selectedIndex = 2;
  List<dynamic> _selectedEvents = ["abc", "bcd", 1];
  DateTime dt = DateTime.now();
  // ignore: deprecated_member_use
  List<dynamic> datalst = new List<dynamic>();
  APIService apiService = new APIService();
  bool status;
  String month;

  // set datalst(Future<List<dynamic>> outputlst) {
  //   datalst = outputlst;
  // }

  @override
  void initState() {
    _controller = new CalendarController();
    status = false;
    String datestr = DateFormat.yMMMd().format(DateTime.now());
    month = datestr.substring(0, 3);
    apiService.getCalendarData(dt.weekday).then((result) {
      setState(() {
        datalst = result;

        if (datalst.length > 0) {
          status = true;
        }
      });
    });

    // ignore: todo
    // TODO: implement initState
    super.initState();
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
      ),
      drawer: Drawer(
        child: Maindrawer(),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TableCalendar(
            initialCalendarFormat: CalendarFormat.week,

            calendarStyle: CalendarStyle(
                todayColor: Colors.orange[100],
                selectedColor: Theme.of(context).primaryColor,
                todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white)),
            headerStyle: HeaderStyle(
              titleTextStyle:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              formatButtonTextStyle: TextStyle(color: Colors.white),
              formatButtonDecoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20)),
              formatButtonShowsNext: false,
            ),
            // events: _markedDatyeMap,,
            onDaySelected: (date, events, holidays) {
              setState(() {
                apiService.getCalendarData(date.weekday).then((result) {
                  setState(() {
                    datalst = [];
                    datalst = result;
                    String datestr = DateFormat.yMMMd().format(date);
                    month = datestr.substring(0, 3);
                    dt = date;
                    if (datalst.length > 0) {
                      status = true;
                    } else {
                      status = false;
                    }
                  });
                });
              });
            },
            calendarController: _controller,
          ),

          if (status)
            for (int i = 0; i < datalst.length; i++) dataDisplay(i, dt, month),
          if (!status) emptyData(),

          // ..._selectedEvents.map((event) => Padding()),
        ],
      )),
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

  // ignore: missing_return
  Widget dataDisplay(int index, DateTime date, String month) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Container(
            height: MediaQuery.of(context).size.height / 8,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(color: Colors.grey)),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width / 7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        month,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        date.day.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(children: [
                        Text(
                          "Time :",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'Calibri (Body)',
                          ),
                        ),
                        new Text(
                          datalst[index]["time"],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'Calibri (Body)',
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Venue :",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'Calibri (Body)',
                          ),
                        ),
                        new Text(
                          datalst[index]["Venue"],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'Calibri (Body)',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 50,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget emptyData() {
    return Column(children: [
      SizedBox(
        height: 150,
      ),
      Container(
          child: Center(
              child: Text("NO TRAINING",
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 40,
                    color: Colors.black12,
                    fontWeight: FontWeight.bold,
                  )))),
    ]);
  }
}


// FutureBuilder(
//               future: lst,
//               // ignore: missing_return
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return ListView.builder(
//                       itemCount: snapshot.data.length,
//                       itemBuilder: (context, index) {
//                         var item = snapshot.data[index];
//                         return Flexible(
//                           child: Column(
//                             children: <Widget>[
//                               Text("New container"),
//                               // Widget to display the list of project
//                             ],
//                           ),
//                         );
//                       });
//                 }
//               }),
