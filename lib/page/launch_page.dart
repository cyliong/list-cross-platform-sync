import 'dart:async';

import 'package:flutter/material.dart';
import 'package:items/constants.dart';
import 'package:items/page/home_page.dart';
import 'package:items/page/login_page.dart';
import 'package:items/service/authentication_service.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    super.initState();
    Timer.run(() {
      final authenticationService = AuthenticationService();
      MaterialPageRoute route;
      if (authenticationService.currentUserId == null) {
        route = MaterialPageRoute(builder: (context) => LoginPage());
      } else {
        route = MaterialPageRoute(builder: (context) => HomePage());
      }
      Navigator.pushReplacement(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
