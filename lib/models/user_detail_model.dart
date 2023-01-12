class UserDetail {
  String? firstName;
  String? lastName;
  String? emailId;
  int? phone;
  String? password;

  UserDetail(
      {this.firstName, this.lastName, this.emailId, this.phone, this.password});

  UserDetail.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailId = json['emailId'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['emailId'] = this.emailId;
    data['phone'] = this.phone;
    data['password'] = this.password;
    return data;
  }
}
