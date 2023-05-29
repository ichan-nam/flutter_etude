import 'package:flutter_etude/models/user_location_coordinates_model.dart';
import 'package:flutter_etude/models/user_location_street_model.dart';
import 'package:flutter_etude/models/user_location_timezone_model.dart';

class UserLocationModel {
  final UserLocationStreetModel _street;
  final String _city, _state, _country, _postcode;
  final UserLocationCoordinatesModel _coordinates;
  final UserLocationTimezoneModel _timezone;

  UserLocationStreetModel get street => _street;
  String get city => _city;
  String get state => _state;
  String get country => _country;
  String get postcode => _postcode;
  UserLocationCoordinatesModel get coordinates => _coordinates;
  UserLocationTimezoneModel get timezone => _timezone;

  UserLocationModel({
    required UserLocationStreetModel street,
    required String city,
    required String state,
    required String country,
    required String postcode,
    required UserLocationCoordinatesModel coordinates,
    required UserLocationTimezoneModel timezone,
  })  : _street = street,
        _city = city,
        _state = state,
        _country = country,
        _postcode = postcode,
        _coordinates = coordinates,
        _timezone = timezone;

  UserLocationModel.fromJson(Map<String, dynamic> json)
      : _street = UserLocationStreetModel.fromJson(json['street']),
        _city = json['city'],
        _state = json['state'],
        _country = json['country'],
        _postcode = json['postcode'].toString(),
        _coordinates =
            UserLocationCoordinatesModel.fromJson(json['coordinates']),
        _timezone = UserLocationTimezoneModel.fromJson(json['timezone']);
}
