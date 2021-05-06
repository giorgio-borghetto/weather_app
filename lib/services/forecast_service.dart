import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/services/weather_api.dart';

class ForecastService {
  final WeatherApi weatherApi;
  ForecastService(this.weatherApi);

  Future<Forecast> getWeather(String city) async {
    final Location location = await weatherApi.getLocation(city);
    return await weatherApi.getWeather(location);
  }
}