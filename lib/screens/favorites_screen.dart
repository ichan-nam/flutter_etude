import 'package:flutter/material.dart';
import 'package:flutter_etude/models/user_model.dart';
import 'package:flutter_etude/screens/detail_screen.dart';
import 'package:flutter_etude/services/database_service.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final Future<List<UserModel>> _favorites = DatabaseService()
      .databaseConfig()
      .then((_) => DatabaseService().selectFavorites());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _favorites,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: snapshot.data!
                .map((e) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(user: e),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    child: Text(e.name.last)))
                .toList(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
