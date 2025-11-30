import 'package:flutter/material.dart';

class NoResultScreen extends StatelessWidget {
  static const routeName = '/no-result';

  const NoResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final query = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("No Results", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Text(
          'No results found for "$query"',
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
