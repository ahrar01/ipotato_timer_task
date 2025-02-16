import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'core/di.iconfig.dart';
import 'screens/home/presentation/home_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'themes/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final customThemes = MyThemes();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (ctx) => ThemeProvider()),
      ],
      child: MaterialApp.router(
        title: 'iPotato Timer',
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: customThemes.buildLightTheme(),
        darkTheme: customThemes.buildDarkTheme(),
        routerConfig: _router,
      ),
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
