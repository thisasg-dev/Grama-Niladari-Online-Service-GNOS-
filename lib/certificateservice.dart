import 'package:flutter/material.dart';
import 'alerts.dart';
import 'marketplace.dart';
import 'merriage.dart';
import 'death.dart';
import 'physicalcopy.dart';
import 'birth.dart';
import 'profile.dart';
// Alerts පේජ් එක මෙහි ඇතැයි උපකල්පනය කෙරේ

// සටහන: අනෙකුත් පේජ් (Market, Profile) සඳහා ද වෙනම ෆයිල් සාදා මෙහි import කරන්න.

class Certificateservice extends StatelessWidget {
  const Certificateservice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        title: const Text(
          "Certificate Services",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Secure digital access to your life events. Request, verify and manage official state issued certificates with end toend encryption.",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),

            _certificateCard(
              context,
              "Birth Certificate",
              "Official record of birth including genealogy data.",
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Birth()),
              ),
            ),
            _certificateCard(
              context,
              "Marriage Certificate",
              "Digital copies of registered marriage entries.",
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => merriage()),
              ),
            ),
            _certificateCard(
              context,
              "Death Certificate",
              "Official registration records for legal clearance.",
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Death()),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Application History",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: () {}, child: const Text("View All")),
              ],
            ),
            _historyItem(
              "Birth Certificate - K. Perera",
              "REF: GNOS-2023-9921 - Applied 2 days ago",
              "PENDING VERIFICATION",
            ),
            _historyItem(
              "Marriage Certificate - D. Silva",
              "REF: GNOS-2023-8842 - Applied Oct 12, 2023",
              "APPROVED & ISSUED",
            ),

            const SizedBox(height: 20),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: const Text(
                    "Need a Physical Copy?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    "Order high-security embossed certificates delivered to your registered home address via courier.",
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // මෙතැනදී Navigator එක මගින් නව පිටුවට යොමු කරයි
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const CertificateDelivery(), // ඔබ යාමට බලාපොරොත්තු වන පිටුවේ නම මෙතැනට දෙන්න
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00E676),
                      foregroundColor: Colors.white,
                      // Button එකේ හැඩය රවුම් කිරීමට අවශ්‍ය නම් (Optional)
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "REQUEST\nDELIVERY",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10),
                    ),
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

  Widget _certificateCard(
    BuildContext context,
    String title,
    String description,
    VoidCallback onTap, // අලුතින් එකතු කළා
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: ElevatedButton(
          onPressed: onTap, // මෙතැනට onTap ලබා දෙන්න
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00E676),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text("APPLY NOW"),
        ),
      ),
    );
  }

  Widget _historyItem(String title, String subtitle, String status) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.history, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle),
        trailing: Text(
          status,
          style: TextStyle(
            color: status.contains("PENDING") ? Colors.orange : Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

// --- Navigation Bar එක මෙතැන් සිට ---

class GnosBottomNav extends StatelessWidget {
  const GnosBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _buildNavItem(context, Icons.home, 'Home', true, () {
                  // දැනට ඉන්නේ Home එකේ නිසා Navigate කිරීම අවශ්‍ය නැත.
                  // නමුත් අවශ්‍ය නම්: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
                }),
                const SizedBox(width: 40),
                _buildNavItem(
                  context,
                  Icons.notifications_none,
                  'Alerts',
                  false,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => alerts(),
                      ), // alerts.dart හි ඇති class එකේ නම මෙතැනට දෙන්න
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                _buildNavItem(context, Icons.storefront, 'Market', false, () {
                  // Market පේජ් එකට යාමට:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => marketplace()),
                  );
                }),
                const SizedBox(width: 40),
                _buildNavItem(
                  context,
                  Icons.person_outline,
                  'profile',
                  false,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => profile()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // මෙහිදී VoidCallback onTap එකතු කර ඇත
  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isActive,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap, // බටන් එක ක්ලික් කළ විට ක්‍රියාත්මක වන Function එක
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
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
