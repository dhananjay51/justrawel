import 'dart:io';
import 'package:flutter/material.dart';
import 'package:justwravel/View/NavigationView/BottomNavigationVIew.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:justwravel/res/app_theme.dart';
import 'package:justwravel/viewmodel/HomeViewModel.dart';
import 'package:provider/provider.dart';

import 'View/routes/Routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await initialization(null);
  HttpOverrides.global = MyHttpOverrides();
  await Future.delayed(Duration(milliseconds: 1000));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Flutter Demo',

      home: const BottomNavigation(),
    );
  }

}

class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

/*import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:justwravel/res/app_theme.dart';
import 'package:justwravel/viewmodel/HomeViewModel.dart';
import 'package:provider/provider.dart';

import 'View/Routes/RoutesName.dart';
import 'View/routes/Routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization(null);
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 4));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewViewModel()),
      ],
      child: MaterialApp(
        scrollBehavior: CustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme().appTheme(),
        initialRoute: RoutesName.onboard,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}*/




