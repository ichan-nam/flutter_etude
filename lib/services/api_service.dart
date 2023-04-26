import 'dart:convert';

import 'package:flutter_etude/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const _baseUrl = 'https://randomuser.me/api';

  static Future<List<UserModel>> getUsersByGender(Gender gender) async {
    const results = 100;
    final userInstances = <UserModel>[];

    final Uri url = Uri.parse(
        '$_baseUrl/?results=$results&gender=${Gender.getStringByGender(gender)}');
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final users = jsonDecode(response.body)['results'];

      for (var user in users) {
        userInstances.add(UserModel.fromJson(user));
      }
      return userInstances;
    } else {
      throw Error();
    }
  }
}

enum Gender {
  all,
  male,
  female;

  static String getStringByGender(Gender gender) {
    switch (gender) {
      case Gender.all:
        return '';
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
    }
  }
}
