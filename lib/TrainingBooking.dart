import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isa_nepal/model/TrainingBookingModel.dart';
import 'package:isa_nepal/pallete.dart';
import 'package:http/http.dart' as https;

import 'api/api_services.dart';

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
  int counter = 0;
  APIService apiService = new APIService();
  TrainingBookingRequestModel tbRequestModel =
      new TrainingBookingRequestModel();

  void getVenue() async {
    String auth = APIService.token + ":" + APIService.username;
    var response = await https.get(
      "https://b74b24cc3331.ngrok.io/api/TrainingBooking/ShowVenue",
      headers: {
        HttpHeaders.authorizationHeader: "Bearer " + auth,
        HttpHeaders.contentTypeHeader: "application/json"
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        venuelst = json.decode(response.body.toString());
        counter++;
        print(counter);
      });
    }
  }

  void getTime(String venue) async {
    String auth = APIService.token + ":" + APIService.username;
    var response = await https.post(
        "https://b74b24cc3331.ngrok.io/api/TrainingBooking/ShowTime",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer " + auth,
          HttpHeaders.contentTypeHeader: "application/json"
        },
        body: jsonEncode(venue));
    if (response.statusCode == 200) {
      counter--;
      print(counter);
      setState(() {
        timelst = json.decode(response.body.toString());
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
    return counter == 0
        ? Center(child: CircularProgressIndicator())
        : Stack(children: <Widget>[
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
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/Training.jpg',
                          ),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    counter == 1
                        ? Column(children: [
                            new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                    width: 20,
                                  ),
                                  new Text(
                                    "Venue:",
                                    style: TextStyle(
                                        fontFamily: 'Arial', fontSize: 20),
                                  ),
                                  SizedBox(width: 10),
                                  new Flexible(
                                    child: Container(
                                      height: 50,
                                      width: 200,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                        ),
                                      ),
                                      child: Container(
                                        child: DropdownButton(
                                            focusColor: Colors.grey,
                                            hint: Text(venue),
                                            items: venuelst
                                                .map((dynamic val) =>
                                                    DropdownMenuItem<String>(
                                                      value: val,
                                                      child: Text(val),
                                                    ))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  counter++;
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                    width: 20,
                                  ),
                                  new Text(
                                    "Time:",
                                    style: TextStyle(
                                        fontFamily: 'Arial', fontSize: 20),
                                  ),
                                  SizedBox(width: 10),
                                  new Flexible(
                                    child: Container(
                                      height: 50,
                                      width: 200,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                        ),
                                      ),
                                      child: Container(
                                        child: DropdownButton(
                                            focusColor: Colors.grey,
                                            hint: Text(time),
                                            items: timelst
                                                .map((dynamic val) =>
                                                    DropdownMenuItem<String>(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                    width: 40,
                                  ),
                                  new Text(
                                    "Joining Date:",
                                    style: TextStyle(
                                        fontFamily: 'Arial', fontSize: 20),
                                  ),
                                  Container(
                                      height: 50,
                                      width: 195,
                                      child: new TextField(
                                          controller: datecontroller,
                                          decoration: InputDecoration(
                                            labelText: validjoindate
                                                ? "Joining Date"
                                                : null,
                                            hintText: "YYYY-MM-DD",
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(Radius
                                                            .circular(5.0)),
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Colors.grey)),
                                            errorText: validjoindate
                                                ? null
                                                : validationtext,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: kBlue,
                                ),
                                // ignore: deprecated_member_use
                                child: FlatButton(
                                  onPressed: buttonenable
                                      ? () {
                                          bool validjoindate =
                                              validateTextField(
                                                  datecontroller.text);
                                          if (venue == "Choose Venue") {
                                            final snackBar = SnackBar(
                                                content: Text(
                                                    "Please select the Venue!"));
                                            // ignore: deprecated_member_use
                                            Scaffold.of(context)
                                                .showSnackBar(snackBar);
                                          } else if (time == "Choose Time") {
                                            final snackBar = SnackBar(
                                                content: Text(
                                                    "Please select the Time!"));
                                            // ignore: deprecated_member_use
                                            Scaffold.of(context)
                                                .showSnackBar(snackBar);
                                          } else {
                                            if (validjoindate) {
                                              tbRequestModel.venue = venue;
                                              tbRequestModel.time = time;
                                              tbRequestModel.joiningDate =
                                                  datecontroller.text;
                                              apiService.BookTraining(
                                                      tbRequestModel)
                                                  .then((value) {
                                                if (value.booked) {
                                                  setState(() {
                                                    venue = "Choose Venue";
                                                    time = "Choose Time";
                                                    datecontroller.text = "";
                                                  });
                                                  final snackBar = SnackBar(
                                                      content: Text(
                                                          "Booking Succesful"));
                                                  // ignore: deprecated_member_use
                                                  Scaffold.of(context)
                                                      .showSnackBar(snackBar);
                                                } else {
                                                  final snackBar = SnackBar(
                                                      content: Text(
                                                          "Something Went Worng!"));
                                                  // ignore: deprecated_member_use
                                                  Scaffold.of(context)
                                                      .showSnackBar(snackBar);
                                                }
                                              });
                                            }
                                          }
                                        }
                                      : null,

                                  // disabledTextColor: kWhite,
                                  // disabledColor: Colors.grey,

                                  child: Text(
                                    'Book',
                                    style: kBodyText.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ])
                        : CircularProgressIndicator()
                  ]),
                ))
          ]);
  }

  bool validateTextField(String userInput) {
    String pattern = r'^([\d]{4}\-[\d]{2}\-[\d]{2})$';
    DateTime now = DateTime.now();
    String date = DateFormat('yyyy-MM-dd').format(now);
    // var datenow = int.parse(date);
    // var inputdate = int.parse(userInput);
    RegExp regExp = new RegExp(pattern);
    if (userInput.isEmpty) {
      setState(() {
        validjoindate = false;
        validationtext = "Please Enter the date!";
      });
      return false;
    } else {
      // if (regExp.hasMatch(userInput) && inputdate >= datenow) {
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
