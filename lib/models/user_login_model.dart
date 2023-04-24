class UserLoginModel {
  final String uuid, username, password, salt, md5, sha1, sha256;

  UserLoginModel.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'],
        username = json['username'],
        password = json['password'],
        salt = json['salt'],
        md5 = json['md5'],
        sha1 = json['sha1'],
        sha256 = json['sha256'];
}
