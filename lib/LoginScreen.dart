import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:isa_nepal/Mainpage.dart';
import 'package:isa_nepal/pallete.dart';

import 'api/api_services.dart';
import 'model/login_model.dart';

class LoginScreen extends StatelessWidget {
  bool hidepassword = true;
  LoginRequestModel loginRequestModel = new LoginRequestModel();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
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
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
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
                      controller: emailcontroller,

                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: const BorderSide(color: Colors.grey)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(FontAwesomeIcons.envelope,
                              size: 30, color: Colors.black),
                        ),
                        hintText: 'Email',
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
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
                            hidepassword = !hidepassword;
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 110),
                child: Form(
                  //key: _formKey,
                  child: Container(
                    child: FlatButton(
                        child: Text(
                          'Login',
                          style:
                              kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                        color: Colors.black,
                        // buttonName: 'Login',
                        // buttonColor: kBlue,
                        onPressed: () {
                          loginRequestModel.email = emailcontroller.text.trim();
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
                            } else {
                              // final snackBar = SnackBar(
                              //   content: Text("User not found"),
                              // );
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text("User not Found!"),
                                ),
                              );
                            }
                          });
                        }),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 100,
              // ),
              //),
              // ),
            ],
          ),
          //
        ),
      ],
    );
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
