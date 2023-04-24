class UserIdModel {
  final String name, value;

  UserIdModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        value = json['value'];
}
