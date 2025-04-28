import 'package:flutter/material.dart';

import 'BottomNavBar.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  int _selectedIndex = 1; // Calendar selected

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, '/dashboard');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/timeline');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/NoteScreen');
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      backgroundColor: const Color(0xFFF2F6FF), // Light background
      body: SafeArea(
        child: Stack(
          children: [
            // Main Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      // Icon(Icons.menu, size: 28),
                      Row(
                        children: [
                          Text(
                            "Jan 2021",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                      Icon(Icons.more_vert, size: 28),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Timeline and Events
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Date Timeline
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            dateTile('02', 'Saturday', isCurrent: false),
                            const SizedBox(height: 30),
                            dateTile('04', 'Monday', isCurrent: false),
                            const SizedBox(height: 30),
                            dateTile('07', 'Thursday', isCurrent: false),
                            const SizedBox(height: 30),
                            dateTile('08', 'Friday', isCurrent: true),
                          ],
                        ),

                        // Vertical Line
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: 2,
                          color: Colors.blue,
                        ),

                        // Events List
                        Expanded(
                          child: ListView(
                            children: [
                              birthdayCard(),
                              const SizedBox(height: 20),
                              eventCard('Dashboard Design', '11:30am - 3:00pm'),
                              const SizedBox(height: 10),
                              eventCard('Product Launch', '1:00pm - 1:30pm'),
                              const SizedBox(height: 10),
                              highlightedEventCard(
                                'Hospital Visit',
                                '4:00pm - 5:30pm',
                              ),
                              const SizedBox(height: 20),
                              eventCardWithAvatar(
                                'Team Meeting',
                                '10:30am - 11:00am',
                                'assets/profiles/profile_4.jpeg',
                                '+3',
                              ),
                              const SizedBox(height: 10),
                              eventCardWithAvatar(
                                'Branding Assignment',
                                '1:15pm - 2:30pm',
                                'assets/profiles/profile_5.jpeg',
                                '+2',
                              ),
                              const SizedBox(height: 10),
                              eventCardWithAvatar(
                                'Dinner with Miranda',
                                '7:00pm - 8:30pm',
                                'assets/profiles/profile_6.jpeg',
                                '',
                              ),
                              const SizedBox(height: 10),
                              eventCardWithAvatar(
                                'Assignment for Michael',
                                '9:00pm - 10:30pm',
                                'assets/profiles/profile_3.jpeg',
                                '',
                              ),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Floating Center Button
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50, left: 10),
                child: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: () {},
                  child: const Icon(Icons.add, size: 32),
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
    );
  }

  // Timeline Date Tile
  Widget dateTile(String day, String weekday, {bool isCurrent = false}) {
    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(weekday, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 8),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: isCurrent ? Colors.green : Colors.white,
            border: Border.all(color: Colors.blue, width: 2),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  // Birthday Card
  Widget birthdayCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profiles/profile_3.jpeg'),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "Lindsay Birthday",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const Icon(Icons.card_giftcard, color: Colors.white),
        ],
      ),
    );
  }

  // Normal Event Card
  Widget eventCard(String title, String time) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(time, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  // Highlighted Green Event Card
  Widget highlightedEventCard(String title, String time) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(time, style: const TextStyle(fontSize: 14, color: Colors.white)),
        ],
      ),
    );
  }

  // Event Card With Avatar
  Widget eventCardWithAvatar(
    String title,
    String time,
    String avatarPath,
    String count,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: AssetImage(avatarPath)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          if (count.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(count),
            ),
        ],
      ),
    );
  }
}
