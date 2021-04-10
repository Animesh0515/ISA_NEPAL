import 'package:flutter/material.dart';

class Photo_DetailsPage extends StatelessWidget {
  final String imagepath;
  Photo_DetailsPage({@required this.imagepath});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  image: DecorationImage(
                    image: AssetImage(imagepath),
                    fit: BoxFit.fill,
                  )),
            ))
          ],
        ),
      ),
    );
  }
}
