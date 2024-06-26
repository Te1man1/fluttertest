import 'package:flutter/material.dart';
import 'main_frame.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';

  void _login() {
    String login = _loginController.text;
    String password = _passwordController.text;

    if (login == "test" && password == "test") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainFrame()),// Переход на главный экран после успешной авторизации
      );
      setState(() {
        _errorMessage = '';
      });
    } else {
      setState(() {
        _errorMessage = 'Incorrect login or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authorisation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _loginController,
              decoration: const InputDecoration(
                labelText: 'Login',
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
              obscureText: true,
            ),
            Text(
              _errorMessage,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Enter'),
            ),
          ],
        ),
      ),
    );
  }
}