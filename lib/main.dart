import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';

void main() => runApp(const WorldTimeApp());

class WorldTimeApp extends StatelessWidget {
  const WorldTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location' : (context) => const ChooseLocation(),
      },
    );
  }
}