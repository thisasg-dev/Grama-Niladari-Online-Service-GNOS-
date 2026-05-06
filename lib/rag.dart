import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// සටහන: මෙම ෆයිල් ඔබේ ප්‍රොජෙක්ට් එකේ තිබිය යුතුය.
// නැතිනම් මේවා වෙනුවට Placeholder එකක් භාවිතා කරන්න.
import 'home.dart';
import 'marketplace.dart';
import 'profile.dart';
import 'alerts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Map<String, dynamic>> messages = [
    {
      "role": "bot",
      "content":
          "Ayubowan / Vanakkam / Hello!\nI am your GNOS Assistant, a context-aware system designed to support citizens and Grama Niladhari officers.",
      "isInitial": true,
    },
  ];

  bool isLoading = false;

  // ---------------------------------------------------------
  // API එකට සම්බන්ධ වන ප්‍රධාන Function එක
  // ---------------------------------------------------------
  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    setState(() {
      messages.add({"role": "user", "content": text});
      isLoading = true;
    });

    _scrollToBottom();

    try {
      // Gradio API එක සඳහා නිවැරදි URL එක සහ Body එක
      final response = await http
          .post(
            Uri.parse('https://sanketh2002-gnos-rag-bot.hf.space/api/predict'),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "data": [text], // පණිවිඩය data array එකක් ලෙස යැවිය යුතුය
            }),
          )
          .timeout(
            const Duration(seconds: 30),
          ); // Timeout එකක් එක් කිරීම වැදගත්

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Gradio සාමාන්‍යයෙන් පිළිතුර එවන්නේ 'data' array එකේ පළමු index එක ලෙසයි
        String botResponse = (data['data'] != null && data['data'].isNotEmpty)
            ? data['data'][0].toString()
            : "සමාවන්න, පිළිතුරක් ලැබුණේ නැත.";

        setState(() {
          messages.add({
            "role": "bot",
            "content": botResponse,
            "isInitial": false,
          });
        });
      } else {
        _showError("සර්වර් දෝෂයකි: ${response.statusCode}");
        debugPrint("Error Body: ${response.body}");
      }
    } catch (e) {
      debugPrint("Error: $e");
      _showError("සම්බන්ධතාවය අසාර්ථකයි. අන්තර්ජාලය පරීක්ෂා කරන්න.");
    } finally {
      setState(() => isLoading = false);
      _scrollToBottom();
    }
  }

  void _showError(String error) {
    setState(() {
      messages.add({
        "role": "bot",
        "content": "Error: $error",
        "isInitial": false,
      });
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF4F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 35,
              width: 35,
              errorBuilder: (c, e, s) => const Icon(
                Icons.account_balance,
                color: Colors.red,
                size: 35,
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "GNOS",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "DEPARTMENT OF REGISTRATION",
                  style: TextStyle(color: Colors.grey, fontSize: 9),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Color(0xFF800000),
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) =>
                  _buildMessageTile(messages[index]),
            ),
          ),
          if (isLoading)
            const LinearProgressIndicator(
              backgroundColor: Colors.transparent,
              color: Color(0xFF800000),
            ),
          _buildInputArea(),
          const GnosBottomNav(),
        ],
      ),
    );
  }

  Widget _buildMessageTile(Map<String, dynamic> msg) {
    bool isUser = msg['role'] == 'user';
    bool isInitial = msg['isInitial'] ?? false;

    return Column(
      crossAxisAlignment: isUser
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        if (!isUser)
          const Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFF800000),
                radius: 12,
                child: Icon(Icons.auto_awesome, color: Colors.white, size: 14),
              ),
              SizedBox(width: 8),
              Text(
                "GNOS ASSISTANT",
                style: TextStyle(
                  color: Color(0xFF800000),
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        const SizedBox(height: 5),
        Align(
          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isUser ? const Color(0xFF800000) : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: isUser
                    ? const Radius.circular(20)
                    : const Radius.circular(0),
                bottomRight: isUser
                    ? const Radius.circular(0)
                    : const Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
              ],
            ),
            child: Text(
              msg['content'],
              style: TextStyle(
                color: isUser ? Colors.white : Colors.black87,
                fontSize: 14,
              ),
            ),
          ),
        ),
        if (isInitial) _buildQuickActions(),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        _actionButton(Icons.badge_outlined, "NIC Application Status"),
        _actionButton(Icons.description_outlined, "Certificate Requirements"),
        _actionButton(Icons.shopping_bag_outlined, "Marketplace Help"),
      ],
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: OutlinedButton.icon(
        onPressed: () => sendMessage(label),
        icon: Icon(icon, size: 18, color: Colors.black87),
        label: Text(
          label,
          style: const TextStyle(color: Colors.black87, fontSize: 13),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.attach_file, color: Colors.grey),
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (val) {
                sendMessage(val);
                _controller.clear();
              },
              decoration: const InputDecoration(
                hintText: "Ask about services...",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color(0xFF800000),
              child: Icon(Icons.send, color: Colors.white, size: 18),
            ),
            onPressed: () {
              sendMessage(_controller.text);
              _controller.clear();
            },
          ),
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
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context,
            Icons.home,
            'Home',
            false,
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (c) => const home()),
            ),
          ),
          _buildNavItem(
            context,
            Icons.notifications_none,
            'Alerts',
            false,
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (c) => const alerts()),
            ),
          ),
          _buildNavItem(context, Icons.chat, 'Chat', true, () {}),
          _buildNavItem(
            context,
            Icons.storefront,
            'Market',
            false,
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (c) => const marketplace()),
            ),
          ),
          _buildNavItem(
            context,
            Icons.person_outline,
            'Profile',
            false,
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (c) => const profile()),
            ),
          ),
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
        children: [
          Icon(icon, color: isActive ? const Color(0xFF800000) : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFF800000) : Colors.grey,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
