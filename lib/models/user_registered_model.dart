class UserRegisteredModel {
  final String _date;
  final int _age;

  String get date => _date;
  int get age => _age;

  UserRegisteredModel.fromJson(Map<String, dynamic> json)
      : _date = json['date'],
        _age = json['age'];
}
