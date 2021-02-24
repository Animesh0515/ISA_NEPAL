import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const TextStyle kBodyText =
    TextStyle(fontSize: 22, color: Colors.white, height: 1.5);

const Color kWhite = Colors.white;
const Color kBlue = Color(0xff5663ff);

Future launchurl(String url) async {
  if (await canLaunch(url)) {
    await launch(url,
        forceSafariVC: false,
        forceWebView:
            false); //forceSafariVC to force ios device to open the link in browser while forcewebview forces android device to open in browser
  } else {
    throw ("Can't Launch $url");
  }
}
