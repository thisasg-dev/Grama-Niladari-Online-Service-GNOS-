import 'package:flutter/material.dart';
import 'alerts.dart';
import 'marketplace.dart';
import 'profile.dart';

class Death extends StatelessWidget {
  const Death({super.key});

  // UI Colors
  final Color maroon = const Color(0xFF8B0000);
  final Color bgWhite = const Color(0xFFFFFFFF);
  final Color fieldBg = const Color(0xFFF7F7F7);
  final Color lightGray = const Color(0xFF666666);
  final Color borderColor = const Color(0xFFEEEEEE);
  final Color pinkishBg = const Color(0xFFF9F3F3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      // 1. Top Bar (Consistent with Birth/Certificate Service)
      appBar: AppBar(
        backgroundColor: maroon,
        elevation: 0,
        title: const Text(
          "Apply Death Certificate",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subject Identity',
              style: TextStyle(
                color: maroon,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Please ensure all details match official hospital or medical records.",
              style: TextStyle(fontSize: 14, color: lightGray),
            ),
            const SizedBox(height: 30),

            // SECTION: DECEASED INFORMATION
            _buildSectionCard(
              title: 'DECEASED INFORMATION',
              children: [
                _buildInputField(
                  'FULL NAME OF DECEASED',
                  'Enter legal full name',
                  'මියගිය තැනැත්තාගේ සම්පූර්ණ නම',
                ),
                _buildInputField('DATE OF DEATH', 'mm/dd/yyyy', 'මියගිය දිනය'),
                _buildInputField(
                  'PLACE OF DEATH',
                  'City or Hospital Name',
                  'මියගිය ස්ථානය',
                ),
              ],
            ),
            const SizedBox(height: 20),

            // SECTION: APPLICANT RELATIONSHIP
            _buildSectionCard(
              title: 'APPLICANT RELATIONSHIP',
              icon: Icons.link,
              children: [
                _buildInputField(
                  'RELATIONSHIP',
                  'e.g. Spouse, Child, Next of kin',
                  'සම්බන්ධතාවය',
                ),
              ],
            ),

            const SizedBox(height: 20),

            // DIGITAL VERIFICATION INFO
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: pinkishBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.verified_user, color: maroon, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        'DIGITAL VERIFICATION',
                        style: TextStyle(
                          color: maroon,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Your application will be cross-referenced with regional health authorities and divisional secretariats. False declarations are subject to legal action.',
                    style: TextStyle(
                      color: lightGray,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // SUBMIT BUTTON
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: maroon,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'SUBMIT APPLICATION',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      // 2. Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: maroon,
        shape: const CircleBorder(),
        child: const Icon(Icons.auto_awesome, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // 3. Bottom Navigation Bar
      bottomNavigationBar: const GnosBottomNav(),
    );
  }

  Widget _buildSectionCard({
    required String title,
    IconData? icon,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 16, color: maroon),
                  const SizedBox(width: 8),
                ],
                Text(
                  title,
                  style: TextStyle(
                    color: maroon,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint, String subHint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: lightGray,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: fieldBg,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          if (subHint.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              subHint,
              style: TextStyle(color: lightGray.withOpacity(0.6), fontSize: 10),
            ),
          ],
        ],
      ),
    );
  }
}

// Bottom Navigation Bar Implementation (Consistent with Birth)
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
                _buildNavItem(context, Icons.home, 'Home', false, () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
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
                      MaterialPageRoute(builder: (context) => alerts()),
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                _buildNavItem(context, Icons.storefront, 'Market', false, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => marketplace()),
                  );
                }),
                const SizedBox(width: 40),
                _buildNavItem(
                  context,
                  Icons.person_outline,
                  'Profile',
                  false,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const profile()),
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
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
