import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  void getLocation() async {
    final Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);

    await getData();
  }

  Future<void> getData() async {
    Uri url = Uri.https(
      dotenv.env['OPEN_WEATHER_API_URL'],
      dotenv.env['OPEN_WEATHER_API_PATH'],
      {
        'lat': '50',
        'lon': '50',
        'appid': dotenv.env['OPEN_WEATHER_API_KEY'],
      },
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      print(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
