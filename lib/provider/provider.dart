import 'dart:developer';

import 'package:get/get.dart';

class Provider extends GetConnect {
  Future<dynamic> getAllCircular() async {
    final response =
        await get('https://bookocean-app.herokuapp.com/circular/recent');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getImpCircular() async {
    final response =
        await get('https://bookocean-app.herokuapp.com/circular/important');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}
