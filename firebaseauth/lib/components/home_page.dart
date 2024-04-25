import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebaseauth/model/weather_model.dart';
import 'package:firebaseauth/services/weather_service.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth
      .instance.currentUser; // Retrieves the currently signed-in user

  // Weather service initialization with API key
  final _weatherService = WeatherService('**********APICode************');
  Weather? _weather; // Nullable Weather model to hold weather data

  // Fetch weather information based on the user's current city
  _fetchWeather() async {
    String cityName = await _weatherService
        .getCurrentCity(); // Get current city using the weather service

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather; // Update weather state if successful
      });
    } catch (e) {
      print(e); // Handle errors, such as network issues or invalid data
    }
  }

  // Determines the appropriate animation asset based on weather condition
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null)
      return 'assets/sunny.json'; // Default to sunny if no condition is found

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloud.json'; // Cloudy weather animation
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json'; // Rainy weather animation
      case 'thunderstorm':
        return 'assets/thunder.json'; // Thunderstorm animation
      case 'clear':
        return 'assets/sunny.json'; // Clear weather animation
      default:
        return 'assets/sunny.json'; // Default to sunny for unknown conditions
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather(); // Fetch weather information on widget initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserOut, // Log out action
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Welcome Back: " + user!.email!,
                // Display welcome message with user's email
                style: TextStyle(
                  fontSize: 15, // Font size for clarity
                  fontWeight: FontWeight.bold, // Bold for emphasis
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_weather?.cityName ?? "loading city..",
                          // Display city name or loading text
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                          )),
                      SizedBox(height: 20),
                      Lottie.asset(
                          getWeatherAnimation(_weather?.mainCondition)),
                      // Weather condition animation
                      Text('${_weather?.temperature?.round()}°C',
                          // Display temperature rounded to nearest whole number
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(_weather?.mainCondition ?? "",
                          // Display weather condition
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut(); // Function to sign out the current user
  }
}
