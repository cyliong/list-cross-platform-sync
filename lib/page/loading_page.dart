import 'package:flutter/material.dart';
import 'package:items/constants.dart';

class LoadingPage extends StatelessWidget {
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
