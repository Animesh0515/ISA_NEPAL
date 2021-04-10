class CalendarResponseModel {
  final String time;
  final String venue;

  CalendarResponseModel({this.time, this.venue});

  static List<dynamic> fromJson(List<dynamic> lst) {
    return lst;
  }
}
