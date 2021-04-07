import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:isa_nepal/pallete.dart';
import 'package:http/http.dart' as https;

class TrainingBooking extends StatefulWidget {
  @override
  _TrainingBookingState createState() => _TrainingBookingState();
}

class _TrainingBookingState extends State<TrainingBooking> {
  List<dynamic> venuelst = [];
  String venue = "Choose Venue";
  List<dynamic> timelst = [];
  String time = "Choose Time";
  bool buttonenable = true;
  bool validjoindate = true;
  String validationtext;
  TextEditingController datecontroller = new TextEditingController();

  void getVenue() async {
    var response = await https
        .get("https://192.168.0.103:44387/api/TrainingBooking/ShowVenue");
    if (response.statusCode == 200) {
      setState(() {
        venuelst = json.decode(response.body.toString());
      });
    }
  }

  void getTime(String venue) async {
    var response = await https.post(
        "https://192.168.0.103:44387/api/TrainingBooking/ShowTime",
        headers: {
          'Content-type': 'application/json',
        },
        body: jsonEncode(venue));
    if (response.statusCode == 200) {
      setState(() {
        timelst = json.decode(response.body.toString());
        print(venuelst);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getVenue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Text("Book Training",
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
                height: 50,
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    new Text(
                      "Venue:",
                      style: TextStyle(fontFamily: 'Arial', fontSize: 20),
                    ),
                    SizedBox(width: 10),
                    new Flexible(
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        child: Container(
                          child: DropdownButton(
                              focusColor: Colors.grey,
                              hint: Text(venue),
                              items: venuelst
                                  .map(
                                      (dynamic val) => DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          ))
                                  .toList(),
                              onChanged: (value) {
                                setState(
                                  () {
                                    venue = value;
                                    timelst.clear();
                                    getTime(venue);
                                  },
                                );
                              }),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                  ]),
              SizedBox(
                height: 20,
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    new Text(
                      "Time:",
                      style: TextStyle(fontFamily: 'Arial', fontSize: 20),
                    ),
                    SizedBox(width: 10),
                    new Flexible(
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        child: Container(
                          child: DropdownButton(
                              focusColor: Colors.grey,
                              hint: Text(time),
                              items: timelst
                                  .map(
                                      (dynamic val) => DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          ))
                                  .toList(),
                              onChanged: (value) {
                                setState(
                                  () {
                                    time = value;
                                  },
                                );
                              }),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                  ]),
              SizedBox(
                height: 20,
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 40,
                    ),
                    new Text(
                      "Joining Date:",
                      style: TextStyle(fontFamily: 'Arial', fontSize: 20),
                    ),
                    Container(
                        height: 50,
                        width: 195,
                        child: new TextField(
                            controller: datecontroller,
                            decoration: InputDecoration(
                              labelText: validjoindate ? "Joining Date" : null,
                              hintText: "YYYY-MM-DD",
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorText: validjoindate ? null : validationtext,
                            ))),
                    SizedBox(width: 40)
                  ]),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: kBlue,
                  ),
                  child: FlatButton(
                    onPressed: buttonenable
                        ? () {
                            bool validjoindate =
                                validateTextField(datecontroller.text);
                            if (venue == "Choose Venue") {
                              final snackBar = SnackBar(
                                  content: Text("Please select the Venue!"));
                              Scaffold.of(context).showSnackBar(snackBar);
                            } else if (time == "Choose Time") {
                              final snackBar = SnackBar(
                                  content: Text("Please select the Venue!"));
                              Scaffold.of(context).showSnackBar(snackBar);
                            } else {
                              if (validjoindate) {}
                            }
                          }
                        : null,

                    // disabledTextColor: kWhite,
                    // disabledColor: Colors.grey,

                    child: Text(
                      'Book',
                      style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ]),
          ))
    ]);
  }

  bool validateTextField(String userInput) {
    String pattern = r'^([\d]{4}\-[\d]{2}\-[\d]{2})$';
    RegExp regExp = new RegExp(pattern);
    if (userInput.isEmpty) {
      setState(() {
        validjoindate = false;
        validationtext = "Please Enter the date!";
      });
      return false;
    } else {
      if (regExp.hasMatch(userInput)) {
        setState(() {
          validjoindate = true;
        });
        return true;
      } else {
        setState(() {
          validjoindate = false;
          validationtext = "Incorrect date format!";
        });
        return false;
      }
    }
  }
}
