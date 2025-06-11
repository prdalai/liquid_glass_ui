import 'package:flutter/material.dart';
import 'package:liquid_glass_ui/liquid_glass_ui.dart';
import 'package:intl/intl.dart'; // For date formatting

class MacOSWidgetsExample extends StatelessWidget {
  const MacOSWidgetsExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current date for highlighting in calendar
    final now = DateTime.now();
    final currentDay = now.day;
    final currentMonth = DateFormat.MMMM().format(now);
    final currentYear = now.year;

    // Create a list of days in the current month for a simple calendar display
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    final firstDayOfMonth = DateTime(now.year, now.month, 1).weekday;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Image (Earth View)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/666.jpg'), // Use local asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay with slight dark tint
          Container(
            color: Colors.black.withAlpha((255 * 0.1).round()),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Weather Widget (Placeholder)
                  Flexible(
                    child: LiquidGlassContainer(
                      blur: 30,
                      opacity: 0.4,
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Mumbai', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                          Text('32°', style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
                          Text('Partly Cloudy H:32° L:28°', style: TextStyle(color: Colors.white70, fontSize: 16)),
                          SizedBox(height: 10),
                          // Hourly forecast
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [Icon(Icons.wb_sunny, color: Colors.white), Text('3PM', style: TextStyle(color: Colors.white)), Text('32°', style: TextStyle(color: Colors.white))],), // Placeholder
                              Column(
                                children: [Icon(Icons.cloud, color: Colors.white), Text('4PM', style: TextStyle(color: Colors.white)), Text('32°', style: TextStyle(color: Colors.white))],), // Placeholder
                              Column(
                                children: [Icon(Icons.cloud, color: Colors.white), Text('5PM', style: TextStyle(color: Colors.white)), Text('31°', style: TextStyle(color: Colors.white))],), // Placeholder
                              Column(
                                children: [Icon(Icons.cloud, color: Colors.white), Text('6PM', style: TextStyle(color: Colors.white)), Text('31°', style: TextStyle(color: Colors.white))],), // Placeholder
                              Column(
                                children: [Icon(Icons.wb_cloudy, color: Colors.white), Text('7:16PM', style: TextStyle(color: Colors.white)), Text('31°', style: TextStyle(color: Colors.white))],), // Placeholder
                              Column(
                                children: [Icon(Icons.cloud, color: Colors.white), Text('7PM', style: TextStyle(color: Colors.white)), Text('31°', style: TextStyle(color: Colors.white))],), // Placeholder
                            ],
                          ),
                          SizedBox(height: 10),
                          // Daily forecast
                          Column(children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Thu', style: TextStyle(color: Colors.white)), Icon(Icons.cloud, color: Colors.white), Text('28°', style: TextStyle(color: Colors.white)), Text('32°', style: TextStyle(color: Colors.white))],), // Placeholder
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Fri', style: TextStyle(color: Colors.white)), Icon(Icons.cloudy_snowing, color: Colors.white), Text('27°', style: TextStyle(color: Colors.white)), Text('31°', style: TextStyle(color: Colors.white))],), // Placeholder
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Sat', style: TextStyle(color: Colors.white)), Icon(Icons.cloudy_snowing, color: Colors.white), Text('26°', style: TextStyle(color: Colors.white)), Text('30°', style: TextStyle(color: Colors.white))],), // Placeholder
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Sun', style: TextStyle(color: Colors.white)), Icon(Icons.cloudy_snowing, color: Colors.white), Text('26°', style: TextStyle(color: Colors.white)), Text('29°', style: TextStyle(color: Colors.white))],), // Placeholder
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Mon', style: TextStyle(color: Colors.white)), Icon(Icons.cloudy_snowing, color: Colors.white), Text('25°', style: TextStyle(color: Colors.white)), Text('29°', style: TextStyle(color: Colors.white))],), // Placeholder
                          ],),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  // Calendar Widget
                  Flexible(
                    child: LiquidGlassContainer(
                      blur: 30,
                      opacity: 0.4,
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$currentMonth $currentYear',
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          // Days of the week header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text('S', style: TextStyle(color: Colors.white70)),
                              Text('M', style: TextStyle(color: Colors.white70)),
                              Text('T', style: TextStyle(color: Colors.white70)),
                              Text('W', style: TextStyle(color: Colors.white70)),
                              Text('T', style: TextStyle(color: Colors.white70)),
                              Text('F', style: TextStyle(color: Colors.white70)),
                              Text('S', style: TextStyle(color: Colors.white70)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Dates Grid
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                            ),
                            itemCount: daysInMonth + firstDayOfMonth - 1, // Adjust for leading empty cells
                            itemBuilder: (context, index) {
                              final day = index - firstDayOfMonth + 2; // Adjust for 1-based day and weekday start
                              final isCurrentDay = day == currentDay;
                              final isWithinMonth = day > 0 && day <= daysInMonth;

                              return Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: isCurrentDay && isWithinMonth
                                      ? Colors.white.withAlpha((255 * 0.3).round()) // Highlight current day
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: isWithinMonth
                                    ? Text(
                                        '$day',
                                        style: TextStyle(
                                            color: isCurrentDay ? Colors.black : Colors.white,
                                            fontWeight: isCurrentDay ? FontWeight.bold : FontWeight.normal),
                                      )
                                    : const Text(''), // Empty cells for padding
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  // Clock Widget
                  Flexible(
                    child: LiquidGlassContainer(
                      blur: 30,
                      opacity: 0.4,
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            DateFormat.jm().format(now), // Displays current time (e.g., 3:45 PM)
                            style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            DateFormat.yMMMd().format(now), // Displays current date (e.g., Jun 11, 2024)
                            style: TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                          const SizedBox(height: 20),
                          // Placeholder for analog clock if needed later
                          Icon(Icons.access_time, color: Colors.white, size: 80),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 