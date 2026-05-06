import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'home.dart';
import 'marketplace.dart';
import 'alerts.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // --- Profile Header Section ---
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFF8B0000).withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.network(
                            'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zToAs08vl9xEVGuHDTYPPcIO0rnZAn7f.jpg',
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Edit Photo Button (Pen Icon)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            print("Edit Profile Photo Clicked");
                            // මෙතැනට පින්තූරය වෙනස් කිරීමේ logic එක එක් කරන්න
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: const Color(0xFF8B0000),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B0000).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "VERIFIED CITIZEN",
                      style: TextStyle(
                        color: Color(0xFF8B0000),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "M. R. Perera",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.badge_outlined, size: 16, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(
                        "NIC: 198524400234",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // --- Total Savings Card ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B0000),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8B0000).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "TOTAL SAVINGS",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "LKR 42,850",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // View Transaction History Logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.15),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          "VIEW TRANSACTION HISTORY",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // --- CITIZEN SETTINGS Section ---
            _buildSectionHeader("CITIZEN SETTINGS"),
            _buildSettingsItem(
              icon: Icons.shield_outlined,
              title: "Account Security",
              onTap: () {
                print("Security Clicked");
              },
            ),
            _buildSettingsItem(
              icon: Icons.translate,
              title: "Language",
              trailingText: "ENGLISH",
              onTap: () {
                print("Language Clicked");
              },
            ),
            _buildSettingsItem(
              icon: Icons.notifications_none,
              title: "Notification Preferences",
              onTap: () {
                print("Notifications Clicked");
              },
            ),

            const SizedBox(height: 10),

            // --- SUPPORT Section ---
            _buildSectionHeader("LEGAL & SUPPORT"),
            _buildSettingsItem(
              icon: Icons.help_outline,
              title: "Help Center",
              onTap: () {
                print("Help Center Clicked");
              },
            ),

            // --- Logout Button ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => GNOSApp()),
                    (route) => false,
                  );
                },
                child: Row(
                  children: const [
                    Icon(Icons.logout, color: Color(0xFF8B0000)),
                    SizedBox(width: 15),
                    Text(
                      "LOGOUT SESSION",
                      style: TextStyle(
                        color: Color(0xFF8B0000),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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

  // Section Header Helper
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Container(height: 2, width: 20, color: const Color(0xFF8B0000)),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  // Clickable Settings Item Helper
  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    String? trailingText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Material(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8B0000).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: const Color(0xFF8B0000), size: 20),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (trailingText != null)
                  Text(
                    trailingText,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Bottom Navigation Bar
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
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => home()),
              (route) => false,
            );
          }),
          _buildNavItem(context, Icons.notifications, 'Alerts', false, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const alerts()),
            );
          }),
          const SizedBox(width: 40),
          _buildNavItem(context, Icons.storefront, 'Market', false, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => marketplace()),
            );
          }),
          _buildNavItem(context, Icons.person, 'Profile', true, () {}),
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
      borderRadius: BorderRadius.circular(10),
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
    );
  }
}
