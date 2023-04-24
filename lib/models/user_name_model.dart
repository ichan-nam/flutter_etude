class UserNameModel {
  final String title, first, last;

  UserNameModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        first = json['first'],
        last = json['last'];
}
