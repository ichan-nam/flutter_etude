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
}
