import 'package:flutter/material.dart';
import 'package:items/constants.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(this.message);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
