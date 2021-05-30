class TrainingBookingRequestModel {
  String venue;
  String time;
  String joiningDate;
  TrainingBookingRequestModel({this.venue, this.time, this.joiningDate});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "Venue": venue.trim(),
      "Time": time.trim(),
      "JoiningDate": joiningDate.trim()
    };

    return map;
  }
}

class TrainingBookingResponseModel {
  final bool booked;

  TrainingBookingResponseModel({this.booked});

  factory TrainingBookingResponseModel.fromJson(Map<String, dynamic> json) {
    return TrainingBookingResponseModel(booked: json['booked']);
  }
}
