class UserLocationCoordinatesModel {
  final String _latitude, _longitude;

  String get latitude => _latitude;
  String get longitude => _longitude;

  UserLocationCoordinatesModel.fromJson(Map<String, dynamic> json)
      : _latitude = json['latitude'],
        _longitude = json['longitude'];
}
