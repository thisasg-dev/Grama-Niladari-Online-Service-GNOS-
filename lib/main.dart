import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'firebase_options.dart';
import 'home.dart';
import 'forgot.dart';
import 'registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const GNOSApp());
}

class GNOSApp extends StatelessWidget {
  const GNOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GNOS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'sans-serif'),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F5), // පසුබිම් වර්ණය
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // ශ්‍රී ලංකා රාජ්‍ය ලාංඡනය
                Center(
                  child: Image.network(
                    "https://th.bing.com/th/id/R.6b9ab1ac9dc934e19e6cd80619506fdc?rik=xPKMwRuKaBBoEw&pid=ImgRaw&r=0",
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  "GNOS GOVERNMENT",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF800000), // තද රතු පැහැය
                    letterSpacing: 0.5,
                  ),
                ),
                const Text(
                  "GRAMANILADARI ONLINE SERVICES",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF804040),
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 40),

                // සුදු පැහැති Authentication Box එක
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Authentication",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A0000),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Please enter your government service credentials to proceed.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // NIC Number Field
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "NIC",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF555555),
                              ),
                            ),
                            Text(
                              "REQUIRED",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF800000).withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _nicController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your NIC.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "e.g. 199012345678",
                            hintStyle: const TextStyle(color: Colors.black26),
                            prefixIcon: const Icon(
                              Icons.badge_outlined,
                              size: 20,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFFFF1F1),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF800000),
                                width: 2,
                              ),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFE0B0B0),
                                width: 2,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        // Password Field
                        const Text(
                          "PASSWORD",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF555555),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your password.';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "............",
                            prefixIcon: Icon(Icons.lock_outline, size: 20),
                            suffixIcon: Icon(
                              Icons.visibility_outlined,
                              size: 20,
                              color: Colors.black45,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFFFF1F1),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF800000),
                                width: 2,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFE0B0B0),
                                width: 2,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AccessRecoveryPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "FORGOT ACCESS?",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFD4AF37), // රන්වන් පැහැය
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() != true) {
                                return;
                              }
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => home()),
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
                                  "LOGIN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
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

                        const SizedBox(height: 25),
                        // OR Separator
                        Row(
                          children: [
                            Expanded(
                              child: Divider(color: Colors.grey.shade300),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                "OR",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(color: Colors.grey.shade300),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),
                        // Create Account Button
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationPage(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Color(0xFF800000),
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Text(
                              "CREATE NEW ACCOUNT",
                              style: TextStyle(
                                color: Color(0xFF800000),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                // Footer
                const Text(
                  "MINISTRY OF HOME AFFAIRS, SRI LANKA",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "© 2025 GNOS AUTHORITY",
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Colors.black26,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
