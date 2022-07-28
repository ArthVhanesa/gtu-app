class UserProfileModel {
  String? uid;
  String? displayName;
  String? email;
  String? phoneNumber;
  String? photoURL;
  String? firstName;
  String? lastName;

  UserProfileModel(
      {this.uid,
      this.displayName,
      this.email,
      this.phoneNumber,
      this.photoURL,
      this.firstName,
      this.lastName});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    displayName = json['displayName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    photoURL = json['photoURL'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['photoURL'] = this.photoURL;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}
