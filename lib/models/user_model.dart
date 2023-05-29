import 'package:flutter_etude/models/user_dob_model.dart';
import 'package:flutter_etude/models/user_id_model.dart';
import 'package:flutter_etude/models/user_location_model.dart';
import 'package:flutter_etude/models/user_login_model.dart';
import 'package:flutter_etude/models/user_name_model.dart';
import 'package:flutter_etude/models/user_picture_model.dart';
import 'package:flutter_etude/models/user_registered_model.dart';

class UserModel {
  final String _gender, _email, _phone, _cell, _nat;
  final UserNameModel _name;
  final UserLocationModel _location;
  final UserLoginModel _login;
  final UserDobModel _dob;
  final UserRegisteredModel _registered;
  final UserIdModel _id;
  final UserPictureModel _picture;

  String get gender => _gender;
  String get email => _email;
  String get phone => _phone;
  String get cell => _cell;
  String get nat => _nat;
  UserNameModel get name => _name;
  UserLocationModel get location => _location;
  UserLoginModel get login => _login;
  UserDobModel get dob => _dob;
  UserRegisteredModel get registered => _registered;
  UserIdModel get id => _id;
  UserPictureModel get picture => _picture;

  UserModel({
    required String gender,
    required String email,
    required String phone,
    required String cell,
    required String nat,
    required UserNameModel name,
    required UserLocationModel location,
    required UserLoginModel login,
    required UserDobModel dob,
    required UserRegisteredModel registered,
    required UserIdModel id,
    required UserPictureModel picture,
  })  : _gender = gender,
        _email = email,
        _phone = phone,
        _cell = cell,
        _nat = nat,
        _name = name,
        _location = location,
        _login = login,
        _dob = dob,
        _registered = registered,
        _id = id,
        _picture = picture;

  UserModel.fromJson(Map<String, dynamic> json)
      : _gender = json['gender'],
        _email = json['email'],
        _phone = json['phone'],
        _cell = json['cell'],
        _nat = json['nat'],
        _name = UserNameModel.fromJson(json['name']),
        _location = UserLocationModel.fromJson(json['location']),
        _login = UserLoginModel.fromJson(json['login']),
        _dob = UserDobModel.fromJson(json['dob']),
        _registered = UserRegisteredModel.fromJson(json['registered']),
        _id = UserIdModel.fromJson(json['id']),
        _picture = UserPictureModel.fromJson(json['picture']);

  Map<String, dynamic> toMap() {
    return {
      'gender': _gender,
      'email': _email,
      'phone': _phone,
      'cell': _cell,
      'nat': _nat,
      'name_title': _name.title,
      'name_first': _name.first,
      'name_last': _name.last,
      'location_street_number': _location.street.number,
      'location_street_name': _location.street.name,
      'location_city': _location.city,
      'location_state': _location.state,
      'location_country': _location.country,
      'location_postcode': _location.postcode,
      'location_coordinates_latitude': _location.coordinates.latitude,
      'location_coordinates_longitude': _location.coordinates.longitude,
      'location_timezone_offset': _location.timezone.offset,
      'location_timezone_description': _location.timezone.description,
      'login_uuid': _login.uuid,
      'login_username': _login.username,
      'login_password': _login.password,
      'login_salt': _login.salt,
      'login_md5': _login.md5,
      'login_sha1': _login.sha1,
      'login_sha256': _login.sha256,
      'dob_date': _dob.date,
      'dob_age': _dob.age,
      'registered_date': _registered.date,
      'registered_age': _registered.age,
      'id_name': _id.name,
      'id_value': _id.value,
      'picture_large': _picture.large,
      'picture_medium': _picture.medium,
      'picture_thumbnail': _picture.thumbnail,
    };
  }
}
