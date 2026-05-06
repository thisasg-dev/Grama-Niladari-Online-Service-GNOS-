import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                // Heading
                const Text(
                  "Create New Account",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF4A0000), // තද රතු පැහැය
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Please provide your official identification\ndetails to initiate the registration process.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 40),

                // Main Registration Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35), // Rounded Card
                    border: Border.all(
                      color: const Color(0xFFFFF1F1),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // NIC Number Field
                        _buildLabel("ENTER NIC NUMBER"),
                        _buildTextField(
                          hint: "e.g. 199012345678",
                          icon: Icons.badge_outlined,
                        ),
                        const SizedBox(height: 25),

                        // Full Name Field
                        _buildLabel("FULL NAME"),
                        _buildTextField(hint: "As per NIC record"),
                        const SizedBox(height: 25),

                        // Email Field
                        _buildLabel("EMAIL ADDRESS"),
                        _buildTextField(hint: "abc@gmail.com"),
                        const SizedBox(height: 25),

                        // Password Field
                        _buildLabel("CREATE PASSWORD"),
                        TextFormField(
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: "● ● ● ● ● ● ● ●",
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                              fontSize: 12,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.black38,
                                size: 22,
                              ),
                              onPressed: () => setState(
                                () => _obscurePassword = !_obscurePassword,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFFFF1F1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Min. 8 characters with at least one symbol and number",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black45,
                            fontStyle: FontStyle.italic,
                          ),
                        ),

                        const SizedBox(height: 45),

                        // Register Button
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: 65,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF800000,
                                  ).withOpacity(0.3),
                                  blurRadius: 15,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GNOSApp(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF800000),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                elevation: 0,
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "REGISTER",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Icon(
                                    Icons.person_add_alt_1_outlined,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Footer Text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        height: 1.6,
                      ),
                      children: [
                        const TextSpan(
                          text: "By clicking Register, you agree to the ",
                        ),
                        _buildLinkText("Terms of Service"),
                        const TextSpan(text: " and acknowledge the "),
                        _buildLinkText("Data Privacy Policy"),
                        const TextSpan(
                          text: " of the Government of Sri Lanka.",
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Label Helper
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 2),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Color(0xFF4A0000),
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  // TextField Helper
  Widget _buildTextField({required String hint, IconData? icon}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black26),
        suffixIcon: icon != null
            ? Icon(icon, color: const Color(0xFFE0B0B0), size: 22)
            : null,
        filled: true,
        fillColor: const Color(0xFFFFF1F1), // ලා රෝස පැහැති පසුබිම
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
    );
  }

  // Footer Link Helper
  TextSpan _buildLinkText(String text) {
    return TextSpan(
      text: text,
      style: const TextStyle(
        color: Color(0xFF800000),
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
