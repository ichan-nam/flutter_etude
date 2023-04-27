import 'dart:convert';

import 'package:flutter_etude/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const _baseUrl = 'https://randomuser.me/api';

  static Future<List<UserModel>> getUsersByGender(GenderEnum gender) async {
    const results = 100;
    final userInstances = <UserModel>[];

    // CircularProgressIndicator() 보려고 일부러 지연
    await Future.delayed(const Duration(
      seconds: 3,
    ));

    final Uri url = Uri.parse(
        '$_baseUrl/?results=$results&gender=${GenderEnum.getStringByGender(gender)}');
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

enum GenderEnum {
  all,
  male,
  female;

  static String getStringByGender(GenderEnum gender) {
    switch (gender) {
      case GenderEnum.all:
        return '';
      case GenderEnum.male:
        return 'male';
      case GenderEnum.female:
        return 'female';
    }
  }
}
