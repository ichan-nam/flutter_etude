class UserRegisteredModel {
  final String date;
  final int age;

  UserRegisteredModel.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        age = json['age'];
}
