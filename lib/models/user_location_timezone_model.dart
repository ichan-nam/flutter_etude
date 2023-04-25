class UserLocationTimezoneModel {
  final String _offset, _description;

  String get offset => _offset;
  String get description => _description;

  UserLocationTimezoneModel.fromJson(Map<String, dynamic> json)
      : _offset = json['offset'],
        _description = json['description'];
}
