// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:items/constants.dart';
import 'package:items/page/error_page.dart';
import 'package:items/page/home_page.dart';
import 'package:items/page/loading_page.dart';
import 'package:items/page/login_page.dart';
import 'package:items/service/authentication_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _buildMaterialApp(ErrorPage('${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final authenticationService = AuthenticationService();
            if (authenticationService.currentUserId == null) {
              return _buildMaterialApp(LoginPage());
            } else {
              return _buildMaterialApp(HomePage());
            }
          }
          return _buildMaterialApp(LoadingPage());
        });
  }

  MaterialApp _buildMaterialApp(Widget home) {
    return MaterialApp(
      title: kAppTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: home,
      debugShowCheckedModeBanner: false,
    );
  }
}
