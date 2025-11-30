import 'package:flutter/material.dart';

class SearchResultScreen extends StatefulWidget {
  static const routeName = '/search-results';

  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final List<Map<String, dynamic>> _items = [
    {'title': 'Amazing Shoes', 'price': 12.00},
    {'title': 'Fabulous Shoes', 'price': 15.00},
    {'title': 'Fantastic Shoes', 'price': 15.00},
    {'title': 'Spectacular Shoes', 'price': 12.00},
    {'title': 'Stunning Shoes', 'price': 12.00},
    {'title': 'Wonderful Shoes', 'price': 15.00},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 14),

              /// 🔍 Search Field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Shoes",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              /// 🔽 Sort & Filter Row
              Row(
                children: [
                  _BorderButton(
                    icon: Icons.swap_vert,
                    label: "Sort",
                    onTap: () {},
                  ),
                  const SizedBox(width: 12),
                  _BorderButton(
                    icon: Icons.filter_alt_outlined,
                    label: "Filter",
                    badgeCount: 2,
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 18),

              /// ⬛ Product Grid
              Expanded(
                child: GridView.builder(
                  itemCount: _items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.78,
                  ),
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return _ProductCard(
                      title: item['title'],
                      price: item['price'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ------------------------------------------------------------------------------------------------
/// PRODUCT CARD (matches screenshot)
/// ------------------------------------------------------------------------------------------------
class _ProductCard extends StatelessWidget {
  final String title;
  final double price;

  const _ProductCard({required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          /// Image mock
          Container(
            height: 110,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF3FF),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
            ),
            child: const Center(
              child: Icon(Icons.image_outlined, size: 40, color: Colors.grey),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "€ ${price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ------------------------------------------------------------------------------------------------
/// BORDER BUTTON (Sort / Filter)
/// ------------------------------------------------------------------------------------------------
class _BorderButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final int? badgeCount;
  final VoidCallback onTap;

  const _BorderButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE1E6EF)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 6),
            Text(label),
            if (badgeCount != null) ...[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF0066FF),
                ),
                child: Text(
                  badgeCount.toString(),
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
