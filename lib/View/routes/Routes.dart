import 'package:flutter/material.dart';
import 'package:justwravel/View/HomeView/home.dart';
import '../Routes/RoutesName.dart';
import '../onboard/onboard_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onboard:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnboardScreen());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Home());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }
}
