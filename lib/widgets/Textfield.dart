import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    Key key,
    @required this.labletext,
  }) : super(key: key);
  final String labletext;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: new TextField(
          decoration: InputDecoration(
              labelText: labletext,
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: const BorderSide(color: Colors.grey)))),
    );
  }
}
