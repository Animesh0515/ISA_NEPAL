import 'dart:convert';
import 'dart:io';

import 'package:isa_nepal/CourtBooking.dart';
import 'package:isa_nepal/model/BookingTimeModel.dart';
import 'package:isa_nepal/model/CalendarModel.dart';
import 'package:isa_nepal/model/CourtBookingModel.dart';
import 'package:isa_nepal/model/MyBookingsModel.dart';
import 'package:isa_nepal/model/Signup_model.dart';
import 'package:isa_nepal/model/UserModel.dart';
import 'package:isa_nepal/model/login_model.dart';
import 'package:http/http.dart' as https;

class APIService {
  Future<LogingResponseModel> login(LoginRequestModel loginRequestModel) async {
    String url = "https://d25687fe502b.ngrok.io/api/Account/login";
    // Location currentLocation = window.location;
    // print(currentLocation.href);
    // var url = window.location.href;
    // print(url);
    //print(Uri.base);
    try {
      print(loginRequestModel.toJson());
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

  Future<SignupResponseModel> signup(
      SignupRequestModel signupRequestModel) async {
    String url = "https://d25687fe502b.ngrok.io/api/Account/Signup";
    try {
      final response = await https.post(url, body: signupRequestModel.toJson());
      if (response.statusCode == 200 || response.statusCode == 400) {
        var jsonres = jsonDecode(response.body);
        print(jsonres);
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
    String url = "https://d25687fe502b.ngrok.io/api/CourtBooking/GetTimeList";
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
    String url = "https://d25687fe502b.ngrok.io/api/CourtBooking/BookCourt";
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

  Future<List> getCalendarData(int weekend) async {
    List<CalendarResponseModel> lst = [];
    String url = "https://d25687fe502b.ngrok.io/api/Calendar/GetData";
    try {
      final response = await https.post(url,
          headers: {'Content-type': 'application/json'},
          body: jsonEncode(weekend));
      if (response.statusCode == 200) {
        List<dynamic> list = jsonDecode(response.body);

        return list;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print(e);
    }
    return lst;
  }

  Future<List<dynamic>> getPhotos() async {
    // ignore: deprecated_member_use

    String url = "https://d25687fe502b.ngrok.io/api/Gallery/GetPhotos";
    try {
      var response = await https.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> photos = jsonDecode(response.body);
        return photos;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool> updatedProfileImage(String imageurl) async {
    String url = "https://d25687fe502b.ngrok.io/api/Profile/UpdateImage";
    try {
      print(jsonEncode(imageurl));
      var response = await https.post(url,
          headers: {'Content-type': 'application/json'},
          body: jsonEncode(imageurl));
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<UserDetailModel> getUserDetails() async {
    String url = "https://d25687fe502b.ngrok.io/api/Profile/GetUserDetails";

    try {
      var response = await https.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(json.decode(response.body));

        return UserDetailModel(
            firstName: data["First_Name"],
            lastName: data["Last_Name"],
            email: data["Email"],
            address: data["Address"],
            phoneNo: data["Phone_Number"],
            dateofBirth: data["DateOfBirth"],
            gender: data["Gender"],
            age: data["Age"],
            imageUrl: data["ImageUrl"]);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<UserUpdateResponseModel> updateUser(UserDetailModel userDetail) async {
    String url = "https://d25687fe502b.ngrok.io/api/Profile/UpdateUserDetails";
    try {
      print(json.encode(userDetail.toJson()));
      var response =
          await https.post(url, body: json.encode(userDetail.toJson()));
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return UserUpdateResponseModel.fromJson(
            json.decode(json.decode(response.body)));
      } else {
        throw Exception("Failed to update data");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List> getBookings() async {
    String url = "https://d25687fe502b.ngrok.io/api/CourtBooking/GetBookings";
    try {
      var response = await https.get(url);
      if (response.statusCode == 200) {
        //print(json.decode(json.decode(response.body)));
        List<dynamic> bookingslst = json.decode(json.decode(response.body));
        return bookingslst;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List> getNotifications() async {
    String url =
        "https://d25687fe502b.ngrok.io/api/Notification/GetNotification";
    try {
      var response = await https.get(url);
      if (response.statusCode == 200) {
        //print(json.decode(json.decode(response.body)));
        List<dynamic> notificationslst =
            json.decode(json.decode(response.body));
        return notificationslst;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
