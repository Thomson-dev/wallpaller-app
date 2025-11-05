import 'package:flutter/material.dart';
import 'package:my_desktop_app/screens/home/home_screen.dart';
import 'package:my_desktop_app/screens/browse/browse_screen.dart';
import 'package:my_desktop_app/screens/favourites/favourites_screen.dart';
import 'package:my_desktop_app/screens/settings/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Desktop App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          buildNavigationBar(context, _selectedIndex, _onNavTap),
          Expanded(child: _screens[_selectedIndex]),
        ],
      ),
    );
  }

  Widget buildNavigationBar(
    BuildContext context,
    int selectedIndex,
    Function(int) onNavTap,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: 1346,
      color: Colors.white,
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
                child: const Icon(Icons.stars, color: Colors.white, size: 16),
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
              buildNavItem(
                icon: Icons.home_outlined,
                label: 'Home',
                isSelected: selectedIndex == 0,
                onTap: () => onNavTap(0),
              ),
              const SizedBox(width: 12),
              buildNavItem(
                icon: Icons.grid_view_outlined,
                label: 'Browse',
                isSelected: selectedIndex == 1,
                onTap: () => onNavTap(1),
              ),
              const SizedBox(width: 12),
              buildNavItem(
                icon: Icons.favorite_outline,
                label: 'Favourites',
                isSelected: selectedIndex == 2,
                onTap: () => onNavTap(2),
              ),
              const SizedBox(width: 12),
              buildNavItem(
                icon: Icons.settings_outlined,
                label: 'Settings',
                isSelected: selectedIndex == 3,
                onTap: () => onNavTap(3),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildNavItem({
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
}
