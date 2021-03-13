import 'package:flutter/material.dart';
import 'package:isa_nepal/screens.dart';

import '../pallete.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.buttonName,
    @required this.buttonColor,
    this.Pagename,
  }) : super(key: key);
  final String buttonName;
  final Color buttonColor;
  final String Pagename;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: buttonColor,
      ),
      child: FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, 'SignupScreen');
        },
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
