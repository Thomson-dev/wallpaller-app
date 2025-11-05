import 'package:flutter/material.dart';

class WallpaperSettingsDialog extends StatefulWidget {
  const WallpaperSettingsDialog({Key? key}) : super(key: key);

  @override
  State<WallpaperSettingsDialog> createState() =>
      _WallpaperSettingsDialogState();
}

class _WallpaperSettingsDialogState extends State<WallpaperSettingsDialog> {
  bool isActivated = true;
  String displayMode = 'Fit';
  bool autoRotation = true;
  bool lockWallpaper = true;
  bool syncAcrossDevices = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Semi-transparent background
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),
          // Dialog positioned at the end
          Positioned(
            right: 0,
            top: 0, // Adjust this value to position below your navbar
            child: Container(
              width: 650,
              decoration: BoxDecoration(
                color: Colors.white,

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      'Wallpaper Setup',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 22),
                    child: const Text(
                      'Configure your wallpaper settings and enable auto-rotation',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF9E9E9E),
                        height: 1.4,
                      ),
                    ),
                  ),

                  // Activate Wallpaper
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FFF9),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE8F5E9),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  'Activate Wallpaper',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1A1A1A),
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ),
                              const Text(
                                'Set the selected wallpaper as your\ndesktop background',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF9E9E9E),
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF4CAF50),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.check_circle,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Activated',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  // Display mode
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      'Display mode',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A1A),
                        letterSpacing: -0.1,
                      ),
                    ),
                  ),

                  // Display Mode Options
                  _buildDisplayModeOptions(),
                  SizedBox(height: 15),

                  // Auto-Rotation
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  'Auto - Rotation',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1A1A1A),
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ),
                              const Text(
                                'Automatically change your wallpaper at regular intervals',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF9E9E9E),
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Transform.scale(
                          scale: 0.9,
                          child: Switch(
                            value: autoRotation,
                            onChanged: (value) =>
                                setState(() => autoRotation = value),
                            activeTrackColor: const Color(0xFFFFB74D),
                            activeColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Advanced Settings
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      'Advanced Settings',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A1A),
                        letterSpacing: -0.1,
                      ),
                    ),
                  ),

                  // Lock Wallpaper
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  'Lock Wallpaper',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1A1A1A),
                                  ),
                                ),
                              ),
                              const Text(
                                'Prevent accidental changes',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF9E9E9E),
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Transform.scale(
                          scale: 0.9,
                          child: Switch(
                            value: lockWallpaper,
                            onChanged: (value) =>
                                setState(() => lockWallpaper = value),
                            activeTrackColor: const Color(0xFFFFB74D),
                            activeColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Sync Across Devices
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  'Sync Across Devices',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1A1A1A),
                                  ),
                                ),
                              ),
                              const Text(
                                'Keep wallpaper consistent on all devices',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF9E9E9E),
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Transform.scale(
                          scale: 0.9,
                          child: Switch(
                            value: syncAcrossDevices,
                            onChanged: (value) =>
                                setState(() => syncAcrossDevices = value),
                            activeTrackColor: const Color(0xFFFFB74D),
                            activeColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Bottom Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF757575),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 14,
                            ),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFFB74D), Color(0xFFFFA726)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFFB74D).withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 14,
                              ),
                              child: const Text(
                                'Save Settings',
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisplayModeOptions() {
    return Container(
      child: Column(
        children: [
          _buildDisplayModeOption('Fit', 'Scale to fit without cropping'),
          _buildDisplayModeOption('Fill', 'Scale to fill the entire screen'),
          _buildDisplayModeOption('Stretch', 'Stretch to fill the screen'),
          _buildDisplayModeOption(
            'Tile',
            'Repeat the image to fill the screen',
          ),
        ],
      ),
    );
  }

  Widget _buildDisplayModeOption(String mode, String description) {
    final isSelected = displayMode == mode;

    return Container(
      child: InkWell(
        onTap: () => setState(() => displayMode = mode),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFFFFB74D)
                        : const Color(0xFFE0E0E0),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? const Color(0xFFFFB74D)
                          : Colors.transparent,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      child: Text(
                        mode,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected
                              ? const Color(0xFF1A1A1A)
                              : const Color(0xFF424242),
                        ),
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF9E9E9E),
                        height: 1.3,
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
