import 'package:flutter/material.dart';
import 'package:liquid_glass_ui/liquid_glass_ui.dart';

class AppleLiquidWidgetsExample extends StatelessWidget {
  const AppleLiquidWidgetsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              color: Colors.black, // Dark background color
            ),
          ),
          // Widgets and Icons Layer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: Column(
              children: [
                // Top Widgets (Weather and Find My)
                Row(
                  children: [
                    Expanded(
                      child: LiquidGlassContainer(
                        blur: 30,
                        opacity: 0.4,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'San Francisco',
                              style: TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                            Text(
                              '53°',
                              style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Partly Cloudy H:56° L:50°',
                              style: TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Weather',
                              style: TextStyle(color: Colors.white54, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: LiquidGlassContainer(
                        blur: 30,
                        opacity: 0.4,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Now',
                              style: TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                            Row(
                              children: [
                                CircleAvatar(backgroundColor: Colors.white, radius: 10), // Placeholder for person icon
                                SizedBox(width: 8),
                                Text(
                                  'Marina Green',
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              'San Francisco, CA',
                              style: TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Find My',
                              style: TextStyle(color: Colors.white54, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Main App Grid
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: 16, // Example: 16 app icons
                    itemBuilder: (context, index) {
                      List<IconData> icons = [
                        Icons.video_call, Icons.calendar_today, Icons.photo_library, Icons.camera_alt,
                        Icons.mail, Icons.note, Icons.alarm, Icons.access_alarm,
                        Icons.article, Icons.tv, Icons.podcasts, Icons.shopping_bag,
                        Icons.map, Icons.favorite, Icons.account_balance_wallet, Icons.settings,
                      ];
                      List<String> labels = [
                        'FaceTime', 'Calendar', 'Photos', 'Camera',
                        'Mail', 'Notes', 'Reminders', 'Clock',
                        'News', 'TV', 'Podcasts', 'App Store',
                        'Maps', 'Health', 'Wallet', 'Settings',
                      ];
                      return LiquidGlassContainer(
                        blur: 30,
                        opacity: 0.4,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(icons[index], size: 36, color: Colors.white), // App Icon
                            const SizedBox(height: 4),
                            Text(
                              labels[index],
                              style: const TextStyle(color: Colors.white, fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Bottom Dock
                LiquidGlassContainer(
                  blur: 30,
                  opacity: 0.4,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  borderRadius: BorderRadius.circular(30), // Rounded corners for the dock
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.phone, size: 36, color: Colors.white),
                      Icon(Icons.message, size: 36, color: Colors.white),
                      Icon(Icons.laptop_mac, size: 36, color: Colors.white),
                      Icon(Icons.music_note, size: 36, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 