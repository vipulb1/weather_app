import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screen/home_screen.dart';
import 'package:weather_app/screen/network_error_screen.dart';
import 'package:weather_app/services/weather_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (create) => WeatherService(),
      child: MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        darkTheme: ThemeData(primarySwatch: Colors.yellow),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              MaterialPageRoute(builder: (context) => const HomeScreen());
            case '/network_error':
              MaterialPageRoute(
                  builder: (context) => const NetworkErrorScreen());
            default:
              MaterialPageRoute(
                builder: (context) => const Scaffold(
                  body: Center(
                    child: Text(
                      'Page not found',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
