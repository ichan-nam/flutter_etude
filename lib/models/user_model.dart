import 'package:flutter_etude/models/user_dob_model.dart';
import 'package:flutter_etude/models/user_id_model.dart';
import 'package:flutter_etude/models/user_location_model.dart';
import 'package:flutter_etude/models/user_login_model.dart';
import 'package:flutter_etude/models/user_name_model.dart';
import 'package:flutter_etude/models/user_picture_model.dart';
import 'package:flutter_etude/models/user_registered_model.dart';

class UserModel {
  final String gender, email, phone, cell, nat;
  final UserNameModel name;
  final UserLocationModel location;
  final UserLoginModel login;
  final UserDobModel dob;
  final UserRegisteredModel registered;
  final UserIdModel id;
  final UserPictureModel picture;

  UserModel.fromJson(Map<String, dynamic> json)
      : gender = json['gender'],
        email = json['email'],
        phone = json['phone'],
        cell = json['cell'],
        nat = json['nat'],
        name = UserNameModel.fromJson(json['name']),
        location = UserLocationModel.fromJson(json['location']),
        login = UserLoginModel.fromJson(json['login']),
        dob = UserDobModel.fromJson(json['dob']),
        registered = UserRegisteredModel.fromJson(json['registered']),
        id = UserIdModel.fromJson(json['id']),
        picture = UserPictureModel.fromJson(json['picture']);
}
