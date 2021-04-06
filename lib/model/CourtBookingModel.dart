class CourtBookingRequestModel {
  String date;
  String time;

  CourtBookingRequestModel({this.date, this.time});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {'Date': date.trim(), 'Time': time.trim()};
    return map;
  }
}

class CourtBookingResponseModel {
  final bool booked;

  CourtBookingResponseModel({this.booked});

  factory CourtBookingResponseModel.fromJson(Map<String, dynamic> json) {
    return CourtBookingResponseModel(booked: json['booked']);
  }
}
