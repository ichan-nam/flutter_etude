class UserLocationCoordinatesModel {
  final String latitude, longitude;

  UserLocationCoordinatesModel.fromJson(Map<String, dynamic> json)
      : latitude = json['latitude'],
        longitude = json['longitude'];
}
