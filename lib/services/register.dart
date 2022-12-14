import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterService {
  void register(
      String nameInput, String emailInput, String passwordInput) async {
    var response = await http.post(
        Uri.parse(
            'https://budgety-server-production.up.railway.app/auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{
            'name': nameInput,
            'email': emailInput,
            'password': passwordInput
          },
        ));
    if (response.statusCode == 200) {
      var json = response.body;
      print(json);
      return;
    }
    print(response.body);
  }
}
