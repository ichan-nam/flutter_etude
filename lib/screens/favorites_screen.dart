import 'package:flutter/material.dart';
import 'package:flutter_etude/extensions/color_extension.dart';
import 'package:flutter_etude/models/user_model.dart';
import 'package:flutter_etude/providers/favorites_provider.dart';
import 'package:flutter_etude/screens/detail_screen.dart';
import 'package:flutter_etude/widgets/contents_container_widget.dart';
import 'package:flutter_etude/widgets/favorite_container_widget.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites =
        context.watch<FavoritesProvider>().favorites.values.toList();

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          favoritesLable(favorites),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        user: favorites[index],
                      ),
                      fullscreenDialog: true,
                    ),
                  );
                },
                child: ContentsContainer(
                  shadowColor: CustomColors.customPink1,
                  padding: 16,
                  child: FavoriteContainer(user: favorites[index]),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
              itemCount: favorites.length,
            ),
          ),
        ],
      ),
    );
  }

  Row favoritesLable(List<UserModel> favorites) {
    return Row(
      children: [
        Text(
          '${favorites.length}',
          style: const TextStyle(
            color: CustomColors.customWhite,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Text(
          'Favorites',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
