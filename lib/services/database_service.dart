import 'package:flutter_etude/models/user_dob_model.dart';
import 'package:flutter_etude/models/user_id_model.dart';
import 'package:flutter_etude/models/user_location_coordinates_model.dart';
import 'package:flutter_etude/models/user_location_model.dart';
import 'package:flutter_etude/models/user_location_street_model.dart';
import 'package:flutter_etude/models/user_location_timezone_model.dart';
import 'package:flutter_etude/models/user_login_model.dart';
import 'package:flutter_etude/models/user_model.dart';
import 'package:flutter_etude/models/user_name_model.dart';
import 'package:flutter_etude/models/user_picture_model.dart';
import 'package:flutter_etude/models/user_registered_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static const tableName = 'favorite';

  static final DatabaseService _database = DatabaseService._internal();
  late Future<Database> database;

  factory DatabaseService() => _database;

  DatabaseService._internal() {
    databaseConfig();
  }

  Future<bool> databaseConfig() async {
    try {
      database = openDatabase(
        join(await getDatabasesPath(), 'service_database.db'),
        onCreate: (db, version) {
          return db.execute('''
                CREATE TABLE $tableName (
                  login_uuid TEXT PRIMARY KEY,
                  gender TEXT,
                  email TEXT,
                  phone TEXT,
                  cell TEXT,
                  nat TEXT,
                  name_title TEXT,
                  name_first TEXT,
                  name_last TEXT,
                  location_street_number INTEGER,
                  location_street_name TEXT,
                  location_city TEXT,
                  location_state TEXT,
                  location_country TEXT,
                  location_postcode TEXT,
                  location_coordinates_latitude TEXT,
                  location_coordinates_longitude TEXT,
                  location_timezone_offset TEXT,
                  location_timezone_description TEXT,
                  login_username TEXT,
                  login_password TEXT,
                  login_salt TEXT,
                  login_md5 TEXT,
                  login_sha1 TEXT,
                  login_sha256 TEXT,
                  dob_date TEXT,
                  dob_age INTEGER,
                  registered_date TEXT,
                  registered_age INTEGER,
                  id_name TEXT,
                  id_value TEXT,
                  picture_large TEXT,
                  picture_medium TEXT,
                  picture_thumbnail TEXT
                )
            ''');
        },
        version: 1,
      );
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> insertFavorite(UserModel user) async {
    final Database db = await database;

    try {
      db.insert(
        tableName,
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<Map<String, UserModel>> selectFavorites() async {
    final Database db = await database;
    final List<Map<String, dynamic>> data = await db.query(tableName);

    final returnValue = <String, UserModel>{};
    for (int i = 0; i < data.length; i++) {
      Map<String, dynamic> record = data[i];
      returnValue[record['login_uuid']] = UserModel(
        gender: record['gender'],
        email: record['email'],
        phone: record['phone'],
        cell: record['cell'],
        nat: record['nat'],
        name: UserNameModel(
          title: record['name_title'],
          first: record['name_first'],
          last: record['name_last'],
        ),
        location: UserLocationModel(
          street: UserLocationStreetModel(
            number: record['location_street_number'],
            name: record['location_street_name'],
          ),
          city: record['location_city'],
          state: record['location_state'],
          country: record['location_country'],
          postcode: record['location_postcode'],
          coordinates: UserLocationCoordinatesModel(
            latitude: record['location_coordinates_latitude'],
            longitude: record['location_coordinates_longitude'],
          ),
          timezone: UserLocationTimezoneModel(
            offset: record['location_timezone_offset'],
            description: record['location_timezone_description'],
          ),
        ),
        login: UserLoginModel(
          uuid: record['login_uuid'],
          username: record['login_username'],
          password: record['login_password'],
          salt: record['login_salt'],
          md5: record['login_md5'],
          sha1: record['login_sha1'],
          sha256: record['login_sha256'],
        ),
        dob: UserDobModel(
          date: record['dob_date'],
          age: record['dob_age'],
        ),
        registered: UserRegisteredModel(
          date: record['registered_date'],
          age: record['registered_age'],
        ),
        id: UserIdModel(
          name: record['id_name'],
          value: record['id_value'],
        ),
        picture: UserPictureModel(
          large: record['picture_large'],
          medium: record['picture_medium'],
          thumbnail: record['picture_thumbnail'],
        ),
      );
    }

    return returnValue;
  }

  Future<UserModel?> selectFavorite(String uuid) async {
    final Database db = await database;
    final List<Map<String, dynamic>> data = await db.query(
      tableName,
      where: 'login_uuid = ?',
      whereArgs: [uuid],
    );

    if (data.isEmpty) {
      return null;
    } else {
      // data.length == 1
      Map<String, dynamic> record = data[0];
      return UserModel(
        gender: record['gender'],
        email: record['email'],
        phone: record['phone'],
        cell: record['cell'],
        nat: record['nat'],
        name: UserNameModel(
          title: record['name_title'],
          first: record['name_first'],
          last: record['name_last'],
        ),
        location: UserLocationModel(
          street: UserLocationStreetModel(
            number: record['location_street_number'],
            name: record['location_street_name'],
          ),
          city: record['location_city'],
          state: record['location_state'],
          country: record['location_country'],
          postcode: record['location_postcode'],
          coordinates: UserLocationCoordinatesModel(
            latitude: record['location_coordinates_latitude'],
            longitude: record['location_coordinates_longitude'],
          ),
          timezone: UserLocationTimezoneModel(
            offset: record['location_timezone_offset'],
            description: record['location_timezone_description'],
          ),
        ),
        login: UserLoginModel(
          uuid: record['login_uuid'],
          username: record['login_username'],
          password: record['login_password'],
          salt: record['login_salt'],
          md5: record['login_md5'],
          sha1: record['login_sha1'],
          sha256: record['login_sha256'],
        ),
        dob: UserDobModel(
          date: record['dob_date'],
          age: record['dob_age'],
        ),
        registered: UserRegisteredModel(
          date: record['registered_date'],
          age: record['registered_age'],
        ),
        id: UserIdModel(
          name: record['id_name'],
          value: record['id_value'],
        ),
        picture: UserPictureModel(
          large: record['picture_large'],
          medium: record['picture_medium'],
          thumbnail: record['picture_thumbnail'],
        ),
      );
    }
  }

  Future<bool> deleteFavorite(String uuid) async {
    final Database db = await database;

    try {
      db.delete(
        tableName,
        where: 'login_uuid = ?',
        whereArgs: [uuid],
      );
      return true;
    } catch (err) {
      return false;
    }
  }
}
