import 'package:flutter/material.dart';
import 'package:uts/src/config/app_config.dart';
import 'package:uts/src/screens/home_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/signin';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).textTheme;
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo dari assets, fallback ke ikon jika file belum ada
                Center(
                  child: Image.asset(
                    'assets/signin_logo.png',
                    width: 96,
                    height: 96,
                    errorBuilder: (_, __, ___) => Icon(
                      Icons.lock_outline,
                      size: 64,
                      color: colors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text('Selamat Datang',
                    textAlign: TextAlign.center,
                    style: text.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text('Silakan login untuk melanjutkan',
                    textAlign: TextAlign.center,
                    style: text.bodyMedium?.copyWith(color: colors.onSurfaceVariant)),
                const SizedBox(height: 24),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: passwordController,
                  obscureText: obscure,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      onPressed: () => setState(() => obscure = !obscure),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Lupa Password?'),
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton(
                  onPressed: () {
                    final email = emailController.text.trim();
                    final password = passwordController.text;
                    final valid = email.contains('@') && password.length >= 6;
                    if (!valid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Email/password tidak valid (min 6 karakter)')),
                      );
                      return;
                    }
                    Navigator.of(context).pushReplacementNamed(
                      HomeScreen.routeName,
                      arguments: email,
                    );
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text('atau', style: text.bodySmall),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.g_mobiledata, size: 28),
                  label: const Text('Login dengan Google'),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Belum punya akun?', style: text.bodyMedium),
                    TextButton(onPressed: () {}, child: const Text('Daftar')),
                  ],
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text('NIM: $appNim', style: TextStyle(color: colors.outline)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


