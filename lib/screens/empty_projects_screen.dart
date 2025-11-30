import 'package:flutter/material.dart';
import 'search_input_screen.dart';

class EmptyProjectsScreen extends StatelessWidget {
  const EmptyProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Projects",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchInputScreen.routeName);
            },
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7FB),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.image_outlined, size: 40),
              ),
              const SizedBox(height: 24),
              const Text(
                'Nothing here. For now.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const Text(
                "This is where you'll find your\nfinished projects.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Color(0xFF0066FF), // Blue button
                ),
                onPressed: () {},
                child: const Text('Start a project'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
