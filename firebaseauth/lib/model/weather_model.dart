class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;

  // Constructor for initializing the Weather class with required fields
  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
  });

  // Factory constructor to create a Weather instance from a JSON object
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'], // Extracts city name from JSON
      temperature: json['main']['temp'].toDouble(), // Parses the temperature to double
      mainCondition: json['weather'][0]['main'], // Extracts the main weather condition
    );
  }
}
