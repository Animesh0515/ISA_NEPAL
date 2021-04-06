import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isa_nepal/api/api_services.dart';
import 'package:isa_nepal/model/BookingTimeModel.dart';
import 'package:isa_nepal/model/CourtBookingModel.dart';
import 'package:isa_nepal/pallete.dart';
import 'package:http/http.dart' as https;

class CourtBooking extends StatefulWidget {
  @override
  _CourtBookingState createState() => _CourtBookingState();
}

class _CourtBookingState extends State<CourtBooking> {
  final _formKey = GlobalKey<FormState>();
  bool validateTextField = false;
  bool validateDropDown = false;
  static bool active = false;
  TextEditingController datecontroller = new TextEditingController();
  String timetext = "Text";
  List<dynamic> time = [];
  DateTime _date = DateTime.now();
  List<String> timePeriod = [
    '11:00A.M-12:00P.M',
    '12:00P.M-1:00P.M',
    '2:00P.M-3:00P.M',
    '3:00P.M-4:00P.M'
  ];
  APIService apiService = new APIService();
  BookingTimeRequestModel bookingTimeRequestModel =
      new BookingTimeRequestModel();
  CourtBookingRequestModel bookingRequestModel = new CourtBookingRequestModel();
  bool buttonenable = true;

  Future<Null> _selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );

    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _selectDate(context);
        datecontroller.text = new DateFormat("yyyy-MM-dd").format(_datePicker);
        bookingTimeRequestModel.date = datecontroller.text;
        active = true;
      });
    }
  }

  @override
  void initState() {
    //Future<List<BookingTimeModel>> lst = apiService.getTime();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (active) {
      setState(() {
        apiService.getTime(bookingTimeRequestModel).then((value) {
          print(value.time.length);

          if (value.time.length == 0 || value.time.length == null) {
            time = [];

            buttonenable = false;
            final snackBar =
                SnackBar(content: Text("Booking is full for current date"));
            Scaffold.of(context).showSnackBar(snackBar);
          } else {
            for (int i = 0; i < value.time.length; i++) {
              time.add(value.time[i]);
            }
          }
        });
      });
      active = false;
    }
    // time.clear();
    return Stack(key: _formKey, children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text("Book Court",
                  style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/court.png',
                  ),
                  fit: BoxFit.fill,
                ),
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 30,
            ),

            SizedBox(height: 60),

            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 70,
                  ),
                  new Text(
                    "Date:",
                    style: TextStyle(fontFamily: 'Arial', fontSize: 20),
                  ),
                  SizedBox(width: 15),
                  new Flexible(
                    child: Container(
                      height: 40,
                      width: 200,
                      child: new TextFormField(
                          onTap: () {
                            setState(() {
                              _selectDate(context);
                              buttonenable = true;
                              time.clear();
                            });
                          },
                          controller: datecontroller,
                          decoration: InputDecoration(

                              // labelText: new DateFormat("yyyy-MM-dd")
                              //     .format(_date),
                              hintText: "Date",
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorText: validateTextField
                                  ? 'Please enter ' + "Date"
                                  : null)),
                    ),
                  ),
                  SizedBox(
                    width: 80.0,
                  ),
                ]),
            SizedBox(
              height: 20,
            ),

            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 70,
                  ),
                  new Text(
                    "Time:",
                    style: TextStyle(fontFamily: 'Arial', fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  new Flexible(
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey),

                          // const BorderSide(color: Colors.grey),

                          // width: 1.0,
                          //               borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          // borderSide: const BorderSide(color: Colors.grey)))),
                          // style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                      child: Container(
                        child: DropdownButton(
                            focusColor: Colors.grey,
                            hint: Text(timetext),
                            // validator: (value) =>
                            //     value == null ? 'field required' : null,
                            //                             validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter some text';
                            //   }
                            //   return null;
                            // },
                            items: time
                                .map((dynamic val) => DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(
                                () {
                                  timetext = value;
                                },
                              );
                            }),
                      ),
                    ),
                  ),
                  // Text((() {
                  //   if (timetext == "Time") {
                  //     Text("Please select the time");
                  //   }
                  // })()),
                  SizedBox(
                    width: 80.0,
                  ),
                ]),
            SizedBox(
              height: 50,
            ),

            IgnorePointer(
              ignoring: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: kBlue,
                  ),
                  child: FlatButton(
                    onPressed: buttonenable
                        ? () {
                            bool datevalidate =
                                validateText(datecontroller.text);

                            if (timetext == "Text" || timetext == "") {
                              final snackBar = SnackBar(
                                  content: Text("Please Select the Time"));
                              Scaffold.of(context).showSnackBar(snackBar);
                            } else {
                              if (datevalidate) {
                                bookingRequestModel.date =
                                    datecontroller.text.trim();
                                bookingRequestModel.time = timetext.trim();
                                apiService
                                    .booking(bookingRequestModel)
                                    .then((value) {
                                  if (value.booked) {
                                    final snackBar = SnackBar(
                                        content: Text(
                                            "Court has been booked succesfully"));
                                    Scaffold.of(context).showSnackBar(snackBar);
                                    datecontroller.text = "";
                                    timetext = "Text";
                                  } else {
                                    final snackBar = SnackBar(
                                        content: Text(
                                            "Booking Unsuccesfull. Something went wrong!"));
                                    Scaffold.of(context).showSnackBar(snackBar);
                                  }
                                });
                              }
                            }
                          }
                        : null,
                    disabledTextColor: kWhite,
                    disabledColor: Colors.grey,
                    child: Text(
                      'Book',
                      style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),

            // new Row(
            //   child: Text(
            //     "Hello",
            //     style: TextStyle(fontFamily: 'Arial', fontSize: 20),
            //   ),
            // ),
          ]),
        ),
      )
    ]);
  }

  bool validateText(String userinput) {
    if (userinput.isEmpty) {
      setState(() {
        validateTextField = true;
      });
      return false;
    }
    setState(() {
      validateTextField = false;
    });
    return true;
  }

  // void getTime() async {
  //   var response = await https
  //       .get("https://4419639d7a3d.ngrok.io/api/CourtBooking/GetTimeList");
  //   setState(() {
  //     time = json.decode(response.body.toString());
  //   });
  // }
}
