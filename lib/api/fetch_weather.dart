import 'dart:convert';
import 'dart:io';

import 'package:weather_app/api/api_key.dart';
import 'package:weather_app/models/weather_current_data.dart';

import '../models/weather_data.dart';
import 'package:http/http.dart ' as http;

class FetchWeatherAPi {
  WeatherData? weatherData;
  // processing the data from response to json

  Future<WeatherData> processData(lat, lon) async {
    var reponse = await http.get(Uri.parse(apiUrl(lat, lon)));
    var jsonString = jsonDecode(reponse.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));
    return weatherData!;
  }
}

String apiUrl(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apikey&units=metric&exclude=minutely";
  return url;
}
