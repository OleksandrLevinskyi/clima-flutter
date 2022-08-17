import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/network_manager.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitRing(
        color: Colors.white,
        size: 100,
      ),
    );
  }

  void getLocationData() async {
    location = Location();

    await location.getCurrentLocation();
    final Map<String, dynamic> data = await NetworkManager(location).getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          weatherData: data,
        ),
      ),
    );
  }
}
