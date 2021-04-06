import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:isa_nepal/Mainpage.dart';
import 'package:isa_nepal/pallete.dart';
import 'package:isa_nepal/screens.dart';

import 'api/api_services.dart';
import 'model/login_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidepassword = true;

  LoginRequestModel loginRequestModel = new LoginRequestModel();

  TextEditingController usernamecontroller = new TextEditingController();

  TextEditingController passwordcontroller = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool ValidateTextField = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/isacrop.jpg',
                  ),
                  fit: BoxFit.fill,
                ),
                color: Colors.white,
              ),
            ),
            Container(
              height: 600,
              color: Colors.white,
            )
          ],
        ),
        Scaffold(
          resizeToAvoidBottomPadding: false,
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,

          body: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Flexible(
                child: Center(
                  key: _formKey,
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Container(
                  height: 50,
                  width: 300,

                  // decoration: BoxDecoration(
                  //   color: Colors.grey[500].withOpacity(0.5),
                  //   borderRadius: BorderRadius.circular(16),
                  // ),
                  child: Center(
                    child: TextField(
                      controller: usernamecontroller,

                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: const BorderSide(color: Colors.grey)),
                        errorText: ValidateTextField
                            ? 'Please enter a Username'
                            : null,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(FontAwesomeIcons.envelope,
                              size: 30, color: Colors.black),
                        ),
                        hintText: 'Username',
                        hintStyle: kBodyText.apply(color: Colors.black45),
                      ),

                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      //style: kBodyText,

                      keyboardType: TextInputType.emailAddress,
                      //validator: (input)=> !input.contains("@")?"Email Id should be valid" : null,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Container(
                  height: 50,
                  width: 300,
                  //decoration: BoxDecoration(
                  //color: Colors.grey[100].withOpacity(0.5),
                  //borderRadius: BorderRadius.circular(16),
                  // ),
                  child: Center(
                    child: TextField(
                      controller: passwordcontroller,
                      obscureText: hidepassword,

                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: const BorderSide(color: Colors.grey)),
                        errorText: ValidateTextField
                            ? 'Please enter a Password'
                            : null,

                        // border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            FontAwesomeIcons.lock,
                            size: 30,
                            color: Colors.black,
                          ),
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

                        hintText: 'Password',
                        hintStyle: kBodyText.apply(color: Colors.black45),
                        // color: Colors.grey[400].withOpacity(0.5),
                      ),
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      //style: kBodyText,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
              //child: Form(
              //key: _formKey,
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: kBlue,
                ),
                child: FlatButton(
                    child: Text(
                      'Login',
                      style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                    ),
                    //color: Colors.black,
                    // buttonName: 'Login',
                    // buttonColor: kBlue,
                    onPressed: () {
                      bool usernamevalid =
                          validateTextField(usernamecontroller.text);
                      bool passwordvalid =
                          validateTextField(passwordcontroller.text);
                      if (usernamevalid && passwordvalid) {
                        loginRequestModel.email =
                            usernamecontroller.text.trim();
                        loginRequestModel.password =
                            passwordcontroller.text.trim();
                        print(loginRequestModel.toJson());
                        APIService apiService = new APIService();
                        apiService.login(loginRequestModel).then((value) {
                          if (value.validate) {
                            _scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text("Login Succesful"),
                              ),
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mainpage()));
                            // final snackBar = SnackBar(
                            //   content: Text("Login Succesful"),
                            // );
                            // Scaffold.of(context).showSnackBar(snackBar);
                          } else if (!value.validate) {
                            // final snackBar = SnackBar(
                            //   content: Text("User not found"),
                            // );
                            _scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text("User not Found!"),
                              ),
                            );
                          } else {
                            _scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text("Login Error"),
                              ),
                            );
                          }
                        });
                      }
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 80),
                child: Container(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: kBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              //),
              // SizedBox(
              //   height: 20,
              // ),
              Container(
                child: Text(
                  'Dont have an account?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),

              new GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                },
                child: new Text(
                  'Signup',
                  style: TextStyle(
                      color: kBlue, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              //),
              // ),
            ],
          ),

          //
        ),
      ],
    );
  }

  bool validateTextField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        ValidateTextField = true;
      });
      return false;
    }
    setState(() {
      ValidateTextField = false;
    });
    return true;
  }
}

// Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
//                 child: Container(
//                   height: 50,
//                   width: 150,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.blue,
//                   ),
//                   child: FlatButton(
//                     onPressed: () {},
//                     child: GestureDetector(
//                       onTap: () => Navigator.pushNamed(context, 'Loginscreen'),
//                       child: Text("Login"),
//                     ),
//                   ),
//                 ),
//               ),
/*Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(5, 400, 5, 0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white12.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                      decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      FontAwesomeIcons.envelope,
                    ),
                    hintText: 'Email',
                  )),
                ),
              ),
            ],
          ),
        ),
        */
