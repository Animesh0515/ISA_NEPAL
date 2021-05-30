import 'package:flutter/material.dart';
import 'package:isa_nepal/api/api_services.dart';
import 'package:isa_nepal/model/MyBookingsModel.dart';
import 'package:isa_nepal/pallete.dart';
import 'screens.dart';

class MyBookingScreen extends StatefulWidget {
  @override
  _MyBookingScreenState createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  List<String> data = ["abc", "cde"];
  APIService apiService = new APIService();
  // ignore: deprecated_member_use
  List<dynamic> bookingslst = new List<dynamic>();
  String venue;
  bool startup = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService.getBookings().then((result) {
      setState(() {
        bookingslst = result;
        startup = false;
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
      body: startup == true
          ? Center(child: CircularProgressIndicator())
          : bookingslst == null
              ? Container(child: Text("No Bookings"))
              : Container(
                  padding: EdgeInsets.only(left: 16, top: 25, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "My Bookings",
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
                        children: bookingslst.map((bookingslst) {
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
                                  Text(bookingslst["BookingType"],
                                      style: TextStyle(
                                          fontFamily: 'Arial', fontSize: 20)),
                                  Text("Booked Date:" +
                                      bookingslst["BookedDate"]),
                                  Text(
                                      "Booked For:" + bookingslst["BookedFor"]),
                                  Text("Time:" + bookingslst["Time"]),
                                  //venue = bookingslst["BookedFor"],
                                  // venue == null
                                  //     ? Text("")
                                  //     : Text("Venue:" + bookingslst["Venue"]),
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
