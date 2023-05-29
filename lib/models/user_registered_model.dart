class UserRegisteredModel {
  final String _date;
  final int _age;

  String get date => _date;
  int get age => _age;

  UserRegisteredModel({
    required String date,
    required int age,
  })  : _date = date,
        _age = age;

  UserRegisteredModel.fromJson(Map<String, dynamic> json)
      : _date = json['date'],
        _age = json['age'];
}
