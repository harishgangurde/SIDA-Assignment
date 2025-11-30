import 'package:flutter/material.dart';

class InboxPlaceholderScreen extends StatelessWidget {
  const InboxPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(child: Text('Inbox'))),
    );
  }
}
