import 'dart:convert';

import 'package:budgety/services/profiile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Budgety'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: ProfileService().profile(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            if (snapshot.hasData) {
              dynamic data = jsonDecode(jsonEncode(snapshot.data));
              return Center(
                child: Text('Welcome ${data['user']['name']}'),
              );
            }

            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
