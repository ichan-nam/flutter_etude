class UserNameModel {
  final String _title, _first, _last;

  String get title => _title;
  String get first => _first;
  String get last => _last;

  UserNameModel({
    required String title,
    required String first,
    required String last,
  })  : _title = title,
        _first = first,
        _last = last;

  UserNameModel.fromJson(Map<String, dynamic> json)
      : _title = json['title'],
        _first = json['first'],
        _last = json['last'];
}
