import 'package:flutter/material.dart';
import 'package:my_desktop_app/screens/home/home_screen.dart';
import 'package:my_desktop_app/screens/browse/browse_screen.dart';
import 'package:my_desktop_app/screens/favourites/favourites_screen.dart';
import 'package:my_desktop_app/screens/settings/settings_screen.dart';
import 'package:my_desktop_app/services/favorites_service.dart';
import 'package:my_desktop_app/widgets/wallpaper_settings_dialog.dart';

class CategoryDetailScreen extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String subtitle;
  final int wallpaperCount;

  const CategoryDetailScreen({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.subtitle,
    required this.wallpaperCount,
  });

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  final FavoritesService _favoritesService = FavoritesService();
  late final List<Wallpaper> wallpapers;
  late Wallpaper selectedWallpaper;
  bool isGridView = true;
  int _selectedIndex = 1; // Since we're in Browse section

  final List<Widget> _screens = [
    const HomeScreen(),
    const BrowseScreen(),
    const FavouritesScreen(),
    const SettingsScreen(),
  ];

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  // void initState() {
  //   super.initState();
  //   // Initialize wallpapers based on the design mockup
  //   selectedWallpaper = wallpapers[0];
  // }
  @override
  void initState() {
    super.initState();
    _initializeWallpapers();
  }

  // Add this method to initialize wallpapers and check favorites
  Future<void> _initializeWallpapers() async {
    // Initialize wallpapers as before
    wallpapers = [
      Wallpaper(
        id: '1',
        name: 'Nature 1', 
        imageUrl: 'assets/images/1.png',
        tags: ['Nature', 'Ambience', 'Flowers'],
        description:
            'Discover the pure beauty of "Natural Essence" – your gateway to authentic, nature-inspired experiences. Let this unique collection elevate your senses.',
      ),
      Wallpaper(
        id: '2',
        name: 'Nature 2',
        imageUrl: 'assets/images/2.png',
        tags: ['Nature', 'Mountain', 'Sky'],
        description:
            'A serene view of mountain peaks reaching into the clouds.',
      ),
      Wallpaper(
        id: '3',
        name: 'Nature 3',
        imageUrl: 'assets/images/3.png',
        tags: ['Nature', 'Forest', 'Autumn'],
        description: 'Autumn colors paint the forest in warm golden hues.',
      ),
      Wallpaper(
        id: '4',
        name: 'Nature 4',
        imageUrl: 'assets/images/4.png',
        tags: ['Nature', 'Sunset', 'Lake'],
        description: 'A peaceful sunset reflects off the still waters.',
      ),
      Wallpaper(
        id: '5',
        name: 'Nature 5',
        imageUrl: 'assets/images/5.png',
        tags: ['Nature', 'Night', 'Lake'],
        description: 'The tranquil night scene at a misty lake.',
      ),
      Wallpaper(
        id: '6',
        name: 'Nature 6',
        imageUrl: 'assets/images/6.png',
        tags: ['Nature', 'Coast', 'Ocean'],
        description: 'Rocky coastline meets the endless ocean.',
      ),
    ];
    selectedWallpaper = wallpapers[0];

    // Check favorite status for each wallpaper
    for (var wallpaper in wallpapers) {
      final isFavorite = await _favoritesService.isFavorite(wallpaper.id);
      if (mounted) {
        setState(() {
          wallpaper.isFavorite = isFavorite;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffF8F8F8),

      body: Column(
        children: [
          buildNavigationBar(context, _selectedIndex, _onNavTap),
          Expanded(
            child: Center(
              child: SizedBox(
                width: 1346,
                height: 900,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(
                    context,
                  ).copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        _buildHeader(),
                        const SizedBox(height: 44),

                        _buildViewToggle(),
                        const SizedBox(height: 24),
                        SizedBox(
                          height: 700, // Adjust this height as needed
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: _buildWallpaperGrid()),
                              const SizedBox(width: 24),
                              Expanded(
                                child: WallpaperPreviewWidget(
                                  name: 'Nature 1',
                                  tags: const ['Nature', 'Ambience', 'Flowers'],
                                  description:
                                      'Discover the pure beauty of "Natural Essence" — your gateway to authentic, nature-inspired experiences. Let this unique collection elevate your senses and connect you with the unrefined el...',
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&q=80',
                                  onShare: () => print('Share clicked'),
                                  onEdit: () => print('Edit clicked'),
                                  onSettings: () => print('Settings clicked'),
                                  onSaveToFavorites: () =>
                                      print('Save to Favorites clicked'),
                                  onSetWallpaper: () =>
                                      print('Set to Wallpaper clicked'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              Icon(Icons.arrow_back, size: 18, color: Colors.grey[600]),
              const SizedBox(width: 8),
              Text(
                'Back to Categories',
                style: TextStyle(
                  fontSize: 18,

                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildViewToggle() {
    return SizedBox(
      width: 650,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 32,
              fontFamily: 'CashDisplay',
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                _buildToggleButton(true, Icons.grid_view),
                _buildToggleButton(false, Icons.view_agenda_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(bool isGrid, IconData icon) {
    final isSelected = isGridView == isGrid;
    return InkWell(
      onTap: () {
        setState(() => isGridView = isGrid);
        showDialog(
          context: context,
          builder: (context) => const WallpaperSettingsDialog(),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF3E0) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Icon(
          icon,
          size: 20,
          color: isSelected ? Colors.black : Colors.grey[400],
        ),
      ),
    );
  }

  Widget _buildWallpaperGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: wallpapers.length,
      itemBuilder: (context, index) {
        final wallpaper = wallpapers[index];
        return _buildWallpaperCard(wallpaper);
      },
    );
  }

  Widget _buildWallpaperCard(Wallpaper wallpaper) {
    final isSelected = selectedWallpaper.id == wallpaper.id;

    return GestureDetector(
      onTap: () => setState(() => selectedWallpaper = wallpaper),
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
                        if (wallpaper.isFavorite) {
                          await _favoritesService.removeFavorite(wallpaper.id);
                        } else {
                          await _favoritesService.saveFavorite(wallpaper);
                        }
                        setState(() {
                          wallpaper.isFavorite = !wallpaper.isFavorite;
                        });
                      },
                      child: Icon(
                        wallpaper.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 16,
                        color: wallpaper.isFavorite ? Colors.red : Colors.white,
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
                        'Nature',
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

  Widget _buildPhonePreview() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: AspectRatio(
          aspectRatio: 9 / 19.5,
          child: Stack(
            children: [
              Image.asset(
                selectedWallpaper.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: 120,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWallpaperInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          selectedWallpaper.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: selectedWallpaper.tags.map((tag) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Text(
                tag,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Text(
          selectedWallpaper.description,
          style: TextStyle(color: Colors.grey[600], height: 1.5),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildActionIcon(Icons.share_outlined),
            const SizedBox(width: 16),
            _buildActionIcon(Icons.edit_outlined),
            const SizedBox(width: 16),
            _buildActionIcon(Icons.settings_outlined),
          ],
        ),
      ],
    );
  }

  Widget _buildActionIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Icon(icon, size: 20, color: Colors.grey[600]),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: TextButton.icon(
            onPressed: () {
              setState(() {
                selectedWallpaper.isFavorite = !selectedWallpaper.isFavorite;
              });
            },
            icon: Icon(
              selectedWallpaper.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              size: 20,
              color: selectedWallpaper.isFavorite
                  ? Colors.red
                  : Colors.grey[600],
            ),
            label: Text(
              'Save to Favorites',
              style: TextStyle(color: Colors.grey[800]),
            ),
            style: TextButton.styleFrom(),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Implement set wallpaper functionality
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFB74D),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Set to Wallpaper',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildNavigationBar(
  BuildContext context,
  int selectedIndex,
  Function(int) onNavTap,
) {
  return Container(
    width: double.infinity,
    color: Colors.white,
    child: Center(
      child: SizedBox(
        width: 1346,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 24,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF6B6B), Color(0xFFFF8E53)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.stars,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Wallpaper Studio',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _buildNavItem(
                    icon: Icons.home_outlined,
                    label: 'Home',
                    isSelected: selectedIndex == 0,
                    onTap: () => onNavTap(0),
                  ),
                  const SizedBox(width: 12),
                  _buildNavItem(
                    icon: Icons.grid_view_outlined,
                    label: 'Browse',
                    isSelected: selectedIndex == 1,
                    onTap: () => onNavTap(1),
                  ),
                  const SizedBox(width: 12),
                  _buildNavItem(
                    icon: Icons.favorite_outline,
                    label: 'Favourites',
                    isSelected: selectedIndex == 2,
                    onTap: () => onNavTap(2),
                  ),
                  const SizedBox(width: 12),
                  _buildNavItem(
                    icon: Icons.settings_outlined,
                    label: 'Settings',
                    isSelected: selectedIndex == 3,
                    onTap: () => onNavTap(3),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildNavItem({
  required IconData icon,
  required String label,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey.shade100 : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF333333)),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 15, color: Color(0xFF333333)),
          ),
        ],
      ),
    ),
  );
}

// REUSABLE WALLPAPER PREVIEW WIDGET
class WallpaperPreviewWidget extends StatefulWidget {
  final String name;
  final List<String> tags;
  final String description;
  final String imageUrl;
  final VoidCallback? onShare;
  final VoidCallback? onEdit;
  final VoidCallback? onSettings;
  final VoidCallback? onSaveToFavorites;
  final VoidCallback? onSetWallpaper;
  final bool initialFavoriteState;

  const WallpaperPreviewWidget({
    Key? key,
    required this.name,
    required this.tags,
    required this.description,
    required this.imageUrl,
    this.onShare,
    this.onEdit,
    this.onSettings,
    this.onSaveToFavorites,
    this.onSetWallpaper,
    this.initialFavoriteState = false,
  }) : super(key: key);

  @override
  State<WallpaperPreviewWidget> createState() => _WallpaperPreviewWidgetState();
}

class _WallpaperPreviewWidgetState extends State<WallpaperPreviewWidget> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.initialFavoriteState;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Content Row
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Side - Details
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(right: 24, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Preview Title
                          Container(
                            margin: const EdgeInsets.only(bottom: 32),
                            child: const Text(
                              'Preview',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A),
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),

                          // Name Label
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: const Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF9E9E9E),
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),

                          // Wallpaper Name
                          Container(
                            margin: const EdgeInsets.only(bottom: 24),
                            child: Text(
                              widget.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1A1A1A),
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),

                          // Tags Label
                          Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: const Text(
                              'Tags',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF9E9E9E),
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),

                          // Tags Row
                          Container(
                            margin: const EdgeInsets.only(bottom: 24),
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: widget.tags
                                  .map((tag) => _buildTag(tag))
                                  .toList(),
                            ),
                          ),

                          // Description Label
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: const Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF9E9E9E),
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),

                          // Description Text
                          Container(
                            margin: const EdgeInsets.only(bottom: 32),
                            child: _buildDescription(widget.description),
                          ),

                          // Action Icons Row
                          Container(
                            child: Row(
                              children: [
                                _buildIconButton(
                                  Icons.share_outlined,
                                  widget.onShare,
                                ),
                                const SizedBox(width: 16),
                                _buildIconButton(
                                  Icons.auto_fix_high_outlined,
                                  widget.onEdit,
                                ),
                                const SizedBox(width: 16),
                                _buildIconButton(
                                  Icons.settings_outlined,
                                  widget.onSettings,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Right Side - Phone Preview
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: _buildPhonePreview(),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Buttons
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Save to Favorites Button
                  _buildSaveToFavoritesButton(),

                  const SizedBox(width: 12),

                  // Set to Wallpaper Button
                  _buildSetWallpaperButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription(String description) {
    // Split description to find the quoted text
    final quoteStartIndex = description.indexOf('"');
    final quoteEndIndex = description.indexOf('"', quoteStartIndex + 1);

    if (quoteStartIndex != -1 && quoteEndIndex != -1) {
      final beforeQuote = description.substring(0, quoteStartIndex);
      final quotedText = description.substring(
        quoteStartIndex,
        quoteEndIndex + 1,
      );
      final afterQuote = description.substring(quoteEndIndex + 1);

      return RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14, height: 1.6, letterSpacing: 0.1),
          children: [
            TextSpan(
              text: beforeQuote + quotedText + ' ',
              style: const TextStyle(
                color: Color(0xFF2A2A2A),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: afterQuote,
              style: const TextStyle(
                color: Color(0xFFAAAAAA),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    }

    // If no quotes found, return plain text
    return Text(
      description,
      style: const TextStyle(
        fontSize: 14,
        height: 1.6,
        letterSpacing: 0.1,
        color: Color(0xFF2A2A2A),
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Color(0xFF424242),
          letterSpacing: 0.1,
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback? onTap) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Icon(icon, size: 20, color: const Color(0xFF616161)),
        ),
      ),
    );
  }

  Widget _buildPhonePreview() {
    return Container(
      width: 260,
      height: 520,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(45),
        border: Border.all(color: const Color(0xFF2A2A2A), width: 8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(38),
        child: Stack(
          children: [
            // Wallpaper Image
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Dynamic Island
            Positioned(
              top: 12,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  width: 120,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            // Bottom indicator
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  width: 140,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveToFavoritesButton() {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
            widget.onSaveToFavorites?.call();
          },
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                  color: isFavorite ? Colors.red : const Color(0xFF424242),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Save to Favorites',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF424242),
                    letterSpacing: 0.1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSetWallpaperButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFB74D), Color(0xFFFFA726)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFB74D).withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onSetWallpaper,
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            child: const Text(
              'Set to Wallpaper',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 0.1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
