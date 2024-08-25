import 'package:go_router/go_router.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/home/pages/settings_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';
import '../../features/univer/pages/add_pros_page.dart';
import '../../features/univer/pages/add_univer_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => const AddUniverPage(),
    ),
    GoRoute(
      path: '/add-pros',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return AddProsPage(
          name: data['name'],
          location: data['location'],
          description: data['description'],
          rate: data['rate'],
        );
      },
    ),
  ],
);
