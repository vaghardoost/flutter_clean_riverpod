import 'package:go_router/go_router.dart';
import 'package:flutter_clean_riverpod/screens/landing/presentation/page/page.dart';

final landingRoute = GoRoute(
  path: "/landing",
  builder: (context, state) => const LangingPage(),
);
