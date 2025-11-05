import 'package:flutter/material.dart';
import 'package:my_desktop_app/screens/home/category_card.dart';
import 'package:my_desktop_app/screens/home/category_detail_screen.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See All',
                  style: TextStyle(fontSize: 18, color: Color(0xfff808080)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.6,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryDetailScreen(
                        title: 'Nature',
                        imageUrl: 'assets/images/1.png',
                        subtitle: 'Mountains, Forest and Landscapes',
                        wallpaperCount: 3,
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(26),
                child: CategoryCard(
                  imageUrl: 'assets/images/1.png',
                  title: 'Nature',
                  subtitle: 'Mountains, Forest and Landscapes',
                  wallpaperCount: 3,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryDetailScreen(
                        title: 'Abstract',
                        imageUrl: 'assets/images/2.png',
                        subtitle: 'Modern Geometric and artistic designs',
                        wallpaperCount: 4,
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(26),
                child: CategoryCard(
                  imageUrl: 'assets/images/2.png',
                  title: 'Abstract',
                  subtitle: 'Modern Geometric and artistic designs',
                  wallpaperCount: 4,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryDetailScreen(
                        title: 'Urban',
                        imageUrl: 'assets/images/3.png',
                        subtitle: 'Cities, architecture and street',
                        wallpaperCount: 6,
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(26),
                child: CategoryCard(
                  imageUrl: 'assets/images/3.png',
                  title: 'Urban',
                  subtitle: 'Cities, architecture and street',
                  wallpaperCount: 6,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryDetailScreen(
                        title: 'Space',
                        imageUrl: 'assets/images/4.png',
                        subtitle: 'Cosmos, planets, and galaxies',
                        wallpaperCount: 3,
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(26),
                child: CategoryCard(
                  imageUrl: 'assets/images/4.png',
                  title: 'Space',
                  subtitle: 'Cosmos, planets, and galaxies',
                  wallpaperCount: 3,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryDetailScreen(
                        title: 'Minimalist',
                        imageUrl: 'assets/images/5.png',
                        subtitle: 'Clean, simple, and elegant',
                        wallpaperCount: 6,
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(26),
                child: CategoryCard(
                  imageUrl: 'assets/images/5.png',
                  title: 'Minimalist',
                  subtitle: 'Clean, simple, and elegant',
                  wallpaperCount: 6,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryDetailScreen(
                        title: 'Animals',
                        imageUrl: 'assets/images/6.png',
                        subtitle: 'Wildlife and nature photography',
                        wallpaperCount: 4,
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(26),
                child: CategoryCard(
                  imageUrl: 'assets/images/6.png',
                  title: 'Animals',
                  subtitle: 'Wildlife and nature photography',
                  wallpaperCount: 4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
