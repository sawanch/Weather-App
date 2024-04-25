import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/weather_model.dart';

class WeatherService {
  static const BASE_URL =
      "http://api.openweathermap.org/data/2.5/weather"; // Base URL for the OpenWeatherMap API
  final String apiKey; // API key for authenticating requests

  WeatherService(this.apiKey); // Constructor taking an API key

  // Fetches weather data for a given city and decodes the JSON response
  Future<Weather> getWeather(String cityName) async {
    final response = await http
        .get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data'); // Handle HTTP errors
    }
  }

  // Determines the current city based on the device's GPS location
  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator
          .requestPermission(); // Request location permission if not already granted
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high); // Get current position
    List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude); // Reverse geocode to get city name
    String? city = placemarks[0].locality;
    return city ?? ""; // Return city name or an empty string if null
  }
}
