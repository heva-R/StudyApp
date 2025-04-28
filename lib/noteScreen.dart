import 'package:flutter/material.dart';
import 'BottomNavBar.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => NoteScreenState();
}

class NoteScreenState extends State<NoteScreen> {
  int _selectedIndex = 2;

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
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // AppBar
              const SizedBox(height: 20),

              // CATEGORIES title
              const Text(
                'Categories',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // Categories Grid
              SizedBox(
                height: 200,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 2,
                  physics:
                      const NeverScrollableScrollPhysics(), // no scroll inside
                  children: [
                    categoryCard('Design', 25, Colors.blueAccent),
                    categoryCard('Success', 45, Colors.amber),
                    categoryCard('Scientific', 12, Colors.green),
                    categoryCard('Freelancer', 30, Colors.deepPurpleAccent),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // List Notes title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'List Notes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.more_horiz),
                ],
              ),

              const SizedBox(height: 20),

              // Notes List
              Expanded(
                child: ListView(
                  children: [
                    noteCard(
                      title: 'How To Draw A Professional Wireframe?',
                      description:
                          'For Wireframe Design, You Need To Have A Pen And Paper With You, And Using These Two, You Can Design The Idea You Want On Paper...',
                      tags: ['Design', 'Wireframe'],
                      color: const Color(0xFFE9F0FF),
                    ),
                    const SizedBox(height: 16),
                    noteCard(
                      title: 'Ways To Succeed Early',
                      description: '',
                      tags: ['Succeed', 'Goals'],
                      color: const Color(0xFFFFF3D8),
                    ),
                    const SizedBox(height: 16),
                    noteCard(
                      title: 'Scientific Facts Of Space',
                      description: '',
                      tags: ['Scientific', 'Space'],
                      color: const Color(0xFFE7F8EC),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/editor');
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  // Category Card
  Widget categoryCard(String title, int notesCount, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.folder, color: Colors.white, size: 28),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              '$notesCount Notes',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // Notes Card
  Widget noteCard({
    required String title,
    required String description,
    required List<String> tags,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Edit icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.edit, size: 20),
            ],
          ),
          const SizedBox(height: 10),

          // Description
          if (description.isNotEmpty)
            Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),

          const SizedBox(height: 10),

          // Tags
          Wrap(
            spacing: 8,
            children:
                tags.map((tag) {
                  return Chip(
                    label: Text(tag),
                    backgroundColor: Colors.grey.shade200,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
