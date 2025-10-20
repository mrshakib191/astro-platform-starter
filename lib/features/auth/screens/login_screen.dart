import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('লগইন'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Google Sign-In logic will be added here
          },
          child: const Text('গুগল দিয়ে লগইন করুন'),
        ),
      ),
    );
  }
}
