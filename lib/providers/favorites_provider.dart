import 'package:flutter/material.dart';
import 'package:flutter_etude/models/user_model.dart';
import 'package:flutter_etude/services/database_service.dart';

class FavoritesProvider with ChangeNotifier {
  var _favorites = <String, UserModel>{};

  Map<String, UserModel> get favorites => _favorites;

  void _fetchFavorites() async {
    await DatabaseService().databaseConfig();
    _favorites = await DatabaseService().selectFavorites();
    notifyListeners();
  }

  FavoritesProvider() {
    _fetchFavorites();
  }

  void add(UserModel user) {
    _favorites[user.login.uuid] = user;
    notifyListeners();
  }

  void remove(String uuid) {
    _favorites.remove(uuid);
    notifyListeners();
  }

  bool isExist(String uuid) {
    return _favorites[uuid] == null ? false : true;
  }
}
