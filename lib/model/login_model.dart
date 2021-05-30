class LogingResponseModel {
  final bool validate;
  final String token;
  LogingResponseModel({this.validate, this.token});

  factory LogingResponseModel.fromJson(Map<String, dynamic> json) {
    return LogingResponseModel(
        validate: json['validate'], token: json['token']);
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
