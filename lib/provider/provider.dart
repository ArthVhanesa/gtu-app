import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:gtu_app/provider/globals.dart';

class Provider extends GetConnect {
  Map<String, String> errorMsgObj = {"error_message": "Something Went Wrong!"};

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<dynamic> getUserByEmail(String email) async {
    final response = await httpClient
        .post('${AppGlobals.API_URL}/get-user', body: {"email": email});
    if (response.statusCode != 200) {
      return Future.error(response.body.toString());
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> registerNewUser(
      String email, String fname, String lname, String enrollment) async {
    final response =
        await httpClient.post('${AppGlobals.API_URL}/register-user', body: {
      "email": email,
      "enrollment_no": enrollment,
      "first_name": fname,
      "last_name": lname
    });

    if (response.statusCode != 200) {
      return Future.error(response.body ?? errorMsgObj);
    } else {
      return response.body;
    }
  }

  Future<dynamic> updateUserName(
      String email, String fname, String lname) async {
    final response = await httpClient.post(
        '${AppGlobals.API_URL}/update-user-name',
        body: {"email": email, "first_name": fname, "last_name": lname});

    if (response.statusCode != 200) {
      return Future.error(response.body ?? errorMsgObj);
    } else {
      return response.body;
    }
  }

  Future<dynamic> updateEnrollment(String email, String enrollment) async {
    final response = await httpClient.post(
        '${AppGlobals.API_URL}/update-user-enrollment',
        body: {"email": email, "enrollment_no": enrollment});

    if (response.statusCode != 200) {
      return Future.error(response.body ?? errorMsgObj);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getAllCircular() async {
    final response =
        await httpClient.get('${AppGlobals.API_URL}/circular/recent');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getImpCircular() async {
    final response =
        await httpClient.get('${AppGlobals.API_URL}/circular/important');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getAcademicCalendar() async {
    final response =
        await httpClient.get('${AppGlobals.API_URL}/circular/calender');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getQuestionPapers(String subCode) async {
    log("search for: $subCode");
    final response =
        await httpClient.get('${AppGlobals.API_URL}/papers/$subCode');

    if (response.statusCode == 404) {
      return [];
    } else if (response.statusCode != 200) {
      return Future.error(response.body.toString());
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getAllSem() async {
    final response = await httpClient.get('${AppGlobals.API_URL}/timetable/BE');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getTimeTableData(String sem, String branchCode) async {
    final response = await httpClient.post('${AppGlobals.API_URL}/timetable',
        body: {"degree": "BE", "sem": sem, "branchCode": branchCode});
    if (response.statusCode != 200) {
      return Future.error(response.body ?? errorMsgObj);
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getInitialSyllabusData(String branch, String sem) async {
    final response =
        await httpClient.get('${AppGlobals.API_URL}/syllabus/BE/$branch/$sem');
    if (response.statusCode != 200) {
      return Future.error(response.body.toString());
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getSearchedSyllabusData(
      String subCode, String branchCode) async {
    log("search for: $subCode");
    final response = await httpClient.post('${AppGlobals.API_URL}/syllabus',
        body: {"subject_code": subCode, "branch_code": branchCode});

    if (response.statusCode == 404) {
      return Future.error("Subject not found!");
    } else if (response.statusCode != 200) {
      return Future.error(response.body.toString());
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<void> logOut() async {
    log("logged out");
    return FirebaseAuth.instance.signOut();
  }
}
