import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:isa_nepal/api/api_services.dart';
import 'package:isa_nepal/model/UserModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:isa_nepal/pallete.dart';
import 'screens.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_utilities/flutter_image_utilities.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 3;
  PickedFile imageFile;

  final ImagePicker imagePicker = ImagePicker();
  APIService apiService = new APIService();
  Future<UserDetailModel> userdetail = null;
  bool start = true;
  bool textenable = false;
  TextEditingController firstnamecontroller = new TextEditingController();
  TextEditingController lastnamecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController addresscontroller = new TextEditingController();
  TextEditingController dateofbirthcontroller = new TextEditingController();
  TextEditingController phonenocontroller = new TextEditingController();
  TextEditingController agecontroller = new TextEditingController();
  TextEditingController gendercontroller = new TextEditingController();
  TextEditingController imagecontroller = new TextEditingController();
  bool validFirstName = true;
  bool validLastName = true;
  bool validAddress = true;
  bool validEmail = true;
  bool validGender = true;
  bool validDob = true;
  bool validAge = true;
  bool validPhoneNo = true;
  String emailtext;
  String dobtext;
  UserDetailModel _userDetailModel = new UserDetailModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: <Widget>[
          navbarItems(Icons.photo_album, 0),
          navbarItems(Icons.sports_basketball, 1),
          navbarItems(Icons.calendar_today, 2),
          navbarItems(Icons.person, 3),
        ],
      ),
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
      body: start == true
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 300, top: 10),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          fontFamily: 'Calibar',
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  profileImage(),
                  SizedBox(
                    height: 30,
                  ),
                  textenable
                      ? Padding(
                          padding: const EdgeInsets.only(left: 280),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    //textenable = false;
                                    validFirstName =
                                        validateText(firstnamecontroller.text);
                                    validLastName =
                                        validateText(lastnamecontroller.text);
                                    validEmail = validateEmailTextField(
                                        emailcontroller.text);
                                    validAddress =
                                        validateText(addresscontroller.text);
                                    validGender =
                                        validateText(gendercontroller.text);
                                    validAge = validateText(agecontroller.text);
                                    validDob = validateDobTextField(
                                        dateofbirthcontroller.text);
                                    validPhoneNo =
                                        validateText(phonenocontroller.text);
                                    if (validFirstName &&
                                        validLastName &&
                                        validEmail &&
                                        validAddress &&
                                        validGender &&
                                        validAge &&
                                        validDob &&
                                        validPhoneNo) {
                                      _userDetailModel.firstName =
                                          firstnamecontroller.text;
                                      _userDetailModel.lastName =
                                          lastnamecontroller.text;
                                      _userDetailModel.email =
                                          emailcontroller.text;
                                      _userDetailModel.address =
                                          addresscontroller.text;
                                      _userDetailModel.gender =
                                          gendercontroller.text;
                                      _userDetailModel.age =
                                          int.parse(agecontroller.text);
                                      _userDetailModel.dateofBirth =
                                          dateofbirthcontroller.text;
                                      _userDetailModel.phoneNo =
                                          int.parse(phonenocontroller.text);

                                      apiService
                                          .updateUser(_userDetailModel)
                                          .then((value) {
                                        if (value.updated) {
                                          getProfileData();
                                          final snackBar = SnackBar(
                                              content: Text("Profile Updated"));
                                          // ignore: deprecated_member_use
                                          Scaffold.of(context)
                                              .showSnackBar(snackBar);
                                        } else {
                                          final snackBar = SnackBar(
                                              content: Text(
                                                  "Failed to update profile!"));
                                          // ignore: deprecated_member_use
                                          Scaffold.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width / 7,
                                  decoration: BoxDecoration(
                                      // color: kWhite,
                                      // border: Border(
                                      //     top: BorderSide(width: 3.0, color: Colors.grey),
                                      //     bottom: BorderSide(
                                      //       width: 5.0,
                                      //       //color: index == selectedIndex ? Colors.blue : Colors.white),
                                      //     )),
                                      ),
                                  child: Icon(
                                    Icons.save,
                                    size: 30,
                                    color: Colors.blue,
                                    // color:
                                    //     index == selectedIndex ? Colors.blue : Colors.lightBlue.shade200,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  getProfileData();
                                  setState(() {
                                    textenable = false;
                                    start = true;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width / 7,
                                  decoration: BoxDecoration(
                                      // color: kWhite,
                                      // border: Border(
                                      //     top: BorderSide(width: 3.0, color: Colors.grey),
                                      //     bottom: BorderSide(
                                      //       width: 5.0,
                                      //       //color: index == selectedIndex ? Colors.blue : Colors.white),
                                      //     )),
                                      ),
                                  child: Icon(
                                    Icons.cancel,
                                    size: 30,
                                    color: Colors.blue,
                                    // color:
                                    //     index == selectedIndex ? Colors.blue : Colors.lightBlue.shade200,
                                  ),
                                ),
                              ),
                            ],
                          ))
                      : Padding(
                          padding: const EdgeInsets.only(left: 300),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                textenable = true;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 7,
                              decoration: BoxDecoration(
                                  // color: kWhite,
                                  // border: Border(
                                  //     top: BorderSide(width: 3.0, color: Colors.grey),
                                  //     bottom: BorderSide(
                                  //       width: 5.0,
                                  //       //color: index == selectedIndex ? Colors.blue : Colors.white),
                                  //     )),
                                  ),
                              child: Icon(
                                Icons.edit,
                                size: 30,
                                color: Colors.blue,
                                // color:
                                //     index == selectedIndex ? Colors.blue : Colors.lightBlue.shade200,
                              ),
                            ),
                          ),
                        ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        new Flexible(
                          child: Container(
                            height: 60,
                            child: new TextField(
                                enabled: textenable,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Calibar'),
                                controller: firstnamecontroller,
                                decoration: InputDecoration(
                                    labelText: "First Name",
                                    // labelStyle: TextStyle(
                                    //     fontWeight: FontWeight.bold, fontSize: 20),
                                    // hintText: hintText,
                                    // enabledBorder: const OutlineInputBorder(
                                    //     borderRadius:
                                    //         BorderRadius.all(Radius.circular(5.0)),
                                    //     borderSide:
                                    //         const BorderSide(color: Colors.grey)),
                                    errorText: validFirstName
                                        ? null
                                        : 'Please enter the name')),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        new Flexible(
                          child: Container(
                            height: 60,
                            child: new TextField(
                                enabled: textenable,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Calibar'),
                                controller: lastnamecontroller,
                                decoration: InputDecoration(
                                    labelText: "Last Name",
                                    // labelStyle: TextStyle(
                                    //     fontWeight: FontWeight.bold, fontSize: 20),
                                    // hintText: hintText,

                                    errorText: validLastName
                                        ? null
                                        : 'Please enter Last Name')),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        new Flexible(
                          child: Container(
                            height: 60,
                            child: new TextField(
                                enabled: textenable,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Calibar'),
                                controller: emailcontroller,
                                decoration: InputDecoration(
                                    labelText: "Email",
                                    // labelStyle: TextStyle(
                                    //     fontWeight: FontWeight.bold, fontSize: 20),
                                    // hintText: hintText,

                                    errorText: validEmail ? null : emailtext)),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        new Flexible(
                          child: Container(
                            height: 60,
                            child: new TextField(
                                enabled: textenable,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Calibar'),
                                controller: addresscontroller,
                                decoration: InputDecoration(
                                    labelText: "Address",
                                    // labelStyle: TextStyle(
                                    //     fontWeight: FontWeight.bold, fontSize: 20),
                                    // hintText: hintText,

                                    errorText: validAddress
                                        ? null
                                        : 'Please enter Address')),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        new Flexible(
                          child: Container(
                            height: 60,
                            child: new TextField(
                                enabled: textenable,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Calibar'),
                                controller: dateofbirthcontroller,
                                decoration: InputDecoration(
                                    labelText: "Date Of Birth",
                                    // labelStyle: TextStyle(
                                    //     fontWeight: FontWeight.bold, fontSize: 20),
                                    hintText: "YYYY-MM-DD",
                                    errorText: validDob ? null : dobtext)),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        new Flexible(
                          child: Container(
                            height: 60,
                            child: new TextField(
                                enabled: textenable,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Calibar'),
                                controller: phonenocontroller,
                                decoration: InputDecoration(
                                    labelText: "Phone Number",
                                    // labelStyle: TextStyle(
                                    //     fontWeight: FontWeight.bold, fontSize: 20),
                                    // hintText: hintText,

                                    errorText: validPhoneNo
                                        ? null
                                        : 'Please enter Phone Number ')),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 25,
                        ),
                        new Flexible(
                          child: Container(
                            height: 60,
                            width: 150,
                            child: new TextField(
                                enabled: textenable,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Calibar'),
                                controller: agecontroller,
                                decoration: InputDecoration(
                                    labelText: "Age",
                                    // labelStyle: TextStyle(
                                    //     fontWeight: FontWeight.bold, fontSize: 20),
                                    // hintText: hintText,

                                    errorText:
                                        validAge ? null : 'Please enter Age')),
                          ),
                        ),
                        SizedBox(
                          width: 40.0,
                        ),
                        new Flexible(
                          child: Container(
                            height: 60,
                            child: new TextField(
                                enabled: textenable,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Calibar'),
                                controller: gendercontroller,
                                decoration: InputDecoration(
                                    labelText: "Gender",
                                    // labelStyle: TextStyle(
                                    //     fontWeight: FontWeight.bold, fontSize: 20),
                                    // hintText: hintText,

                                    errorText: validGender
                                        ? null
                                        : 'Please enter Gender ')),
                          ),
                        ),
                        SizedBox(width: 20),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                      ])
                ],
              ),
            ),
    );
  }

  Widget navbarItems(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Gallery()));
          } else if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BookingsScreen()));
          } else if (index == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Calendar()));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()));
          }
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 3.0, color: Colors.grey),
            bottom: BorderSide(
                width: 5.0,
                color: index == selectedIndex ? Colors.blue : Colors.white),
          ),
        ),
        child: Icon(
          icon,
          size: 30,
          color:
              index == selectedIndex ? Colors.blue : Colors.lightBlue.shade200,
        ),
      ),
    );
  }

  Widget profileImage() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          // child: imageData == null
          //     ? CircleAvatar(
          //   radius: 70.0,
          //   backgroundImage:AssetImage("assets/nikesh.jpg")

          // )
          //     : Container(decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: MemoryImage(base64Decode(imageData)),
          //         fit: BoxFit.fill,
          //       ),
          //       color: Colors.white,
          //     ))
          child: CircleAvatar(
            radius: 70.0,
            backgroundImage:
                imagecontroller.text == null || imagecontroller.text == ""
                    ? AssetImage("assets/profile.png")
                    : MemoryImage(base64Decode(imagecontroller.text)),
          ),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: (builder) => bottomSheet());
              },
              child: Icon(Icons.camera_alt, color: Colors.blue, size: 28.0)),
        )
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text("Choose Profile Image", style: TextStyle(fontSize: 20.0)),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ignore: deprecated_member_use
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera),
                  label: Text("Camera")),
              // ignore: deprecated_member_use
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text("Gallery"))
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource imageSource) async {
    //final pickedFile = await imagePicker.getImage(source: imageSource);
    // final Directory path = await getApplicationDocumentsDirectory();
    // ignore: deprecated_member_use
    final File image = await ImagePicker.pickImage(source: imageSource);
    if (image != null) {
      String imageData = base64Encode(image.readAsBytesSync());
      print(imageData);
      apiService.updatedProfileImage(imageData).then((value) {
        setState(() {
          if (!value) {
            imagecontroller.text = null;
            final snackBar = SnackBar(content: Text("Error saving image!"));
            // ignore: deprecated_member_use
            Scaffold.of(context).showSnackBar(snackBar);
          } else {
            imagecontroller.text = imageData;
          }
        });
      });
    }

    // final imageProperties =
    //     await FlutterImageUtilities.getImageProperties(image);
    // final jpegFile = await FlutterImageUtilities.saveAsJpeg(
    //     sourceFile: File(image.path),
    //     destinationFilePath: "G:/Project/isa_nepal/assets/file1.jpg",
    //     quality: 60,
    //     maxWidth: 1920,
    //     maxHeight: 1080,
    //     canScaleUp: false);
    // final File newImage =    await image.copy('G:/Project/isa_nepal/assets/filename.jpg');
    //  var fileName = basename(file.path);
  }

  void getProfileData() {
    apiService.getUserDetails().then((value) {
      setState(() {
        firstnamecontroller.text = value.firstName;
        lastnamecontroller.text = value.lastName;
        emailcontroller.text = value.email;
        addresscontroller.text = value.address;
        dateofbirthcontroller.text = new DateFormat("yyyy-MM-dd")
            .format(DateTime.parse(value.dateofBirth));
        phonenocontroller.text = value.phoneNo.toString();
        agecontroller.text = value.age.toString();
        gendercontroller.text = value.gender;
        imagecontroller.text = value.imageUrl;
        start = false;
      });
    });
  }

  bool validateText(String userinput) {
    if (userinput.isEmpty) {
      return false;
    }
    return true;
  }

  bool validateDobTextField(String userInput) {
    String pattern = r'^([\d]{4}\-[\d]{2}\-[\d]{2})$';
    RegExp regExp = new RegExp(pattern);
    if (userInput.isEmpty) {
      setState(() {
        dobtext = "Please Enter the date!";
      });
      return false;
    } else {
      if (regExp.hasMatch(userInput)) {
        return true;
      } else {
        setState(() {
          dobtext = "Incorrect date format!";
        });
        return false;
      }
    }
  }

  bool validateEmailTextField(String userInput) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(pattern);
    if (userInput.isEmpty) {
      setState(() {
        emailtext = "Please Enter the Email!";
      });
      return false;
    } else {
      if (regExp.hasMatch(userInput)) {
        return true;
      } else {
        setState(() {
          emailtext = "Incorrect Email format!";
        });
        return false;
      }
    }
  }
}
