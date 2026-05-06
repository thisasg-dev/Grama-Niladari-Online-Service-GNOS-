import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

class AccessRecoveryPage extends StatefulWidget {
  const AccessRecoveryPage({super.key});

  @override
  State<AccessRecoveryPage> createState() => _AccessRecoveryPageState();
}

class _AccessRecoveryPageState extends State<AccessRecoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Access Recovery",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A0000),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Please complete the following steps to reset your account access.",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 35),

                  // STEP 1
                  _buildStepHeader("STEP 1: NIC ENTRY", isActive: true),
                  _buildStepContent(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "NIC NUMBER / ජාතික හැඳුනුම්පත් අංකය",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF555555),
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildCustomField(
                          hint: "e.g. 199012345678",
                          icon: Icons.badge_outlined,
                        ),
                      ],
                    ),
                  ),

                  // STEP 2
                  _buildStepHeader("STEP 2:VERIFICATION METHOD"),
                  _buildStepContent(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "PHONE OR EMAIL VERIFICATION / දුරකථන හෝ විද්‍යුත් තැපැල් සත්‍යාපනය",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF555555),
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildCustomField(hint: ""),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "REQUIRED",
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF800000),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // STEP 3
                  _buildStepHeader("STEP 3: OTP VERIFICATION"),
                  _buildStepContent(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "6-DIGIT RECOVERY CODE",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF555555),
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildCustomField(hint: ""),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "RESEND CODE",
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF800000),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // STEP 4
                  _buildStepHeader("STEP 4: NEW PASSWORD"),
                  _buildStepContent(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "NEW PASSWORD",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF555555),
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildCustomField(hint: "", icon: Icons.lock_outline),
                        const SizedBox(height: 20),
                        const Text(
                          "CONFIRM PASSWORD",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF555555),
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildCustomField(
                          hint: "",
                          icon: Icons.history_outlined,
                        ),
                      ],
                    ),
                    isLast: true,
                  ),

                  const SizedBox(height: 30),

                  // Buttons
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GNOSApp(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF800000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "RESET AND LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF800000)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        "BACK TO LOGIN",
                        style: TextStyle(
                          color: Color(0xFF800000),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "Contact Support if you no longer have access",
                      style: TextStyle(fontSize: 12, color: Color(0xFF804040)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Header for Stepper
  Widget _buildStepHeader(String title, {bool isActive = false}) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? const Color(0xFF800000) : const Color(0xFFE0B0B0),
          ),
        ),
        const SizedBox(width: 15),
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w900,
            color: Color(0xFF555555),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  // Content area for Stepper (Vertical line logic)
  Widget _buildStepContent(Widget child, {bool isLast = false}) {
    return Container(
      margin: const EdgeInsets.only(left: 5.5), // To align with circle center
      padding: EdgeInsets.only(left: 20, top: 15, bottom: isLast ? 0 : 30),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                left: BorderSide(color: Color(0xFFE0B0B0), width: 1.5),
              ),
      ),
      child: child,
    );
  }

  // Method Cards (SMS/Email)
  Widget buildMethodCard(IconData icon, String title) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE0B0B0)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Icon(icon, size: 28, color: const Color(0xFF4A0000)),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A0000),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom Styled Input Field
  Widget _buildCustomField({required String hint, IconData? icon}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black26),
        prefixIcon: icon != null
            ? Icon(icon, size: 20, color: Colors.black45)
            : null,
        filled: true,
        fillColor: const Color(0xFFFFF1F1),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE0B0B0), width: 1.5),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE0B0B0), width: 1.5),
        ),
      ),
    );
  }
}
