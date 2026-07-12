import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup/features/auth/presentation/provider/auth_notifier.dart';
import 'package:whatsup/features/auth/services/auth_services.dart';
import 'package:whatsup/features/chat/presentation/screens/home_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final AuthServices _authServices = AuthServices();

  void _handleLogin() async {
    // 2. Call the Notifier logic instead of the old AuthServices
    if (_phoneController.text.isEmpty) {
      _showError("Please enter a phone number");
      return;
    }

    // await _authServices.login(_phoneController.text);
    // This triggers the login logic in your Clean Architecture AuthNotifier
    ref.read(authNotifierProvider.notifier).login(_phoneController.text);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authNotifierProvider, (previous, next) {
      if (next is AsyncData) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else if (next is AsyncError) {
        _showError("Login failed: ${next.error}");
      }
    });

    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),

            // Whatsup Title
            const Text(
              "Whatsup",
              style: TextStyle(
                color: Color(0xFF25D366),
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "Enter your phone number",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "Whatsup will need to verify your phone number.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 40),

            // Country Selector
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFF25D366), width: 1.5),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("India", style: TextStyle(fontSize: 16)),
                  SizedBox(width: 6),
                  Icon(Icons.arrow_drop_down, size: 20),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Phone Input Row
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFF25D366), width: 1.5),
                ),
              ),
              child: Row(
                children: [
                  const Text("+91", style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: "Phone number",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Floating Continue Button (like Whatsup)
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: FloatingActionButton(
                backgroundColor: const Color(0xFF25D366),
                onPressed: _handleLogin,
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
