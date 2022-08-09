//for google provided user data
class GoogleProfileModel {
  String? uid;
  String? displayName;
  String? email;
  String? phoneNumber;
  String? photoURL;
  String? firstName;
  String? lastName;

  GoogleProfileModel(
      {this.uid,
      this.displayName,
      this.email,
      this.phoneNumber,
      this.photoURL,
      this.firstName,
      this.lastName});

  GoogleProfileModel.fromJson(Map<String, dynamic> json) {
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

//for database users
class DbUserModel {
  String? sId;
  String? email;
  String? firstName;
  String? lastName;
  String? enrollmentNo;
  String? admisssionYear;
  String? collegeCode;
  String? courseCode;
  String? branchCode;
  String? branchName;
  String? collegeName;

  DbUserModel(
      {this.sId,
      this.email,
      this.firstName,
      this.lastName,
      this.enrollmentNo,
      this.admisssionYear,
      this.collegeCode,
      this.courseCode,
      this.branchCode,
      this.branchName,
      this.collegeName});

  DbUserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    enrollmentNo = json['enrollment_no'];
    admisssionYear = json['admisssion_year'];
    collegeCode = json['college_code'];
    courseCode = json['course_code'];
    branchCode = json['branch_code'];
    branchName = json['branch_name'];
    collegeName = json['college_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['enrollment_no'] = this.enrollmentNo;
    data['admisssion_year'] = this.admisssionYear;
    data['college_code'] = this.collegeCode;
    data['course_code'] = this.courseCode;
    data['branch_code'] = this.branchCode;
    data['branch_name'] = this.branchName;
    data['college_name'] = this.collegeName;
    return data;
  }
}
