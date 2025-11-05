import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _imageQuality = 'High (Best Quality)';
  bool _notificationsEnabled = true;
  bool _connected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Center(
        child: SizedBox(
          width: 1346,
          height: 758,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Gradient Title and Subtitle
                Row(
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
                      ).createShader(bounds),
                      child: const Text(
                        'Settings ',
                        style: TextStyle(
                          fontSize: 48, // Reduced font size
                          fontWeight: FontWeight.w500,
                          fontFamily: 'CashDisplay',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Customize your Wallpaper Studio experience',
                  style: TextStyle(fontSize: 16, color: Color(0xFF757575)),
                ),
                const SizedBox(height: 24),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Colors.grey.shade200, width: 2),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Left: Wallpaper Setup
                        SizedBox(
                          width: 600, // Fixed width for left container
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Wallpaper Setup',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Configure your wallpaper settings and enable auto-rotation',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF757575),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                // Image Quality Dropdown
                                Container(
                                  margin: const EdgeInsets.only(bottom: 24),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                      color: Colors.grey.shade200,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Image Quality',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily:
                                              'Poppins', // or your custom font
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade50,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: Colors.grey.shade200,
                                            width: 1,
                                          ),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            value: _imageQuality,
                                            isExpanded: true,
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                              fontFamily: 'Poppins',
                                            ),
                                            items: const [
                                              DropdownMenuItem(
                                                value: 'High (Best Quality)',
                                                child: Text(
                                                  'High ( Best Quality )',
                                                ),
                                              ),
                                              DropdownMenuItem(
                                                value: 'Medium',
                                                child: Text('Medium'),
                                              ),
                                              DropdownMenuItem(
                                                value: 'Low',
                                                child: Text('Low'),
                                              ),
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                _imageQuality = value!;
                                              });
                                            },
                                            dropdownColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Notification Switch
                                Container(
                                  margin: const EdgeInsets.only(bottom: 24),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 18,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                      color: Colors.grey.shade200,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Notification',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            'Get notified about new wallpapers and updates',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF757575),
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Switch(
                                        value: _notificationsEnabled,
                                        activeColor: Color(0xFFFFA726),
                                        onChanged: (value) {
                                          setState(() {
                                            _notificationsEnabled = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      borderRadius: BorderRadius.circular(24),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical: 14,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),
                                          border: Border.all(
                                            color: Colors.grey.shade400,
                                            width: 1,
                                          ),
                                        ),
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    InkWell(
                                      onTap: () {},
                                      borderRadius: BorderRadius.circular(24),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical: 14,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFFA726),
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),
                                        ),
                                        child: const Text(
                                          'Save Settings',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
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
                        const SizedBox(width: 60),
                        // Right: Phone Mockup
                        SizedBox(
                          width: 400, // Fixed width for right container
                          child: AspectRatio(
                            aspectRatio: 0.48,
                            child: Image.asset(
                              'assets/images/phone2.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
