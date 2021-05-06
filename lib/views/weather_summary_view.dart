import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class WeatherSummary extends StatelessWidget {
  final WeatherCondition condition;
  final double temp;
  final double feelsLike;
  final bool isdayTime;

  WeatherSummary(
      {Key key,
        @required this.condition,
        @required this.temp,
        @required this.feelsLike,
        @required this.isdayTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(
          children: [
            Text(
              '${_formatTemperature(this.temp)}°ᶜ',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'Feels like ${_formatTemperature(this.feelsLike)}°ᶜ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        _mapWeatherConditionToImage(this.condition, this.isdayTime),
      ]),
    );
  }

  String _formatTemperature(double t) {
    var temp = (t == null ? '' : t.round().toString());
    return temp;
  }

  Widget _mapWeatherConditionToImage(
      WeatherCondition condition, bool isDayTime) {
    Image image;
    switch (condition) {
      case WeatherCondition.thunderstorm:
        image = Image.network('http://openweathermap.org/img/wn/11d@2x.png');
        break;
      case WeatherCondition.heavyCloud:
        image = Image.network('http://openweathermap.org/img/wn/03d@2x.png');
        break;
      case WeatherCondition.lightCloud:
        image = Image.network('http://openweathermap.org/img/wn/02d@2x.png');
        break;
      case WeatherCondition.drizzle:
      case WeatherCondition.mist:
        image = Image.network('http://openweathermap.org/img/wn/50d@2x.png');
        break;
      case WeatherCondition.clear:
        image = Image.network('http://openweathermap.org/img/wn/01d@2x.png');
        break;
      case WeatherCondition.fog:
        image = Image.network('http://openweathermap.org/img/wn/50d@2x.png');
        break;
      case WeatherCondition.snow:
        image = Image.network('http://openweathermap.org/img/wn/13d@2x.png');
        break;
      case WeatherCondition.rain:
        image = Image.network('http://openweathermap.org/img/wn/10d@2x.png');
        break;
      case WeatherCondition.atmosphere:
        image = Image.network('http://openweathermap.org/img/wn/04d@2x.png');
        break;

      default:
        image = Image.network('http://openweathermap.org/img/wn/04d@2x.png');
    }

    return Padding(padding: const EdgeInsets.only(top: 5), child: image);
  }
}