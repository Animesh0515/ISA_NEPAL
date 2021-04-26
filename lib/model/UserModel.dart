class UserDetailModel {
  String firstName;
  String lastName;
  String address;
  String email;
  String dateofBirth;
  int age;
  String gender;
  int phoneNo;
  String imageUrl;

  UserDetailModel({
    this.firstName,
    this.lastName,
    this.address,
    this.email,
    this.dateofBirth,
    this.age,
    this.gender,
    this.phoneNo,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'First_Name': firstName.trim(),
      'Last_Name': lastName.trim(),
      'Email': email.trim(),
      'DateOfBirth': dateofBirth.trim(),
      'Age': age,
      'Phone_Number': phoneNo,
      'Gender': gender.trim(),
      'Address': address.trim()
    };
    return map;
  }
}

class UserUpdateResponseModel {
  final bool updated;
  UserUpdateResponseModel({this.updated});

  factory UserUpdateResponseModel.fromJson(Map<String, dynamic> json) {
    return UserUpdateResponseModel(updated: json["updated"]);
  }
}
