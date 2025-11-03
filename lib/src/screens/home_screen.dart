import 'package:flutter/material.dart';
import 'package:uts/src/config/app_config.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  final String email;
  const HomeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Login sukses!', style: text.headlineSmall),
            const SizedBox(height: 8),
            Text('Email: $email'),
            const SizedBox(height: 8),
            Text('NIM: $appNim'),
          ],
        ),
      ),
    );
  }
}


