class UserPictureModel {
  final String large, medium, thumbnail;

  UserPictureModel.fromJson(Map<String, dynamic> json)
      : large = json['large'],
        medium = json['medium'],
        thumbnail = json['thumbnail'];
}
