import 'package:flutter/material.dart';
import 'package:uts/src/config/app_config.dart';
import 'package:uts/src/routes/app_router.dart';
import 'package:uts/src/theme/seed_theme.dart';

void main() {
  runApp(const UtsApp());
}

class UtsApp extends StatelessWidget {
  const UtsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Color seed = seedColorFromNim(appNim);
    final ColorScheme scheme = ColorScheme.fromSeed(seedColor: seed);

    return MaterialApp(
      title: 'Ujian Flutter',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: scheme,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
    );
  }
}


