import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';
import 'marketplace.dart';

class alerts extends StatelessWidget {
  const alerts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // Back button එක සුදු පාට කිරීමට
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Stay updated with official state services and village activity.",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),

            const Text(
              "Government Services",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _notificationItem(
              Icons.verified,
              "NIC Verification Successful",
              "Your identity verification for the new digital ID system has been processed.",
              "2 hours ago",
              Colors.green,
            ),
            _notificationItem(
              Icons.description,
              "Birth Certificate Ready",
              "Your requested digital copy is now available for secure download in your vault.",
              "Yesterday",
              Colors.blue,
            ),

            const SizedBox(height: 20),
            const Text(
              "Village Marketplace",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _notificationItem(
              Icons.shopping_basket,
              "New Artisan Product",
              "Hand-woven baskets from your GN Division are now available for local pickup.",
              "4 hours ago",
              Colors.brown,
            ),

            const SizedBox(height: 80), // පතුලේ Navigation bar එකට ඉඩ තැබීමට
          ],
        ),
      ),
      // Floating Action Button
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

  Widget _notificationItem(
    IconData icon,
    String title,
    String desc,
    String time,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(desc, style: const TextStyle(fontSize: 12)),
        trailing: Text(
          time,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ),
    );
  }
}

class GnosBottomNav extends StatelessWidget {
  const GnosBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, Icons.home, 'Home', false, () {
              // දැනට තිබෙන පිටුව අයින් කර Home එකට යෑමට
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => home()),
                (route) => false,
              );
            }),
            _buildNavItem(context, Icons.notifications, 'Alerts', true, () {
              // දැනටමත් ඉන්නේ Alerts පිටුවේ නිසා navigate වෙන්න අවශ්‍ය නැහැ
            }),
            const SizedBox(width: 40), // FAB Space
            _buildNavItem(context, Icons.storefront, 'Market', false, () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => marketplace()),
              );
            }),
            _buildNavItem(context, Icons.person_outline, 'Profile', false, () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const profile()),
              );
            }),
          ],
        ),
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
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
