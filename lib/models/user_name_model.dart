class UserNameModel {
  final String _title, _first, _last;

  String get title => _title;
  String get first => _first;
  String get last => _last;

  UserNameModel.fromJson(Map<String, dynamic> json)
      : _title = json['title'],
        _first = json['first'],
        _last = json['last'];
}
