import 'package:flutter/material.dart';
import 'home.dart';
import 'alerts.dart';
import 'profile.dart';

class marketplace extends StatefulWidget {
  const marketplace({super.key});

  @override
  State<marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<marketplace> {
  // මුල් නිෂ්පාදන ලැයිස්තුව
  final List<Map<String, dynamic>> allProducts = [
    {
      "title": "Traditional Clay Pottery Set",
      "price": "LKR 4,200",
      "location": "Kegalle Region",
      "image":
          "https://img.freepik.com/premium-photo/collection-pottery_776674-555026.jpg",
      "description":
          "Handcrafted by local artisans using traditional Sri Lankan techniques.",
    },
    {
      "title": "Premium Ceylon Spice Bundle",
      "price": "LKR 2,850",
      "location": "Matale District",
      "image": "https://www.mosceylon.com/medias/slide/big/13/s1.jpg",
      "description":
          "A curated selection of authentic Sri Lankan spices directly from Matale farms.",
    },
    {
      "title": "Hand-loomed Silk Saree",
      "price": "LKR 18,500",
      "location": "Batticaloa Weavers",
      "image":
          "https://img.freepik.com/premium-photo/national-handloom-day-india-celebration-concept-typography-vector-illustration-generative-ai_756405-18016.jpg?w=2000",
      "description":
          "Intricately woven silk saree created by master weavers of the Eastern Province.",
    },
  ];

  // පෙන්විය යුතු ලැයිස්තුව (Search result එක අනුව වෙනස් වේ)
  List<Map<String, dynamic>> displayedProducts = [];

  @override
  void initState() {
    super.initState();
    displayedProducts = allProducts; // පටන් ගන්න කොට ඔක්කොම පෙන්වනවා
  }

  // සර්ච් එක වැඩ කරන function එක
  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedProducts = allProducts;
      } else {
        displayedProducts = allProducts
            .where(
              (product) =>
                  product["title"].toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        elevation: 0,
        title: const Text(
          "Artisan Direct Network",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Premium Feature Banner
            Card(
              color: Colors.red.shade50,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.star, color: Color(0xFF8B0000)),
                title: Text(
                  "Premium Feature",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Skip the middleman. Directly support local families.",
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 1. Search Bar (සර්ච් එක ක්‍රියාත්මක වේ)
            TextField(
              onChanged: (value) => _filterProducts(value),
              decoration: InputDecoration(
                hintText: "Search for local products...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "Browse Local Products",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // 2. Product List (ක්ලික් කළ විට වෙන වෙනම details page එකට යයි)
            Column(
              children: displayedProducts.isEmpty
                  ? [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text("No products found!"),
                        ),
                      ),
                    ]
                  : displayedProducts.map((product) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              product["image"],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            product["title"],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "${product["location"]}\n${product["price"]}",
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () {},
                        ),
                      );
                    }).toList(),
            ),

            const SizedBox(height: 10),

            // 3. Add New Product Button (යටින් එකතු කර ඇත)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  print("Add New Product Clicked");
                  // මෙතැනට අලුත් නිෂ්පාදන ඇතුළත් කරන පිටුවට Navigation එක දාන්න
                },
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: Color(0xFF8B0000),
                ),
                label: const Text(
                  "ADD NEW PRODUCT",
                  style: TextStyle(
                    color: Color(0xFF8B0000),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: const BorderSide(color: Color(0xFF8B0000), width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF8B0000),
        shape: const CircleBorder(),
        child: const Icon(Icons.auto_awesome, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const GnosBottomNav(),
    );
  }
}

// Navigation Bar එක
class GnosBottomNav extends StatelessWidget {
  const GnosBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, Icons.home, 'Home', false, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const home()),
            );
          }),
          _buildNavItem(context, Icons.notifications_none, 'Alerts', false, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const alerts()),
            );
          }),
          const SizedBox(width: 40),
          _buildNavItem(context, Icons.storefront, 'Market', true, () {}),
          _buildNavItem(context, Icons.person_outline, 'Profile', false, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const profile()),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isActive,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0xFF8B0000) : Colors.grey,
            size: 24,
          ),
          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFF8B0000) : Colors.grey,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
