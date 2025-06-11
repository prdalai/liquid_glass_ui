import 'package:flutter/material.dart';
import 'package:liquid_glass_ui/liquid_glass_ui.dart';

class BeautifulLiquidExample extends StatefulWidget {
  const BeautifulLiquidExample({super.key});

  @override
  State<BeautifulLiquidExample> createState() => _BeautifulLiquidExampleState();
}

class _BeautifulLiquidExampleState extends State<BeautifulLiquidExample> {
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Image (Album Art)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1510931566802-990a2a5370d0?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay with slightly darker tint for better contrast
          Container(color: Colors.black.withAlpha((255 * 0.3).round())),
          // Main UI Content
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Section (Now Playing & Menu)
                Column(
                  children: [
                    const SizedBox(height: 48), // Padding from top
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'NOW PLAYING',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ],
                    ),
                  ],
                ),

                // Album Art and Song Info
                LiquidGlassContainer(
                  blur: 25,
                  opacity: 0.3,
                  borderRadius: BorderRadius.circular(20),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          15,
                        ), // Slightly rounded corners for album art
                        child: Image.network(
                          'https://images.unsplash.com/photo-1507525428034-b723cf961793?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Album art image
                          height:
                              MediaQuery.of(context).size.width *
                              0.6, // Responsive size
                          width: MediaQuery.of(context).size.width * 0.6,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Summertime Sadness',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Lana Del Rey',
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                // Playback Controls
                Column(
                  children: [
                    Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 1,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white30,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('0:00', style: TextStyle(color: Colors.white70)),
                          Text(
                            '3:25',
                            style: TextStyle(color: Colors.white70),
                          ), // Total song duration
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.shuffle,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                            size: 48,
                          ),
                          onPressed: () {},
                        ),
                        LiquidGlassContainer(
                          blur: 25,
                          opacity: 0.4,
                          borderRadius: BorderRadius.circular(
                            50,
                          ), // Circular play button
                          padding: const EdgeInsets.all(12),
                          child: IconButton(
                            icon: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 48,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.skip_next,
                            color: Colors.white,
                            size: 48,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.repeat,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),

                // Bottom Navigation Dock
                LiquidGlassContainer(
                  blur: 25,
                  opacity: 0.3,
                  borderRadius: BorderRadius.circular(30),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.home, color: Colors.white, size: 30),
                      Icon(Icons.search, color: Colors.white70, size: 30),
                      Icon(
                        Icons.library_music,
                        color: Colors.white70,
                        size: 30,
                      ),
                      Icon(Icons.radio, color: Colors.white70, size: 30),
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
