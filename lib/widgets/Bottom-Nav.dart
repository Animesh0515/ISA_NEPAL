import 'package:flutter/material.dart';

import '../Maindrawer.dart';
import '../pallete.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({
    Key key,
    @required this.selectedIndex,
  }) : super(key: key);
  final int selectedIndex;
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: Row(
        //   children: <Widget>[
        //     NavbarItems(Icons.photo_album, 0),
        //     NavbarItems(Icons.sports_basketball, 1),
        //     NavbarItems(Icons.calendar_today, 2),
        //     NavbarItems(Icons.person, 3),
        //   ],
        // ),
        // appBar: AppBar(
        //   backgroundColor: kWhite,
        //   textTheme: Theme.of(context).textTheme.apply(
        //         bodyColor: Colors.grey,
        //       ),
        //   iconTheme: IconThemeData(color: Colors.black),
        //   title: Padding(
        //     padding: const EdgeInsets.fromLTRB(140, 0, 0, 0),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Container(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Text('ISA NEPAL',
        //                 style: TextStyle(
        //                     fontSize: 25.0, fontWeight: FontWeight.bold))),
        //         CircleAvatar(
        //           radius: 20,
        //           backgroundImage: AssetImage('assets/isa.png'),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // drawer: Drawer(
        //   child: Maindrawer(),
        // ),
        );
  }

  // Widget NavbarItems(IconData icon, int index) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         selectedIndex = index;
  //         if (index == 0) {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => SignupScreen()));
  //         } else if (index == 1) {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => BookingsScreen()));
  //         } else if (index == 2) {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => SignupScreen()));
  //         } else {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => SignupScreen()));
  //         }
  //       });
  //     },
  //     child: Container(
  //       height: 60,
  //       width: MediaQuery.of(context).size.width / 4,
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         border: Border(
  //           top: BorderSide(width: 3.0, color: Colors.grey),
  //           bottom: BorderSide(
  //               width: 5.0,
  //               color: index == selectedIndex ? Colors.blue : Colors.white),
  //         ),
  //       ),
  //       child: Icon(
  //         icon,
  //         size: 30,
  //         color:
  //             index == selectedIndex ? Colors.blue : Colors.lightBlue.shade200,
  //       ),
  //     ),
  //   );
}
