import 'package:flutter/material.dart';
import 'package:items/page/home_page.dart';
import 'package:items/service/authentication_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _authenticationService = AuthenticationService();

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
      body: LayoutBuilder(
        builder: (context, viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Center(
                child: Container(
                  decoration: viewportConstraints.maxWidth > 600
                      ? BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        )
                      : null,
                  constraints: const BoxConstraints(
                    maxWidth: 380,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        autofocus: true,
                        controller: _emailController,
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        controller: _passwordController,
                        onSubmitted: (_) => _submit(true),
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
                        child: const Text('Log In'),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: const EdgeInsets.all(18),
                        ),
                        onPressed: () => _submit(true),
                      ),
                      const SizedBox(height: 10.0),
                      TextButton(
                        child: const Text('Create Account'),
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () => _submit(false),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _submit(bool isLogin) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if ((email.isEmpty) || (password.isEmpty)) {
      setState(() {
        _errorMessage = 'Email and password are required';
      });
      return;
    }

    setState(() {
      _errorMessage = '';
    });

    try {
      if (isLogin) {
        await _authenticationService.signIn(email: email, password: password);
      } else {
        await _authenticationService.signUp(email: email, password: password);
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }
}
