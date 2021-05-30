import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:isa_nepal/api/api_services.dart';
import 'Photo_DetailsPage.dart';

class Photos extends StatefulWidget {
  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  APIService apiService = new APIService();
  // ignore: deprecated_member_use
  List<dynamic> photoslst = new List<dynamic>();
  bool startup = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    apiService.getPhotos().then((result) {
      setState(() {
        if (result == null) {
          final snackBar = SnackBar(content: Text("Falied to Load data!"));
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(snackBar);
        } else {
          photoslst = result;
          startup = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return startup == true
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Colors.blueGrey,
            body: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Gallery',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return RawMaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Photo_DetailsPage(
                                                imagepath: photoslst[index],
                                              )));
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: MemoryImage(
                                                base64Decode(photoslst[index])),
                                            fit: BoxFit.fill))));
                          },
                          itemCount: photoslst.length,
                        ))),
              ],
            )),
          );
  }
}
