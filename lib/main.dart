import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ipotato_timer_task/screens/splash/splash_screen.dart';

import 'screens/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'iPotato Timer',
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'splash',
      path: '/',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
  ],
);
