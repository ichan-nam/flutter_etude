class UserLocationStreetModel {
  final int number;
  final String name;

  UserLocationStreetModel.fromJson(Map<String, dynamic> json)
      : number = json['number'],
        name = json['name'];
}
