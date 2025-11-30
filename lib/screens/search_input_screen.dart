import 'package:flutter/material.dart';
import 'search_result_screen.dart';
import 'no_result_screen.dart';

class SearchInputScreen extends StatefulWidget {
  static const routeName = '/search-input';

  const SearchInputScreen({super.key});

  @override
  State<SearchInputScreen> createState() => _SearchInputScreenState();
}

class _SearchInputScreenState extends State<SearchInputScreen> {
  final _controller = TextEditingController();

  void _search() {
    final query = _controller.text.trim().toLowerCase();

    if (query == "shoes") {
      Navigator.pushNamed(context, SearchResultScreen.routeName);
    } else {
      Navigator.pushNamed(context, NoResultScreen.routeName, arguments: query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Search", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Search anything...",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _search,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
