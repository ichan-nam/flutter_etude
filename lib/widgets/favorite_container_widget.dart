import 'package:flutter/material.dart';
import 'package:flutter_etude/extensions/color_extension.dart';
import 'package:flutter_etude/models/user_model.dart';

class FavoriteContainer extends StatelessWidget {
  const FavoriteContainer({
    super.key,
    required UserModel user,
  }) : _user = user;

  final UserModel _user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: CustomColors.customPink1,
          backgroundImage: NetworkImage(_user.picture.thumbnail),
          maxRadius: 24,
        ),
        const SizedBox(
          width: 24,
        ),
        Expanded(
          child: Text(
            _user.name.last,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
