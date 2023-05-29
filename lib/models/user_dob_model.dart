class UserDobModel {
  final String _date;
  final int _age;

  String get date => _date;
  int get age => _age;

  UserDobModel({
    required String date,
    required int age,
  })  : _date = date,
        _age = age;

  UserDobModel.fromJson(Map<String, dynamic> json)
      : _date = json['date'],
        _age = json['age'];
}
