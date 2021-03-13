import 'dart:convert';

import 'package:isa_nepal/model/login_model.dart';
import 'package:http/http.dart' as https;

class APIService {
  Future<LogingResponseModel> login(LoginRequestModel loginRequestModel) async {
    String url = "https://192.168.0.100:44387/api/Account/login";
    // Location currentLocation = window.location;
    // print(currentLocation.href);
    // var url = window.location.href;
    // print(url);
    //print(Uri.base);
    try {
      final response = await https.post(url, body: loginRequestModel.toJson());
      if (response.statusCode == 200 || response.statusCode == 400) {
        //List<dynamic> pdfText = new List<dynamic>();
        var pdfText = json.decode(response.body);

        print(pdfText);

        //var data = json.decode(response.body);
        //.cast<String, dynamic>();

        //int count = pdfText.length();
        //print(count);
        // print(pdfText["validate"]);
        //Map<String, dynamic> map =
        // new Map<String, dynamic>.from(json.decode(response.body));
        return LogingResponseModel.fromJson(jsonDecode(pdfText));
      } else {
        throw Exception("Failed to Load Data");
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
