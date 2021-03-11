import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Image(
                  image: AssetImage(
                    'assets/isacrop.jpg',
                  ),
                  height: 80,
                  fit: BoxFit.fill),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text('Sign Up',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 60,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  TextFormField(
                    onEditingComplete: () {},
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                        hintText: "FirstName",
                        hintStyle: TextStyle(
                          fontSize: 19,
                          color: Colors.grey[350],
                          fontWeight: FontWeight.w600,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 27, horizontal: 25),
                        focusColor: Colors.blue,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(27),
                          borderSide: BorderSide(color: Colors.blue),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
