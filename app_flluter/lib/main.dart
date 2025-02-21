import 'package:app_flluter/screen/game_screen/home_screen.dart';
import 'package:app_flluter/screen/join_screen.dart';
import 'package:app_flluter/screen/login_screen.dart';
import 'package:app_flluter/screen/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'user_app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/main',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/main':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const MainScreen(),
              transitionDuration: Duration(seconds: 0),
            );
          case '/join':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const JoinScreen(),
              transitionDuration: Duration(seconds: 0),
            );
          case '/login':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const LoginScreen(),
              transitionDuration: Duration(seconds: 0),
            );
          case '/game/home':
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (context, animation, secondaryAnimation) {
                final args = settings.arguments as Map<String, String>;
                return HomeScreen();
              },
            );
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
