class Weather {
  final String location;
  final int temperature;

  Weather({
    required this.location,
    required this.temperature,
  });

  // Convert JSON response to Weather object
  factory Weather.fromJson(Map<String, dynamic> json, String location) {
    return Weather(
      location: location,
      temperature: json['temp'],
    );
  }

  // Convert Weather object to Map for database storage
  Map<String, dynamic> toMap() {
    return {
      'location': location,
      'temperature': temperature,
    };
  }

  // Convert Map retrieved from database to Weather object
  factory Weather.fromMap(Map<String,dynamic> map) {
    return Weather(
      location: map['location'] ?? '',
      temperature: map['temperature'] ?? '',
    );
  }
}
