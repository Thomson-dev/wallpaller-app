import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final int wallpaperCount;

  const CategoryCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.wallpaperCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 435.33,
      height: 290.71,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: imageUrl.isEmpty ? Colors.grey.shade200 : null,
              child: imageUrl.isNotEmpty
                  ? Image.asset(imageUrl, fit: BoxFit.cover)
                  : null,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                // gradient: LinearGradient(
                //   colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                //   begin: Alignment.bottomLeft,
                //   end: Alignment.topRight,
                // ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 60,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 40,
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$wallpaperCount wallpapers',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
