class LogingResponseModel {
  final bool validate;
  LogingResponseModel({this.validate});

  factory LogingResponseModel.fromJson(Map<String, dynamic> json) {
    return LogingResponseModel(validate: json['validate']);
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({this.email, this.password});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'Username': email.trim(),
      'Password': password.trim(),
    };
    return map;
  }
}
