import 'package:flutter/material.dart';
import 'package:my_desktop_app/services/favorites_service.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final FavoritesService _favoritesService = FavoritesService();
  List<Wallpaper> _favorites = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    setState(() => _isLoading = true);
    final favorites = await _favoritesService.getFavorites();
    setState(() {
      _favorites = favorites;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffF8F8F8),
      body: Center(
        child: Container(
          width: 1346,
          height: 758,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gradient Title and Subtitle
              Row(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
                    ).createShader(bounds),
                    child: const Text(
                      'Saved ',
                      style: TextStyle(
                        fontFamily: 'CashDisplay',
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFFFF7043), Color(0xFFE91E63)],
                    ).createShader(bounds),
                    child: const Text(
                      'Wallpapers',
                      style: TextStyle(
                        fontFamily: 'CashDisplay',
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                'Your saved wallpapers collection',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF757575),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 80),

              // Content - Grid or Empty State
              if (_isLoading)
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: const Color(0xFFFFB74D),
                    ),
                  ),
                )
              else if (_favorites.isEmpty)
                // Empty State - Your existing design
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/empty.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'No Saved Wallpapers',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF575757),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Start saving your favorite wallpapers to see them here',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF757575),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: () {
                            // Link to Browse tab
                            // You can use your navigation here
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFA726),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Text(
                              'Browse Wallpapers',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                // Grid View - Display favorites
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.7,
                        ),
                    itemCount: _favorites.length,
                    itemBuilder: (context, index) {
                      final wallpaper = _favorites[index];
                      return _buildFavoriteCard(wallpaper);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteCard(Wallpaper wallpaper) {
    return GestureDetector(
      onTap: () {
        // Optional: Navigate to detail screen or preview
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(wallpaper.imageUrl, fit: BoxFit.cover),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(999),
                      onTap: () async {
                        await _favoritesService.removeFavorite(wallpaper.id);
                        _loadFavorites();
                      },
                      child: const Icon(
                        Icons.favorite,
                        size: 16,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 12,
                bottom: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wallpaper.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 3,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        wallpaper.tags.isNotEmpty
                            ? wallpaper.tags[0]
                            : 'Nature',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
