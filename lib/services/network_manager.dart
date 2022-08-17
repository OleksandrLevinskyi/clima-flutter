import 'package:clima/services/location.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkManager {
  final Location location;

  NetworkManager(this.location);

  Future getData() async {
    Uri url = Uri.https(
      dotenv.env['OPEN_WEATHER_API_URL'],
      dotenv.env['OPEN_WEATHER_API_PATH'],
      {
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
        'appid': dotenv.env['OPEN_WEATHER_API_KEY'],
      },
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body) as Map<String, dynamic>;
    }

    print('Request failed with status: ${response.statusCode}.');
  }
}
