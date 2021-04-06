import 'dart:convert';
import 'dart:io';

import 'package:isa_nepal/CourtBooking.dart';
import 'package:isa_nepal/model/BookingTimeModel.dart';
import 'package:isa_nepal/model/CourtBookingModel.dart';
import 'package:isa_nepal/model/Signup_model.dart';
import 'package:isa_nepal/model/login_model.dart';
import 'package:http/http.dart' as https;

class APIService {
  Future<LogingResponseModel> login(LoginRequestModel loginRequestModel) async {
    String url = "https://3a582ff1a805.ngrok.io/api/Account/login";
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

  Future<SignupResponseModel> Signup(
      SignupRequestModel signupRequestModel) async {
    String url = "https://3a582ff1a805.ngrok.io/api/Account/Signup";
    try {
      final response = await https.post(url, body: signupRequestModel.toJson());
      if (response.statusCode == 200 || response.statusCode == 400) {
        var jsonres = jsonDecode(response.body);
        return SignupResponseModel.fromJson(jsonDecode(jsonres));
      } else {
        throw Exception("Failed to store data");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<BookingTimeResponseModel> getTime(
      BookingTimeRequestModel bookingTimeRequestModel) async {
    String url = "https://192.168.0.103:44387/api/CourtBooking/GetTimeList";
    try {
      final response =
          await https.post(url, body: bookingTimeRequestModel.toJson());
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);

        return BookingTimeResponseModel.fromJson(result);
      } else {
        throw Exception("Failed to load dates");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<CourtBookingResponseModel> booking(
      CourtBookingRequestModel requestModel) async {
    String url = "https://192.168.0.103:44387/api/CourtBooking/BookCourt";
    try {
      final response = await https.post(url, body: requestModel.toJson());
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        return CourtBookingResponseModel.fromJson(jsonDecode(result));
      } else {
        throw Exception("Failed to save data");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
