import 'package:flutter/material.dart';
import 'package:flutter_etude/extensions/color_extension.dart';
import 'package:flutter_etude/models/user_model.dart';
import 'package:flutter_etude/services/api_service.dart';
import 'package:flutter_etude/utils/flag_util.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final Future<List<UserModel>> users =
      ApiService.getUsersByGender(GenderEnum.all);

  @override
  Widget build(BuildContext context) {
    const pictureSize = 256.0;

    return FutureBuilder(
      future: users,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // ListView는 cross axis로 가능한 최대 사이즈를 가짐
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              vertical: 64,
              horizontal: 32,
            ),
            itemBuilder: (context, index) {
              UserModel user = snapshot.data![index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
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
                      user.picture.large,
                      scale: 0.5,
                      width: pictureSize,
                      height: pictureSize,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(16, -64),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: CustomColors.customPink1,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          FlagUtil.getFlagByNationality(user.nat),
                          style: const TextStyle(
                            fontSize: 64,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 64,
            ),
            itemCount: snapshot.data!.length,
          );
        } else {
          return Center(
            child: Transform.scale(
              scale: 3,
              child: const CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
