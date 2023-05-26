import 'package:flutter/material.dart';
import 'package:flutter_etude/extensions/color_extension.dart';
import 'package:flutter_etude/models/user_model.dart';
import 'package:flutter_etude/services/api_service.dart';
import 'package:flutter_etude/utils/flag_util.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              pictureBuilder(),
              nameBuilder(),
              const SizedBox(
                height: 16,
              ),
              genderAgeNationalityBuilder(),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Container genderAgeNationalityBuilder() {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.customWhite,
        borderRadius: BorderRadius.circular(
          16,
        ),
        boxShadow: const [
          BoxShadow(
            color: CustomColors.customPink1,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Icon(
                  size: 32,
                  _user.gender == GenderEnum.male.toString()
                      ? Icons.male
                      : Icons.female,
                  color: _user.gender == GenderEnum.male.toString()
                      ? CustomColors.customDarkBlue
                      : CustomColors.customRed,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  '${_user.dob.age}y',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  FlagUtil.getFlagByNationality(_user.nat),
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center nameBuilder() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: const Offset(2, 8),
            child: Text(
              _user.name.first,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            _user.name.last,
            style: const TextStyle(
              color: CustomColors.customWhite,
              fontSize: 48,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  Hero pictureBuilder() {
    return Hero(
      tag: _user.login.uuid,
      child: CircleAvatar(
        backgroundColor: CustomColors.customPink1,
        backgroundImage: NetworkImage(_user.picture.large),
        maxRadius: 128,
      ),
    );
  }
}
