import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/db/local_database.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/network_service.dart';

class WeatherService extends ChangeNotifier {
  Weather? currentWeather;
  bool isLoading = false;
  bool isOffline = false;
  final LocalDatabase _database = LocalDatabase();
  final NetworkService _networkService = NetworkService();

  WeatherService() {
    _networkService.onNetworkChange.listen((isConnected) {
      if (isConnected && isOffline) {
        isOffline = false;
        if (currentWeather != null) {
          fetchWeather(currentWeather!.location);
        }
      }
    });
  }

  Future<void> fetchWeather(String location) async {
    isLoading = true;
    notifyListeners();

    bool hasInternet = await NetworkService().hasNetwork();

    if (hasInternet) {
      isLoading = false;
      isOffline = true;
      //Fetch data from local db
      currentWeather = await _database.getWeather(location);
      notifyListeners();
      return;
    }

    isOffline = false;
    const String apiKey = '';
    final url = Uri.parse('https://api.api-ninjas.com/v1/weather?city=$location');

    try {
      final response = await http.get(
        url,
        headers: {'X-Api-Key' :  apiKey},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        currentWeather = Weather.fromJson(data);

        //Store data in local db
        if (currentWeather != null) {
          await _database.saveWeather(currentWeather!);
        }
      } else {
        throw Exception('Failed to fetch live weather data');
      }
    } catch(exception) {
      debugPrint('API Error => $exception');
    }

    isLoading = false;
    notifyListeners();
  }
}