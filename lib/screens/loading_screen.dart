import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
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
    return Scaffold();
  }

  void getLocationData() async {
    location = Location();

    await location.getCurrentLocation();
    final Map<String, dynamic> data = await NetworkManager(location).getData();
  }
}
