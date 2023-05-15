import 'package:flutter/material.dart';
import 'package:flutter_etude/models/user_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required UserModel user,
  }) : _user = user;

  final UserModel _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_user.name.last),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
