import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _errorMessage = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Email',
                ),
                autofocus: true,
                controller: _emailController,
              ),
              const SizedBox(height: 16.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                ),
                controller: _passwordController,
              ),
              const SizedBox(height: 16.0),
              Text(
                _errorMessage,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Log In'),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: EdgeInsets.all(10),
                ),
                onPressed: () => _submit(true),
              ),
              TextButton(
                child: Text('Create Account'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onPressed: () => _submit(false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit(bool isLogin) {
    final email = _emailController.text?.trim();
    final password = _passwordController.text?.trim();

    String errorMessage;
    if ((email?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
      errorMessage = 'Email and password are required';
    } else {
      errorMessage = '';
    }

    setState(() {
      _errorMessage = errorMessage;
    });
  }
}
