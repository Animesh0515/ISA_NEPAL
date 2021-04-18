import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:isa_nepal/pallete.dart';
import 'screens.dart';
import 'Maindrawer.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool selected1 = true;
  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  bool hidepassword = true;
  bool validUsername = true;
  bool validPassword = true;
  String passwordtext;
  String usernamelabel = "Username";
  String passwordLabel = "Password";
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
      body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
              Text(
                "Settings",
                style: TextStyle(
                    fontFamily: 'Calibar',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.volume_up_outlined, color: Colors.blue),
                  SizedBox(width: 8),
                  Text("Notification",
                      style: TextStyle(
                          fontFamily: 'Calibar',
                          fontWeight: FontWeight.w700,
                          fontSize: 20)),
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Send me notification",
                      style: TextStyle(
                          fontFamily: 'Calibar',
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                  Switch(
                      value: selected1,
                      // activeColor:Colors.white,
                      onChanged: (bool value) {
                        setState(
                          () {
                            if (selected1) {
                              selected1 = false;
                            } else {
                              selected1 = true;
                            }
                          },
                        );
                      }),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Set reminder for training",
                      style: TextStyle(
                          fontFamily: 'Calibar',
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                  Switch(value: true, onChanged: (bool value) {}),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Set reminder for my bookings",
                      style: TextStyle(
                          fontFamily: 'Calibar',
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                  Switch(value: true, onChanged: (bool value) {}),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.verified_user, color: Colors.blue),
                  SizedBox(width: 8),
                  Text("Account",
                      style: TextStyle(
                          fontFamily: 'Calibar',
                          fontWeight: FontWeight.w700,
                          fontSize: 20)),
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              SizedBox(
                height: 20,
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                        child: Container(
                      height: 60,
                      child: new TextField(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Calibar'),
                        controller: usernamecontroller,
                        decoration: InputDecoration(
                          labelText: usernamelabel,
                          errorText: validUsername
                              ? null
                              : 'Please enter the username',
                          prefixIcon: Icon(
                            FontAwesomeIcons.user,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )),
                  ]),
              SizedBox(
                height: 20,
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: Container(
                        height: 60,
                        child: new TextField(
                          obscureText: hidepassword,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Calibar'),
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            labelText: passwordLabel,
                            errorText: validPassword ? null : passwordtext,
                            prefixIcon: Icon(
                              FontAwesomeIcons.lock,
                              size: 18,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidepassword = !hidepassword;
                                });
                              },
                              icon: Icon(hidepassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 120,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kBlue,
                    ),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                        child: Text(
                          'Change',
                          style:
                              kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                        //color: Colors.black,
                        // buttonName: 'Login',
                        // buttonColor: kBlue,
                        onPressed: () {
                          setState(() {
                            validUsername =
                                validateText(usernamecontroller.text);
                            validPassword = validatePasswordTextField(
                                passwordcontroller.text);
                          });
                        }),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kBlue,
                    ),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                        child: Text(
                          'Logout',
                          style:
                              kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                        //color: Colors.black,
                        // buttonName: 'Login',
                        // buttonColor: kBlue,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          )),
    );
  }

  bool validateText(String userinput) {
    if (userinput.isEmpty) {
      return false;
    }
    return true;
  }

  bool validatePasswordTextField(String userInput) {
    String pattern = r'^([\w]).{6,}$';
    RegExp regExp = new RegExp(pattern);
    if (userInput.isEmpty) {
      setState(() {
        passwordtext = "Please Enter the password!";
      });
      return false;
    } else {
      if (regExp.hasMatch(userInput)) {
        return true;
      } else {
        setState(() {
          passwordtext = "Password must be 6 character long!";
        });
        return false;
      }
    }
  }
}
