import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileService {
  dynamic profile() async {
    const storage = FlutterSecureStorage();
    String? userAuthToken = await storage.read(key: 'userAuthToken');

    var response = await http.get(
        Uri.parse(
            'https://budgety-server-production.up.railway.app/general/profile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': userAuthToken ?? ''
        });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return null;
  }
}
