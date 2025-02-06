class Weather {
  final String location;
  final double temperature;
  final String description;

  Weather({
    required this.location,
    required this.temperature,
    required this.description,
  });

  // Convert JSON response to Weather object
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      location: json['location'],
      temperature: json['temperature'],
      description: json['description'],
    );
  }

  // Convert Weather object to Map for database storage
  Map<String, dynamic> toMap() {
    return {
      'location': location,
      'temperature': temperature,
      'description': description,
    };
  }

  // Convert Map retrieved from database to Weather object
  factory Weather.fromMap(Map<String,dynamic> map) {
    return Weather(
      location: map['location'] ?? '',
      temperature: map['temperature'] ?? '',
      description: map['description'] ?? ''
    );
  }
}
