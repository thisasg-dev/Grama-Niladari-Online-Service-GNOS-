import 'package:flutter/material.dart';
import 'certificateservice.dart';
import 'alerts.dart';
import 'package:url_launcher/url_launcher.dart';

void openPoliceLink() async {
  final Uri url = Uri.parse('https://www.police.lk/?page_id=647');
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}

void openDrpGovLink() async {
  final Uri url = Uri.parse('https://drp.gov.lk/');
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GNOS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8B0000)),
        useMaterial3: true,
        fontFamily: 'Roboto', // Defaulting to Roboto
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Icon(
              Icons.account_balance,
              color: Color(0xFFB8860B),
              size: 30,
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GNOS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'GRAMA NILADARI ONLINE SERVICE',
                  style: TextStyle(fontSize: 8, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Row(
              children: [
                Text('EN', style: TextStyle(fontSize: 12)),
                Icon(Icons.arrow_drop_down, size: 16),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const CircleAvatar(
            backgroundColor: Color(0xFFF0F0F0),
            child: Icon(Icons.person_outline, color: Colors.black),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DigitalIdCard(),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Essential Services', showViewAll: true),
            const SizedBox(height: 16),
            const ServiceGrid(),
            const SizedBox(height: 24),
            const ArtisanSection(),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Recent Activity', showViewAll: true),
            const SizedBox(height: 16),
            const RecentActivityList(),
          ],
        ),
      ),
      bottomNavigationBar: const GnosBottomNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF8B0000),
        shape: const CircleBorder(),
        child: const Icon(Icons.auto_awesome, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class DigitalIdCard extends StatelessWidget {
  const DigitalIdCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8B0000), Color(0xFF4A0000)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DIGITAL ID STATUS',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 10,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Active Citizen Identity',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'STATUS',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 10,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Identity Secured',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final bool showViewAll;

  const SectionHeader({
    super.key,
    required this.title,
    this.showViewAll = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        if (showViewAll)
          const Text(
            'View All',
            style: TextStyle(
              color: Color(0xFF8B0000),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
      ],
    );
  }
}

// CERTIFICATE SERVICE PAGE
class ServiceItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ServiceItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF0F0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: const Color(0xFF8B0000), size: 20),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceGrid extends StatelessWidget {
  const ServiceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        ServiceItem(
          icon: Icons.verified_user_outlined,
          title: 'NIC Verification',
          subtitle: 'Doing National Identity card validation',
          onTap: () {
            openDrpGovLink(); // call the function to open browser
          },
        ),

        ServiceItem(
          icon: Icons.local_police_outlined,
          title: 'Police Reports',
          subtitle: 'Getting reports for lost items, incidents',
          onTap: () {
            openPoliceLink(); // call the function to open browser
          },
        ),

        ServiceItem(
          icon: Icons.description_outlined,
          title: 'Certificates',
          subtitle: 'Birth, marriage & death documents',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Certificateservice()),
            );
          },
        ),

        ServiceItem(
          icon: Icons.person_2_outlined,
          title: 'Character Certificates',
          subtitle: 'View approved official documents',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Certificateservice()),
            );
          },
        ),
      ],
    );
  }
}

class ArtisanSection extends StatelessWidget {
  const ArtisanSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Support Your Village',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
                Text(
                  'Artisans',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
                Text(
                  'DIRECT TRADE MARKETPLACE',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF8B0000),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.stars, color: Colors.white, size: 12),
                  SizedBox(width: 4),
                  Text(
                    'PREMIUM FEATURE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 280,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              ArtisanCard(
                imageUrl:
                    'https://img.freepik.com/premium-photo/collection-pottery_776674-555026.jpg',
                title: 'Traditional Clay Pottery',
                author: 'By Sunil Rathnayake',
              ),
              SizedBox(width: 16),
              ArtisanCard(
                imageUrl:
                    'https://static.fibre2fashion.com/articleresources/images/76/7532/handloom-big_Big.jpg',
                title: 'Hand-loom Textiles',
                author: 'By Anula Kumari',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ArtisanCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;

  const ArtisanCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              imageUrl,
              height: 140,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const CircleAvatar(radius: 8, backgroundColor: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      author,
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B0000),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                    child: const Text(
                      'View Collection',
                      style: TextStyle(fontSize: 12),
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

class RecentActivityList extends StatelessWidget {
  const RecentActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ActivityItem(
          icon: Icons.check_circle_outline,
          iconColor: Colors.green,
          title: 'NIC Verified Successfully',
          time: 'Today, 10:24 AM',
        ),
        SizedBox(height: 12),
        ActivityItem(
          icon: Icons.bolt,
          iconColor: Colors.orange,
          title: 'Electricity Bill Payment',
          time: 'Oct 14, 01:10 PM • LKR 4,250',
        ),
        SizedBox(height: 12),
        ActivityItem(
          icon: Icons.update,
          iconColor: Colors.blue,
          title: 'NIC Update Submitted',
          time: 'Oct 12 • Pending Verification',
          isPending: true,
        ),
      ],
    );
  }
}

class ActivityItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String time;
  final bool isPending;

  const ActivityItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.time,
    this.isPending = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
          if (isPending)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'PENDING',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          else
            const Icon(Icons.chevron_right, color: Colors.grey, size: 16),
        ],
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
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home Button
          _buildNavItem(context, Icons.home, 'Home', true, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }),

          // Alerts Button
          _buildNavItem(context, Icons.notifications_none, 'Alerts', false, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => alerts()),
            );
          }),

          const SizedBox(width: 40), // මැද තිබෙන FAB එක සඳහා ඉඩ
          // Market Button
          _buildNavItem(context, Icons.storefront, 'Market', false, () {
            // Market පේජ් එක හැදූ පසු මෙතැනට Navigate කරන්න
          }),

          // Profile Button
          _buildNavItem(context, Icons.person_outline, 'Profile', false, () {
            // Profile පේජ් එක හැදූ පසු මෙතැනට Navigate කරන්න
          }),
        ],
      ),
    );
  }

  // Helper Widget: මෙය තමයි අයිකන ක්ලික් කරන්න පුළුවන් බටන් බවට පත් කරන්නේ
  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isActive,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
