import 'package:flutter/material.dart';
import 'package:flutter_etude/models/user_model.dart';
import 'package:flutter_etude/services/api_service.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final Future<List<UserModel>> users = ApiService.getUsersByGender(Gender.all);

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

              return Image.network(
                user.picture.large,
                scale: 0.5,
                width: pictureSize,
                height: pictureSize,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 32,
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
