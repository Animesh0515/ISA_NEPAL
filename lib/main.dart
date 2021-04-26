import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isa_nepal/Videos.dart';
import 'package:video_player/video_player.dart';
import 'Chewie.dart';
import 'Videos1.dart';
import 'screens.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ISA NEPAL',
      theme: ThemeData(
        textTheme:
            GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
