import 'package:flutter/material.dart';
import 'events_screen.dart';
import 'empty_projects_screen.dart';
import 'inbox_placeholder_screen.dart';
import 'profile_placeholder_screen.dart';

class MainShell extends StatefulWidget {
  static const routeName = '/main-shell';

  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  // 🔥 Explore now points to EventsScreen as you requested
  final pages = const [
    EventsScreen(),
    EmptyProjectsScreen(),
    InboxPlaceholderScreen(),
    ProfilePlaceholderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0066FF),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Projects"),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Inbox"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
