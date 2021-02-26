import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:items/constants.dart';
import 'package:items/page/error_page.dart';
import 'package:items/page/launch_page.dart';
import 'package:items/page/loading_page.dart';

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
            return _buildMaterialApp(LaunchPage());
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
