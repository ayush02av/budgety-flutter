// ignore_for_file: file_names

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CheckAuth {
  Future<bool> checkAuth() async {
    bool? userAuthenticated;

    try {
      const storage = FlutterSecureStorage();
      final String? userAuthToken = await storage.read(key: 'userAuthToken');
      if (userAuthToken == null) {
        userAuthenticated = false;
      } else {
        userAuthenticated = true;
      }
    } catch (e) {
      userAuthenticated = true;
    }

    return userAuthenticated;
  }
}
