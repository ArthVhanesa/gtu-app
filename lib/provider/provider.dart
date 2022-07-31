import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:gtu_app/provider/globals.dart';

class Provider extends GetConnect {
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
      return Future.error("Question paper not found!");
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
      return Future.error(response.body.toString());
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getInitialSyllabusData() async {
    final response =
        await httpClient.get('${AppGlobals.API_URL}/syllabus/BE/07/7');
    if (response.statusCode != 200) {
      return Future.error(response.body.toString());
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getSearchedSyllabusData(String subCode) async {
    log("search for: $subCode");
    final response =
        await httpClient.get('${AppGlobals.API_URL}/syllabus/BE/$subCode');

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

  Future<void> logOut() async {
    log("logged out");
    return FirebaseAuth.instance.signOut();
  }
}
