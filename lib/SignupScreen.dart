import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:isa_nepal/pallete.dart';
import 'package:isa_nepal/widgets/Textfield.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool hidepassword = true;

  String text = 'Gender';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.white,
          body: Column(children: [
            Image(
                image: AssetImage(
                  'assets/isacrop.jpg',
                ),
                height: MediaQuery.of(context).size.height * 0.12,
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
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                new Flexible(
                  child: Textfield(
                    labletext: 'FirstName',
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                new Flexible(
                  child: Textfield(
                    labletext: 'LastName',
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Textfield(
                labletext: 'Address',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Textfield(
                labletext: 'Email Address',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                new Flexible(
                  child: Textfield(
                    labletext: 'DateofBirth\n(YYYY/MM/DD)',
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                new Flexible(
                  child: Textfield(
                    labletext: 'Age',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 50,
                      width: 190,
                      //color: Colors.blue,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey),
                          // const BorderSide(color: Colors.grey),

                          // width: 1.0,
                          //               borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          // borderSide: const BorderSide(color: Colors.grey)))),
                          // style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),

                      //color: Colors.blue,
                      child: DropdownButton(
                          focusColor: Colors.grey,
                          hint: Text(text),
                          items: <String>['Male', 'Female']
                              .map((String val) => DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(
                              () {
                                text = value;
                              },
                            );
                          }),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                new Flexible(
                  child: Textfield(
                    labletext: 'Phone Number',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            new Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 50,
                  child: new TextField(
                      obscureText: hidepassword,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide:
                                  const BorderSide(color: Colors.grey)))),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.green,
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'SignupScreen');
                },
                child: Text(
                  'Signup',
                  style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]),
          // new DropdownButton<String>(

          //   items: <String>['A', 'B', 'C', 'D'].map((String value) {
          //     return new DropdownMenuItem<String>(
          //       value: value,
          //       child: new Text(value),
          //     );
          //   }).toList(),
          //   onChanged: (_) {},
          // )
        ),
      ],
    );
  }
}
//               Expanded(
//                 child: Container(
//                   //height: MediaQuery.of(context).size.height * 0.001,
//                   margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                   child: Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(25)),
//                           color: Colors.grey[50],
//                         ),
//                         child: TextFormField(
//                           onEditingComplete: () {},
//                           // style: TextStyle(
//                           //   fontSize: 19,
//                           //   color: Colors.black,
//                           //   fontWeight: FontWeight.bold,
//                           // ),
//                           decoration: InputDecoration(
//                               hintText: "FirstName",
//                               hintStyle: TextStyle(
//                                 fontSize: 19,
//                                 color: Colors.grey[350],
//                                 fontWeight: FontWeight.w600,
//                               ),
//                               contentPadding: EdgeInsets.symmetric(
//                                   vertical: 27, horizontal: 25),
//                               focusColor: Colors.blue,
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(27),
//                                 borderSide: BorderSide(color: Colors.blue),
//                               )),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 100),
//                         child: Container(
//                           color: Colors.blue,
//                           height: 50,
//                           width: 100,

//                           // decoration: BoxDecoration(
//                           //   color: Colors.grey[500].withOpacity(0.5),
//                           //   borderRadius: BorderRadius.circular(16),
//                           // ),
//                           // child: Center(
//                           child: TextField(
//                             //controller: emailcontroller,

//                             decoration: InputDecoration(
//                               enabledBorder: const OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(20.0)),
//                                   borderSide:
//                                       const BorderSide(color: Colors.grey)),
//                               prefixIcon: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 20.0),
//                                 child: Icon(FontAwesomeIcons.envelope,
//                                     size: 30, color: Colors.black),
//                               ),
//                               hintText: 'Email',
//                               hintStyle: kBodyText.apply(color: Colors.black45),
//                             ),

//                             style: TextStyle(
//                               fontSize: 19,
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             //style: kBodyText,

//                             keyboardType: TextInputType.emailAddress,
//                             //validator: (input)=> !input.contains("@")?"Email Id should be valid" : null,
//                             textInputAction: TextInputAction.next,
//                           ),
//                         ),
//                       ),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
