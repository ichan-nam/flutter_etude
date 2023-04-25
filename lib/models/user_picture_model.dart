class UserPictureModel {
  final String _large, _medium, _thumbnail;

  String get large => _large;
  String get medium => _medium;
  String get thumbnail => _thumbnail;

  UserPictureModel.fromJson(Map<String, dynamic> json)
      : _large = json['large'],
        _medium = json['medium'],
        _thumbnail = json['thumbnail'];
}
