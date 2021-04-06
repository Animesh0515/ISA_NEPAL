class BookingTimeResponseModel {
  final List<dynamic> time;

  BookingTimeResponseModel({this.time});

  factory BookingTimeResponseModel.fromJson(List<dynamic> lst) {
    return BookingTimeResponseModel(time: lst);
  }
}

class BookingTimeRequestModel {
  String date;

  BookingTimeRequestModel({this.date});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {'date': date.trim()};
    return map;
  }
}
