import 'package:flutter/material.dart';
import 'package:my_desktop_app/screens/home/category_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffF8F8F8),
      body: Center(
        child: SizedBox(
          width: 1346,
          height: 758,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_buildHeroSection(), const CategorySection()],
              ),
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
  }) {
    return Container(
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
    );
  }
}

Widget _buildHeroSection() {
  return Container(
    constraints: const BoxConstraints(minHeight: 140),
    padding: const EdgeInsets.all(40),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Gradient Title
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildGradientText(
              text: 'Discover',
              colors: [const Color(0xFFFFA726), const Color(0xFFFFB74D)],
            ),
            const SizedBox(width: 8),
            _buildGradientText(
              text: 'Beautiful',
              colors: [const Color(0xFFFF7043), const Color(0xFFFF5722)],
            ),
            const SizedBox(width: 8),
            _buildGradientText(
              text: 'Wallpapers',
              colors: [const Color(0xFFFF1744), const Color(0xFFE91E63)],
            ),
          ],
        ),

        // Description
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Discover curated collections of stunning wallpapers.\nBrowse by category, preview in full-screen, and set your favorites.',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    ),
  );
}

Widget _buildGradientText({required String text, required List<Color> colors}) {
  return ShaderMask(
    shaderCallback: (bounds) =>
        LinearGradient(colors: colors).createShader(bounds),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: -1,
        fontFamily: 'CashDisplay',
      ),
    ),
  );
}
