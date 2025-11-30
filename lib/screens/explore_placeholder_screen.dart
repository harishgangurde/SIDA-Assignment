import 'package:flutter/material.dart';
import 'search_result_screen.dart';
import 'events_screen.dart';

class ExplorePlaceholderScreen extends StatelessWidget {
  const ExplorePlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchResultScreen.routeName);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: FilledButton(
          onPressed: () {
            Navigator.pushNamed(context, EventsScreen.routeName);
          },
          child: const Text('Open Events'),
        ),
      ),
    );
  }
}
