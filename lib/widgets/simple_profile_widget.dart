import 'package:flutter/material.dart';
import 'package:flutter_etude/extensions/color_extension.dart';
import 'package:flutter_etude/models/user_model.dart';
import 'package:flutter_etude/screens/detail_screen.dart';
import 'package:flutter_etude/services/api_service.dart';
import 'package:flutter_etude/utils/flag_util.dart';

class SimpleProfile extends StatelessWidget {
  SimpleProfile({
    super.key,
    required UserModel user,
    required double pictureSize,
  })  : _user = user,
        _pictureSize = pictureSize,
        _genderBackgroundColor = (user.gender == GenderEnum.male.toString())
            ? CustomColors.customLightBlue // male
            : CustomColors.customPink1; // female

  final UserModel _user;
  final double _pictureSize;
  final Color _genderBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(user: _user),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          chipsBuilder(),
          pictureBuilder(uuid: _user.login.uuid),
          Transform.translate(
            offset: const Offset(0, -80),
            child: bottomTagBuilder(),
          ),
        ],
      ),
    );
  }

  Column bottomTagBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Transform.translate(
          offset: const Offset(16, 0),
          child: flagBadgeBuilder(),
        ),
        const SizedBox(
          height: 8,
        ),
        nameTagBuilder(),
      ],
    );
  }

  Container nameTagBuilder() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: _genderBackgroundColor,
            offset: const Offset(4, 4),
          )
        ],
      ),
      width: _pictureSize,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Overflow를 처리하려면, overflow라는 게 존재해야 함
          // Overflow라는 게 존재하려면, over 할 기준이 되는 사이즈가 필요함
          Expanded(
            child: Text(
              _user.name.last,
              style: const TextStyle(
                fontSize: 24,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }

  Container flagBadgeBuilder() {
    return Container(
      decoration: BoxDecoration(
        color: _genderBackgroundColor,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          FlagUtil.getFlagByNationality(_user.nat),
          style: const TextStyle(
            fontSize: 64,
          ),
        ),
      ),
    );
  }

  Hero pictureBuilder({required Object uuid}) {
    return Hero(
      tag: uuid,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          boxShadow: const [
            BoxShadow(
              color: CustomColors.customWhite,
              blurRadius: 16,
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          _user.picture.large,
          scale: 0.5,
          width: _pictureSize,
          height: _pictureSize,
        ),
      ),
    );
  }

  Wrap chipsBuilder() {
    return Wrap(
      spacing: 4,
      children: [
        Chip(
          avatar: CircleAvatar(
            backgroundColor: CustomColors.customWhite,
            foregroundColor: _user.gender == GenderEnum.male.toString()
                ? CustomColors.customDarkBlue
                : CustomColors.customRed,
            child: Icon(
              _user.gender == GenderEnum.male.toString()
                  ? Icons.male
                  : Icons.female,
            ),
          ),
          label: Text(_user.name.title),
          backgroundColor: _genderBackgroundColor,
          elevation: 4,
        ),
        Chip(
          label: Text('${_user.dob.age}'),
          backgroundColor: _genderBackgroundColor,
          elevation: 4,
        ),
      ],
    );
  }
}
