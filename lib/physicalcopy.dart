import 'package:flutter/material.dart';

// අවශ්‍ය අනෙකුත් ෆයිල්ස් මෙහිදී ඉම්පෝර්ට් කරගන්න
import 'alerts.dart';
import 'marketplace.dart';
import 'profile.dart';

class CertificateDelivery extends StatefulWidget {
  const CertificateDelivery({super.key});

  @override
  State<CertificateDelivery> createState() => _CertificateDeliveryState();
}

class _CertificateDeliveryState extends State<CertificateDelivery> {
  // UI Colors
  final Color maroon = const Color(0xFF8B0000);
  final Color lightGray = const Color(0xFF666666);
  final Color borderColor = const Color(0xFFEEEEEE);
  final Color fieldBg = const Color(0xFFF7F7F7);

  String selectedType = 'Birth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: maroon,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Certificate Delivery",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Physical Copy Delivery',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D2D2D),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Secure doorstep delivery of your official civil status documents.',
              style: TextStyle(fontSize: 15, color: lightGray),
            ),
            const SizedBox(height: 32),

            _sectionTitle('SELECT CERTIFICATE TYPE'),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.8,
              children: [
                _buildTypeCard('Birth', Icons.sentiment_satisfied_alt_outlined),
                _buildTypeCard('Marriage', Icons.favorite_border),
                _buildTypeCard('Death', Icons.person_off_outlined),
                _buildTypeCard('Character', Icons.verified_user_outlined),
              ],
            ),

            const SizedBox(height: 32),
            _sectionTitle('DELIVERY INFORMATION'),
            const SizedBox(height: 20),
            _buildLabel('CONTACT PERSON'),
            _buildTextField('Full Legal Name'),
            const SizedBox(height: 20),
            _buildLabel('DELIVERY ADDRESS'),
            _buildTextField('No, Street, City, Postal Code', maxLines: 3),
            const SizedBox(height: 20),
            _buildLabel('PHONE NUMBER'),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F4F8),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    '+94',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(child: _buildTextField('7X XXX XXXX')),
              ],
            ),
            const SizedBox(height: 32),

            // PAYMENT SUMMARY
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                children: [
                  _paymentRow('Document Fee', 'LKR 500.00'),
                  const SizedBox(height: 12),
                  _paymentRow('Delivery Fee (Express)', 'LKR 350.00'),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Divider(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Amount',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'LKR 850.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: maroon,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // CONFIRM BUTTON
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: maroon,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Confirm & Pay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'BY CONFIRMING, YOU AGREE TO THE GOVERNMENT DIGITAL\nSERVICES TERMS AND EXPRESS DELIVERY CONDITIONS.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: lightGray, height: 1.5),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: maroon,
        shape: const CircleBorder(),
        child: const Icon(Icons.auto_awesome, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const GnosBottomNav(currentPath: 'delivery'),
    );
  }

  // UI Helpers
  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Color(0xFFB07D62),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: lightGray,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(maxLines > 1 ? 20 : 30),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(maxLines > 1 ? 20 : 30),
          borderSide: BorderSide(color: maroon),
        ),
      ),
    );
  }

  Widget _buildTypeCard(String title, IconData icon) {
    bool isSelected = selectedType == title;
    return GestureDetector(
      onTap: () => setState(() => selectedType = title),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? maroon : borderColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? maroon : Colors.black87),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? maroon : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentRow(String label, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: lightGray)),
        Text(amount, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

// Updated GnosBottomNav
class GnosBottomNav extends StatelessWidget {
  final String currentPath;
  const GnosBottomNav({super.key, this.currentPath = ''});

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
                _buildNavItem(
                  context,
                  Icons.home,
                  'Home',
                  currentPath == 'home',
                  () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                ),
                const SizedBox(width: 50),
                _buildNavItem(
                  context,
                  Icons.notifications_none,
                  'Alerts',
                  currentPath == 'alerts',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const alerts()),
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                _buildNavItem(
                  context,
                  Icons.storefront,
                  'Market',
                  currentPath == 'market',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const marketplace(),
                      ),
                    );
                    // Market screen එකට navigate කරන්න
                  },
                ),
                const SizedBox(width: 50),
                _buildNavItem(
                  context,
                  Icons.person_outline,
                  'Profile',
                  currentPath == 'profile',
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
