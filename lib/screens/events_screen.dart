import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  static const routeName = '/events';

  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All events',
      'Concerts',
      'Technology',
      'Sports',
      'Other',
    ];

    final nearYouEvents = [
      {"title": "Maroon 5", "location": "Recife, Brazil", "date": "MAR 05"},
      {
        "title": "Ariana Grande",
        "location": "São Paulo, Brazil",
        "date": "MAR 17",
      },
      {
        "title": "Drake",
        "location": "Rio de Janeiro, Brazil",
        "date": "APR 02",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Events',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Category chips
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final isSelected = index == 1;
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF0066FF)
                            : const Color(0xFFF5F7FB),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 28),
              const Text(
                'Near you',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const SizedBox(height: 14),

              /// 🔥 Horizontal card list (Near you)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.36,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: nearYouEvents.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (_, index) {
                    final e = nearYouEvents[index];
                    return _NearYouCard(
                      title: e["title"]!,
                      location: e["location"]!,
                      date: e["date"]!,
                    );
                  },
                ),
              ),

              const SizedBox(height: 36),
              const Text(
                'Your events',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const SizedBox(height: 14),

              const _SmallEventTile(
                title: 'Alicia Keys',
                subtitle: 'Olinda, Brazil • Sun, Mar 28 • 5:30 PM',
              ),
              const _SmallEventTile(
                title: 'Michael Jackson',
                subtitle: 'Recife, Brazil • Thu, Apr 11 • 7:00 PM',
              ),

              const SizedBox(height: 36),
              const Text(
                'Selling out',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const SizedBox(height: 14),

              const _EventLargeCard(
                title: 'Justin Bieber',
                subtitle: 'Rio de Janeiro, Brazil • Tue, May 14 • 8:00 PM',
                cta: 'See more',
              ),

              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}

//
// 🔥 FINAL updated card — exactly like screenshot
//
class _NearYouCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;

  const _NearYouCard({
    required this.title,
    required this.location,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          /// Top image area
          Stack(
            children: [
              Container(
                height: 115,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F7FB),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                ),
                child: const Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 55,
                    color: Colors.grey,
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF0066FF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    date,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// Bottom white section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 16),
                Center(
                  child: SizedBox(
                    width: 180,
                    height: 42,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Buy tickets"),
                    ),
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

/// ------------------------------------------------------------------
/// Small Event Tile (Your events)
/// ------------------------------------------------------------------
class _SmallEventTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SmallEventTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F7FB),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.image_outlined, size: 26),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

/// ------------------------------------------------------------------
/// Large Selling Out Card
/// ------------------------------------------------------------------
class _EventLargeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String cta;

  const _EventLargeCard({
    required this.title,
    required this.subtitle,
    required this.cta,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 14),
                OutlinedButton(onPressed: () {}, child: Text(cta)),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 120,
              height: 110,
              color: const Color(0xFFF5F7FB),
              child: const Icon(
                Icons.image_outlined,
                size: 52,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
