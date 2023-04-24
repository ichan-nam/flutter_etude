class UserLocationTimezoneModel {
  final String offset, description;

  UserLocationTimezoneModel.fromJson(Map<String, dynamic> json)
      : offset = json['offset'],
        description = json['description'];
}
