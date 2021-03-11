import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:isa_nepal/LoginScreen.dart';
import 'package:isa_nepal/pallete.dart';
import 'package:isa_nepal/widgets/Rounded-button.dart';

const URL = "https://www.google.com/";

class Mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      //debugShowCheckedModeBanner:false
      children: <Widget>[
        Container(
          height: 500,
          width: 1000,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/isa.png',
              ),
              colorFilter:
                  ColorFilter.mode(Colors.black12, BlendMode.hardLight),
              fit: BoxFit.fill,
            ),
          ),
        ),
        // RaisedButton(
        //   child: Text("Open Link"),
        //   onPressed: () {
        //     launchurl(URL);
        //   },
        // ),
        /*ShaderMask(
            shaderCallback: (rect) => LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black87, Colors.transparent],
            ).createShader(rect),
            blendMode: BlendMode.softLight,
            child: */
        Padding(
          padding: EdgeInsets.fromLTRB(0, 500, 0, 0),
          child: Container(
            height: 200,
            width: 1000,
            color: Color(0xff000927),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(130, 470, 0, 0),
          child: FlatButton(
              child: Text(
                'Login',
                style: kBodyText.copyWith(fontWeight: FontWeight.bold),
              ),
              color: kBlue,
              // buttonName: 'Login',
              // buttonColor: kBlue,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }

              // buttonName: 'Login',
              // buttonColor: kBlue,
              ),
        ),
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: kBlue,
          ),
          child: FlatButton(
            onPressed: () {
              //   launchurl(URL);
            },
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'LoginScreen'),
              child: Text(
                'Login',
                style: kBodyText.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(130, 550, 0, 0),
          child: RoundedButton(
            buttonName: 'Signup',
            buttonColor: Colors.green,
          ),
        ),
        FlatButton(
          padding: const EdgeInsets.fromLTRB(150, 650, 0, 0),
          child: Icon(
            Icons.mail,
            color: kWhite,
          ),
          onPressed: () {},
        ),
        FlatButton(
          padding: const EdgeInsets.fromLTRB(200, 650, 0, 0),
          child: Icon(
            Icons.center_focus_weak,
            color: kWhite,
          ),
          onPressed: () {},
        ),
        FlatButton(
          padding: const EdgeInsets.fromLTRB(250, 650, 0, 0),
          child: Icon(
            FontAwesomeIcons.facebookSquare,
            color: kWhite,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
