class Wallpaper {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> tags;
  final String description;
  final String category;
  bool isFavorite;

  Wallpaper({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.tags,
    required this.description,
    required this.category,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'tags': tags,
      'description': description,
      'category': category,
      'isFavorite': isFavorite,
    };
  }

  factory Wallpaper.fromJson(Map<String, dynamic> json) {
    return Wallpaper(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      tags: List<String>.from(json['tags']),
      description: json['description'],
      category: json['category'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
