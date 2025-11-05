# My Desktop App - Wallpaper Manager

A modern Flutter desktop application for browsing, managing, and setting beautiful wallpapers. Built with Flutter for Windows, featuring a sleek UI and powerful wallpaper management capabilities.

## Features

### 🎨 Wallpaper Management
- **Browse Categories** - Explore curated collections of stunning wallpapers organized by categories (Nature, Abstract, Urban, Space, Minimalist, Animals)
- **Grid & List Views** - Switch between grid and list layouts for browsing wallpapers
- **Favorites System** - Save your favorite wallpapers with persistent storage
- **Search & Filter** - Easy navigation through wallpaper collections

### 🖼️ Wallpaper Preview
- **High-Quality Preview** - View detailed previews of wallpapers before setting
- **Wallpaper Details** - See tags, descriptions, and metadata for each wallpaper
- **Quick Actions** - Share, edit, and customize wallpaper settings

### ⚙️ Customization
- **Wallpaper Settings** - Configure display mode (Fit, Fill, Stretch, Tile)
- **Auto-Rotation** - Automatically change wallpapers at regular intervals
- **Lock Wallpaper** - Prevent accidental changes to your current wallpaper
- **Sync Across Devices** - Keep wallpaper settings consistent

### 💾 Persistent Storage
- **Local Storage** - Favorites are saved locally using SharedPreferences
- **State Management** - Efficient state management for smooth UI interactions

## Project Structure

```
my_desktop_app/
├── lib/
│   ├── main.dart                          # Entry point
│   ├── models/
│   │   └── wallpaper.dart                 # Wallpaper data model
│   ├── services/
│   │   └── favorites_service.dart         # Favorites management
│   ├── screens/
│   │   ├── home/
│   │   │   ├── home_screen.dart
│   │   │   ├── category_detail_screen.dart
│   │   │   └── category_card.dart
│   │   ├── browse/
│   │   │   └── browse_screen.dart
│   │   ├── favourites/
│   │   │   └── favourites_screen.dart
│   │   └── settings/
│   │       └── settings_screen.dart
│   └── widgets/
│       └── wallpaper_settings_dialog.dart
├── assets/
│   ├── images/                            # Wallpaper images
│   ├── OTF/                               # Font files
│   └── Poppins/                           # Font files
├── pubspec.yaml                           # Dependencies
└── README.md
```

## Getting Started

### Prerequisites
- Flutter 3.9.2 or higher
- Windows 10 or later
- Dart 3.9.2 or higher

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/my_desktop_app.git
cd my_desktop_app
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app in debug mode**
```bash
flutter run -d windows
```

4. **Build for release**
```bash
flutter build windows --release
```

## Dependencies

- **flutter** - UI framework
- **shared_preferences** - Local storage for favorites
- **cupertino_icons** - Icon library

## Usage

### Browsing Wallpapers

1. Navigate to the **Browse** tab
2. Select a category to view wallpapers
3. Toggle between **Grid** and **List** views
4. Click on a wallpaper to see detailed preview

### Saving Favorites

1. Click the **heart icon** on any wallpaper to add to favorites
2. Access saved wallpapers in the **Favourites** tab
3. Click the heart again to remove from favorites

### Setting Wallpapers

1. Select a wallpaper from any category
2. Click **Set as Wallpaper** in the preview panel
3. Configure settings in the **Wallpaper Setup** dialog
4. Click **Save Settings** to apply

### Customizing Settings

1. Open the **Settings** tab
2. Configure display mode (Fit, Fill, Stretch, Tile)
3. Enable/disable auto-rotation
4. Lock wallpaper to prevent changes
5. Sync settings across devices

## Building for Desktop

### Windows Build

```bash
# Build release executable
flutter build windows --release

# Run the built app
.\build\windows\runner\Release\my_desktop_app.exe
```

### Create Desktop Shortcut

1. Navigate to `build/windows/runner/Release/`
2. Right-click `my_desktop_app.exe`
3. Select "Send to" → "Desktop (create shortcut)"
4. Or pin to Start Menu for quick access

## File Structure

- **lib/models/** - Data models for wallpapers
- **lib/services/** - Business logic and storage services
- **lib/screens/** - UI screens and pages
- **lib/widgets/** - Reusable UI components
- **assets/** - Images, fonts, and other static assets

## Architecture

The app follows a clean architecture pattern:

- **Models** - Define data structures
- **Services** - Handle business logic and persistence
- **Screens** - UI pages and views
- **Widgets** - Reusable UI components

## Key Features Implementation

### Favorites Management
```dart
final FavoritesService _favoritesService = FavoritesService();

// Save favorite
await _favoritesService.saveFavorite(wallpaper);

// Remove favorite
await _favoritesService.removeFavorite(wallpaper.id);

// Get all favorites
final favorites = await _favoritesService.getFavorites();
```

### State Management
The app uses Flutter's built-in `setState` for state management with proper async/await patterns for persistent storage operations.

## Customization

### Adding New Wallpapers
1. Add image files to `assets/images/`
2. Create Wallpaper objects with metadata
3. Add to category collections in screens

### Modifying Themes
- Update color values in UI components
- Modify fonts in `pubspec.yaml`
- Adjust spacing and sizing in widgets

### Extending Features
- Add new categories
- Implement cloud sync
- Add wallpaper download functionality
- Create user accounts

## Troubleshooting

### App won't build
```bash
flutter clean
flutter pub get
flutter build windows
```

### Favorites not persisting
- Check SharedPreferences initialization
- Verify write permissions to app storage
- Clear app cache and rebuild

### Performance issues
- Optimize image loading with proper fit properties
- Implement lazy loading for large image lists
- Profile with DevTools

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Authors

- **Your Name** - Initial work

## Acknowledgments

- Flutter team for the amazing framework
- Community for helpful resources and libraries
- Design inspiration from modern desktop applications

## Support

For support, email support@example.com or open an issue on GitHub.

## Future Roadmap

- [ ] Cloud synchronization
- [ ] User authentication
- [ ] Wallpaper download from online sources
- [ ] Advanced image editing tools
- [ ] Schedule-based wallpaper rotation
- [ ] Multi-monitor support
- [ ] Custom wallpaper upload
- [ ] Sharing wallpapers with friends

---

**Version:** 1.0.0  
**Last Updated:** November 2025  
**Status:** Active Development