// a class were all three classes will be combined ie weather_daily,weather_current,weather_hourly .

import 'package:weather_app/models/weather_current_data.dart';

class WeatherData {
  final WeatherDataCurrent? current;

  WeatherData([this.current]);
}
