import 'package:budgety/middleware/checkAuth.dart';
import 'package:budgety/views/home.dart';
import 'package:budgety/views/login.dart';
import 'package:budgety/views/profile.dart';
import 'package:budgety/views/register.dart';
import 'package:flutter/material.dart';

void main() async {
  bool userAuthenticated = await CheckAuth().checkAuth();
  runApp(MyApp(userAuthenticated: userAuthenticated));
}

class MyApp extends StatelessWidget {
  final bool userAuthenticated;

  const MyApp({
    required this.userAuthenticated,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budgety | Track your monthly budget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: userAuthenticated ? Profile() : const Home(),
      routes: {
        '/home/': (context) => const Home(),
        '/login/': (context) => const Login(),
        '/register/': (context) => const Register(),
        '/profile/': (context) => Profile(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
