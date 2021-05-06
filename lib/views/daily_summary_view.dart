import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather.dart';

class DailySummaryView extends StatelessWidget {
  final Weather weather;

  DailySummaryView({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final dayOfWeek =
    toBeginningOfSentenceCase(DateFormat('EEE').format(this.weather.date));

    return Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(dayOfWeek ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
              Text(
                  "${(this.weather.temp-273.15).round().toString()}°",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
            ]),
            Padding(
                padding: EdgeInsets.only(left: 5),
                child: Container(
                    alignment: Alignment.center,
                    child: _mapWeatherConditionToImage(this.weather.condition)))
          ],
        ));
  }

  Widget _mapWeatherConditionToImage(WeatherCondition condition) {
    Image image;
    switch (condition) {
      case WeatherCondition.thunderstorm:
        image = Image.network('http://openweathermap.org/img/wn/11d@2x.png', scale: 1.5,);
        break;
      case WeatherCondition.heavyCloud:
        image = Image.network('http://openweathermap.org/img/wn/03d@2x.png', scale: 1.5,);
        break;
      case WeatherCondition.lightCloud:
        image = Image.network('http://openweathermap.org/img/wn/02d@2x.png', scale: 1.5,);
        break;
      case WeatherCondition.drizzle:
      case WeatherCondition.mist:
        image = Image.network('http://openweathermap.org/img/wn/50d@2x.png', scale: 1.5,);
        break;
      case WeatherCondition.clear:
        image = Image.network('http://openweathermap.org/img/wn/01d@2x.png', scale: 1.5,);
        break;
      case WeatherCondition.fog:
        image = Image.network('http://openweathermap.org/img/wn/50d@2x.png', scale: 1.5,);
        break;
      case WeatherCondition.snow:
        image = Image.network('http://openweathermap.org/img/wn/13d@2x.png', scale: 1.5,);
        break;
      case WeatherCondition.rain:
        image = Image.network('http://openweathermap.org/img/wn/10d@2x.png', scale: 1.5,);
        break;
      case WeatherCondition.atmosphere:
        image = Image.network('http://openweathermap.org/img/wn/04d@2x.png', scale: 1.5,);
        break;

      default:
        image = Image.network('http://openweathermap.org/img/wn/04d@2x.png', scale: 1.5,);
    }

    return Padding(padding: const EdgeInsets.only(top: 5), child: image);
  }
}