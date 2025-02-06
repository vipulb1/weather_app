import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherWidget extends StatefulWidget {
  final Weather weather;

  const WeatherWidget({
    super.key,
    required this.weather,
  });

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  bool isCelsius = true;

  double convertTemperature(double temp) {
    return (temp * 9 / 5) + 32;
  }

  Icon getWeatherIcon(double temperature) {
    if (temperature >= 30) {
      return const Icon(
        Icons.wb_sunny,
        size: 50,
        color: Colors.amber,
      ); // Hot Weather ☀️
    } else if (temperature >= 20) {
      return const Icon(
        Icons.cloud,
        size: 50,
        color: Colors.white,
      ); // Mild Weather ☁️
    } else if (temperature >= 10) {
      return const Icon(
        Icons.ac_unit,
        size: 50,
        color: Colors.cyan,
      ); // Cold Weather ❄️
    } else {
      return const Icon(
        Icons.snowing,
        size: 50,
        color: Colors.cyanAccent,
      ); // Very Cold Weather 🌨️
    }
  }

  @override
  Widget build(BuildContext context) {
    double displayedTemp = isCelsius
        ? widget.weather.temperature
        : convertTemperature(widget.weather.temperature);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          8.0,
        ),
      ),
      shadowColor: Colors.black12,
      child: Container(
        color: Colors.white70,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            getWeatherIcon(
              widget.weather.temperature,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.weather.location,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              '${displayedTemp.toStringAsFixed(2)}°${isCelsius ? 'C' : 'F'}',
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: Colors.greenAccent,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              widget.weather.description,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isCelsius = !isCelsius;
                });
              },
              style: const ButtonStyle(alignment: Alignment.center),
              child: Text(
                'Convert to ${isCelsius ? 'Celsius' : ''}',
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
