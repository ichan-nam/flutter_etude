import 'package:flutter_etude/models/user_location_coordinates_model.dart';
import 'package:flutter_etude/models/user_location_street_model.dart';
import 'package:flutter_etude/models/user_location_timezone_model.dart';

class UserLocationModel {
  final UserLocationStreetModel street;
  final String city, state, country;
  final int postcode;
  final UserLocationCoordinatesModel coordinates;
  final UserLocationTimezoneModel timezone;

  UserLocationModel.fromJson(Map<String, dynamic> json)
      : street = UserLocationStreetModel.fromJson(json['street']),
        city = json['city'],
        state = json['state'],
        country = json['country'],
        postcode = json['postcode'],
        coordinates =
            UserLocationCoordinatesModel.fromJson(json['coordinates']),
        timezone = UserLocationTimezoneModel.fromJson(json['timezone']);
}
