class UserDobModel {
  final String date;
  final int age;

  UserDobModel.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        age = json['age'];
}
