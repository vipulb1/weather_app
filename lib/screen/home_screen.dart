import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widget/weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherService = Provider.of<WeatherService>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (weatherService.isOffline && weatherService.currentWeather == null) {
        Navigator.pushNamed(context, '/network_error');
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusColor: Colors.amber,
                labelText: 'Enter city name',
                prefixIcon: GestureDetector(
                  onTap: () {
                    weatherService.fetchWeather(
                      _locationController.text.trim(),
                    );
                  },
                  child: const Icon(
                    Icons.search,
                  ),
                ),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
              ],
              onSubmitted: (String location) {
                weatherService.fetchWeather(location);
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                weatherService.fetchWeatherService();
              },
              child: const Text(
                'Fetch weather data',
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            weatherService.isLoading
                ? const CircularProgressIndicator()
                : weatherService.currentWeather != null
                    ? WeatherWidget(
                        weather: weatherService.currentWeather!,
                      )
                    : const Text(
                        'Enter a city name to fetch weather data.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
