import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;
import 'package:weather_app/models/weather_model.dart';

class LocalDatabase {
  Database? _database;
  String tableName = 'weather';
  String idColumn = 'id';
  String locColumn = 'location';
  String tempColumn = 'temperature';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'weather.db');
    return openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE $tableName($idColumn INTEGER PRIMARY KEY AUTOINCREMENT,$locColumn TEXT,$tempColumn INTEGER)');
    });
  }

  Future<void> saveWeather(Weather weather) async {
    final db = await database;
    await db.insert(
      tableName,
      {
        locColumn: weather.location,
        tempColumn: weather.temperature,
      },
      conflictAlgorithm: ConflictAlgorithm.replace, //Update if value exist
    );
  }

  Future<Weather?> getWeather(String city) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      tableName,
      where: '$locColumn = ?',
      whereArgs: [city],
      limit: 1, //Fetch only single data
    );

    if (result.isNotEmpty) {
      // Convert the first map to a Weather object
      return Weather.fromMap(result.first);
    } else {
      return null;
    }
  }

  Future<List<Weather>> getWeatherList() async {
    final db = await database;
    final List<Map<String, dynamic>> weatherData = await db.query(tableName);

    return List.generate(
      weatherData.length,
      (index) {
        return Weather(
          location: weatherData[index][locColumn],
          temperature: weatherData[index][tempColumn],
        );
      },
    );
  }
}
