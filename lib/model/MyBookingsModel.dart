class MyBookingsModel {
  final String bookingType;
  final String bookedFor;
  final String bookedDate;
  final String time;
  final String venue;

  MyBookingsModel(
      {this.bookingType,
      this.bookedFor,
      this.bookedDate,
      this.time,
      this.venue});

  // factory MyBookingsModel.toJson(Map<String, dynamic> json) {
  //   return MyBookingsModel(
  //       bookingType: json["BookingType"],
  //       bookedFor: json["BookedFor"],
  //       bookedDate: json["BookedDate"],
  //       time: json["Time"],
  //       venue: json["Venue"]);
  // }
}
