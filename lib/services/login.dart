import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginService {
  void login(String emailInput, String passwordInput) async {
    var response = await http.post(
        Uri.parse(
            'https://budgety-server-production.up.railway.app/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{'email': emailInput, 'password': passwordInput},
        ));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      // Create storage
      const storage = FlutterSecureStorage();

      // Write value
      await storage.write(key: 'userAuthToken', value: json['token']);

      final String? userAuthToken = await storage.read(key: 'userAuthToken');
      print(userAuthToken);
    }
  }
}
