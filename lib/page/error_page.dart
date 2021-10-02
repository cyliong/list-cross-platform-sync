import 'package:flutter/material.dart';
import 'package:items/constants.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
    required this.message,
  }) : super(key: key);

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
