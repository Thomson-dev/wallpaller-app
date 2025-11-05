import 'package:flutter/material.dart';
import 'package:my_desktop_app/screens/home/category_card.dart';
import 'package:my_desktop_app/screens/home/category_detail_screen.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  bool isGridView = true;

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Nature',
      'imageUrl': 'assets/images/1.png',
      'subtitle': 'Mountains, Forest and Landscapes',
      'wallpaperCount': 3,
    },
    {
      'title': 'Abstract',
      'imageUrl': 'assets/images/2.png',
      'subtitle': 'Modern Geometric and artistic designs',
      'wallpaperCount': 4,
    },
    {
      'title': 'Urban',
      'imageUrl': 'assets/images/3.png',
      'subtitle': 'Cities, architecture and street',
      'wallpaperCount': 6,
    },
    {
      'title': 'Space',
      'imageUrl': 'assets/images/4.png',
      'subtitle': 'Cosmos, planets, and galaxies',
      'wallpaperCount': 3,
    },
    {
      'title': 'Minimalist',
      'imageUrl': 'assets/images/5.png',
      'subtitle': 'Clean, simple, and elegant',
      'wallpaperCount': 6,
    },
    {
      'title': 'Animals',
      'imageUrl': 'assets/images/6.png',
      'subtitle': 'Wildlife and nature photography',
      'wallpaperCount': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Center(
        child: SizedBox(
          width: 1346,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section with improved layout
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ShaderMask(
                                  shaderCallback: (bounds) =>
                                      const LinearGradient(
                                        colors: [
                                          Color(0xFFFFA726),
                                          Color(0xFFFF7043),
                                        ],
                                      ).createShader(bounds),
                                  child: const Text(
                                    'Browse ',
                                    style: TextStyle(
                                      fontSize: 58,
                                      height: 1.1,
                                      fontFamily: 'CashMarket',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                ShaderMask(
                                  shaderCallback: (bounds) =>
                                      const LinearGradient(
                                        colors: [
                                          Color(0xFFFF7043),
                                          Color(0xFFE91E63),
                                        ],
                                      ).createShader(bounds),
                                  child: const Text(
                                    'Categories',
                                    style: TextStyle(
                                      fontSize: 58,
                                      height: 1.1,
                                      fontFamily: 'CashMarket',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Explore our curated collections of stunning wallpapers',
                              style: TextStyle(
                                fontSize: 18,
                                height: 1.5,
                                color: Color(0xFF757575),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        // View toggle buttons with updated styling
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              _buildViewToggleButton(
                                isGrid: true,
                                icon: Icons.grid_view_rounded,
                                isSelected: isGridView,
                              ),
                              const SizedBox(width: 4),
                              _buildViewToggleButton(
                                isGrid: false,
                                icon: Icons.view_agenda_outlined,
                                isSelected: !isGridView,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    if (isGridView)
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.5,
                        children: categories
                            .map(
                              (category) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CategoryDetailScreen(
                                            title: category['title'],
                                            imageUrl: category['imageUrl'],
                                            subtitle: category['subtitle'],
                                            wallpaperCount:
                                                category['wallpaperCount'],
                                          ),
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(26),
                                child: CategoryCard(
                                  imageUrl: category['imageUrl'],
                                  title: category['title'],
                                  subtitle: category['subtitle'],
                                  wallpaperCount: category['wallpaperCount'],
                                ),
                              ),
                            )
                            .toList(),
                      )
                    else
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryDetailScreen(
                                    title: category['title'],
                                    imageUrl: category['imageUrl'],
                                    subtitle: category['subtitle'],
                                    wallpaperCount: category['wallpaperCount'],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [],
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                    ),
                                    child: Image.asset(
                                      category['imageUrl'],
                                      width: 250,
                                      height: 160,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            category['title'],
                                            style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            category['subtitle'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF5F5F5),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Text(
                                              '${category['wallpaperCount']} wallpapers',
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFF616161),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildViewToggleButton({
    required bool isGrid,
    required IconData icon,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () => setState(() => isGridView = isGrid),
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF3E0) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFFFB74D).withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Icon(
          icon,
          size: 20,
          color: isSelected ? const Color(0xFF1A1A1A) : const Color(0xFFBDBDBD),
        ),
      ),
    );
  }
}
