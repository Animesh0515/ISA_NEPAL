class ChangeCredRequestModel {
  String username;
  String password;
  ChangeCredRequestModel({this.username, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "Username": username.trim(),
      "Password": password.trim()
    };
    return map;
  }
}

class ChangeCredResponseModel {
  final bool changed;
  ChangeCredResponseModel({this.changed});
  factory ChangeCredResponseModel.fromJson(Map<String, dynamic> json) {
    return ChangeCredResponseModel(changed: json["changed"]);
  }
}
