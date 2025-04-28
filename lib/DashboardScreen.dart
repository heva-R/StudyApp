import 'package:flutter/material.dart';

import 'BottomNavBar.dart';
import 'TimelineScreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; // Home selected
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
      backgroundColor: const Color.fromARGB(255, 250, 245, 244),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Profile Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(
                          'assets/profiles/profile.jpeg',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Erica Hawkins",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "6th grade",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.notifications, size: 24),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Next Class
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Next class",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE4E4FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                'Homework',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.check_circle, size: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Basic mathematics",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Today, 08:15am",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundImage: AssetImage(
                            'assets/profiles/profile_2.jpeg',
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Jane Cooper",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Events
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Events",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              eventCard(
                imagePath: 'assets/DashboardScreen/dance.jpeg',
                title: 'Comedy show',
                date: '26 Apr, 6:30pm',
                color: Color(0xFFF7E9F7),
              ),

              const SizedBox(height: 12),

              eventCard(
                imagePath: 'assets/DashboardScreen/comedyShow.jpeg',
                title: 'Dance evening',
                date: '2 May, 5:40pm',
                color: Color(0xFFE4FAF1),
              ),
              const SizedBox(height: 12),

              eventCard(
                imagePath: 'assets/DashboardScreen/christmas.jpeg',
                title: 'Dance evening',
                date: '2 May, 5:40pm',
                color: Color(0xFFF7E9F7),
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
      //   child: Container(
      //     height: 70,
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.circular(30),
      //       boxShadow: [
      //         BoxShadow(
      //           color: Colors.black.withOpacity(0.1),
      //           spreadRadius: 2,
      //           blurRadius: 10,
      //         ),
      //       ],
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // Home Button (active, black background)
      //         Container(
      //           width: 55,
      //           height: 55,
      //           decoration: BoxDecoration(
      //             color: Colors.black,
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           child: const Icon(Icons.home, color: Colors.white, size: 28),
      //         ),

      //         // Calendar Icon
      //         GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder:
      //                     (context) =>
      //                         const TimelineScreen(), // <-- Go to Dashboard
      //               ),
      //             );
      //           },
      //           child: Container(
      //             width: 50,
      //             height: 50,
      //             decoration: BoxDecoration(
      //               color: Colors.transparent,
      //               borderRadius: BorderRadius.circular(15),
      //             ),
      //             child: const Icon(
      //               Icons.calendar_today,
      //               color: Colors.black,
      //               size: 24,
      //             ),
      //           ),
      //         ),

      //         // Book Icon
      //         Container(
      //           width: 50,
      //           height: 50,
      //           decoration: BoxDecoration(
      //             color: Colors.transparent,
      //             borderRadius: BorderRadius.circular(15),
      //           ),
      //           child: const Icon(
      //             Icons.book_outlined,
      //             color: Colors.black,
      //             size: 24,
      //           ),
      //         ),

      //         // Chat Icon
      //         Container(
      //           width: 50,
      //           height: 50,
      //           decoration: BoxDecoration(
      //             color: Colors.transparent,
      //             borderRadius: BorderRadius.circular(15),
      //           ),
      //           child: const Icon(
      //             Icons.chat_bubble_outline,
      //             color: Colors.black,
      //             size: 24,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget eventCard({
    required String imagePath,
    required String title,
    required String date,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  date,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.favorite_border),
        ],
      ),
    );
  }
}
