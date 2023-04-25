class UserLoginModel {
  final String _uuid, _username, _password, _salt, _md5, _sha1, _sha256;

  String get uuid => _uuid;
  String get username => _username;
  String get password => _password;
  String get salt => _salt;
  String get md5 => _md5;
  String get sha1 => _sha1;
  String get sha256 => _sha256;

  UserLoginModel.fromJson(Map<String, dynamic> json)
      : _uuid = json['uuid'],
        _username = json['username'],
        _password = json['password'],
        _salt = json['salt'],
        _md5 = json['md5'],
        _sha1 = json['sha1'],
        _sha256 = json['sha256'];
}
