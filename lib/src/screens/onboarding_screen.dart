import 'package:flutter/material.dart';
import 'package:uts/src/config/app_config.dart';
import 'package:uts/src/screens/sign_in_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final pages = <_OnboardData>[
      _OnboardData(
        title: 'Welcome',
        subtitle: 'Forgot to bring your wallet when you are shopping?',
        asset: 'assets/onboarding1.png',
        fallbackIcon: Icons.chat_bubble_outline,
      ),
      _OnboardData(
        title: 'Welcome',
        subtitle: "Don't worry! we got you cover. Use wallet instead of cash!",
        asset: 'assets/onboarding2.png',
        fallbackIcon: Icons.verified_outlined,
      ),
      _OnboardData(
        title: 'Welcome',
        subtitle: 'Let’s try Wallet now! And get the best solution.',
        asset: 'assets/onboarding3.png',
        fallbackIcon: Icons.notifications_outlined,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (i) => setState(() => _pageIndex = i),
                itemCount: pages.length,
                itemBuilder: (_, i) => _OnboardPage(data: pages[i]),
              ),
            ),
            const SizedBox(height: 8),
            _DotsIndicator(count: pages.length, index: _pageIndex),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    if (_pageIndex < pages.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    } else {
                      Navigator.of(context).pushReplacementNamed(
                        SignInScreen.routeName,
                      );
                    }
                  },
                  child: Text(_pageIndex < pages.length - 1
                      ? 'Continue'
                      : 'Get Started'),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                'NIM: $appNim',
                style: TextStyle(color: colors.outline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardData {
  final String title;
  final String subtitle;
  final String asset; // image asset path
  final IconData fallbackIcon;
  const _OnboardData({
    required this.title,
    required this.subtitle,
    required this.asset,
    required this.fallbackIcon,
  });
}

class _OnboardPage extends StatelessWidget {
  final _OnboardData data;
  const _OnboardPage({required this.data});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final TextTheme text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 92,
            backgroundColor: colors.primaryContainer,
            child: ClipOval(
              child: Image.asset(
                data.asset,
                width: 128,
                height: 128,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Icon(data.fallbackIcon, color: colors.primary, size: 64),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text('Welcome', style: text.headlineMedium?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Text(
            data.subtitle,
            textAlign: TextAlign.center,
            style: text.bodyMedium?.copyWith(color: colors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  final int count;
  final int index;
  const _DotsIndicator({required this.count, required this.index});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final bool active = i == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: active ? 20 : 8,
          decoration: BoxDecoration(
            color: active ? colors.primary : colors.outlineVariant,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}


