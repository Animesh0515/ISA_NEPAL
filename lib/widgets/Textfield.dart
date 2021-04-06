import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    Key key,
    @required this.labletext,
    @required this.controller,
    @required this.validText,
    this.hintText,
  }) : super(key: key);
  final String labletext;
  final TextEditingController controller;
  final bool validText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: new TextField(
          controller: controller,
          decoration: InputDecoration(
              labelText: labletext,
              hintText: hintText,
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: const BorderSide(color: Colors.grey)),
              errorText: validText ? 'Please enter ' + labletext : null)),
    );
  }
}
