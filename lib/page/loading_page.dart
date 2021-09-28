import 'package:flutter/material.dart';
import 'package:items/constants.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppTitle),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
