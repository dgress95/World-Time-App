import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time_app/services/world_time.dart';
import 'home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: '/Europe/Berlin');
    await instance.getTime();
    if (!context.mounted) return;
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time
    });
    // if (!context.mounted) return;
    // Navigator.push(context, MaterialPageRoute(builder: (context) => const Home(),
    //   settings: RouteSettings(
    //   arguments: {
    //     'location': instance.location,
    //     'flag': instance.flag,
    //     'time': instance.time,
    //   }
    // )));
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}
