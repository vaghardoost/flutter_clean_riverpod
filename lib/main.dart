import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_clean_riverpod/config/routes/landing.dart';
import 'package:flutter_clean_riverpod/injection_container.dart';
import 'package:flutter_clean_riverpod/config/themes/dark.dart';

void main() async {
  await initializeDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: darkTheme,
      routerConfig: GoRouter(
        initialLocation: "/landing",
        routes: [
          landingRoute,
        ],
      ),
    );
  }
}
