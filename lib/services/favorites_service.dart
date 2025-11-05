import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Wallpaper {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> tags;
  final String description;
  bool isFavorite;

  Wallpaper({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.tags,
    required this.description,
    this.isFavorite = false,
  });

  factory Wallpaper.fromJson(Map<String, dynamic> json) {
    return Wallpaper(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      tags: List<String>.from(json['tags'] ?? const []),
      description: json['description'] as String? ?? '',
      isFavorite: json['isFavorite'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'tags': tags,
      'description': description,
      'isFavorite': isFavorite,
    };
  }
}

class FavoritesService {
  static const String _key = 'favorites';

  Future<void> saveFavorite(Wallpaper wallpaper) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();

    if (!favorites.any((fav) => fav.id == wallpaper.id)) {
      favorites.add(wallpaper);
      final jsonList = favorites
          .map(
            (w) => {
              'id': w.id,
              'name': w.name,
              'imageUrl': w.imageUrl,
              'tags': w.tags,
              'description': w.description,
            },
          )
          .toList();

      await prefs.setString(_key, jsonEncode(jsonList));
    }
  }

  Future<void> removeFavorite(String wallpaperId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();

    favorites.removeWhere((w) => w.id == wallpaperId);
    final jsonList = favorites
        .map(
          (w) => {
            'id': w.id,
            'name': w.name,
            'imageUrl': w.imageUrl,
            'tags': w.tags,
            'description': w.description,
          },
        )
        .toList();

    await prefs.setString(_key, jsonEncode(jsonList));
  }

  Future<List<Wallpaper>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String? favoritesJson = prefs.getString(_key);

    if (favoritesJson == null) return [];

    final List<dynamic> decoded = jsonDecode(favoritesJson);
    return decoded
        .map(
          (json) => Wallpaper(
            id: json['id'],
            name: json['name'],
            imageUrl: json['imageUrl'],
            tags: List<String>.from(json['tags']),
            description: json['description'],
            isFavorite: true,
          ),
        )
        .toList();
  }

  Future<bool> isFavorite(String wallpaperId) async {
    final favorites = await getFavorites();
    return favorites.any((w) => w.id == wallpaperId);
  }
}
