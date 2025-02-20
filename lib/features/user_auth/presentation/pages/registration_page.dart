import 'package:flutter_firebase/features/user_auth/presentation/firebase_auth_implementation/firebase_auth_service.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/login_pages.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widget/form_container_widget.dart';
import 'package:flutter_firebase/global/common/toast.dart' as common_toast;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  final String title;

  const RegistrationPage({super.key, required this.title});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isSigningUp = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double componentWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/red_logo.png',
                      width: 180,
                      height: 80,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "REGISTER",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: componentWidth,
                      child: FormContainerWidget(
                        controller: _usernameController,
                        hintText: "Username",
                        isPasswordField: false,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: componentWidth,
                      child: FormContainerWidget(
                        controller: _emailController,
                        hintText: "Email",
                        isPasswordField: false,
                        prefixIcon: const Icon(Icons.mail, color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: componentWidth,
                      child: FormContainerWidget(
                        controller: _passwordController,
                        hintText: "Password",
                        isPasswordField: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: _signUp,
                      child: Container(
                        width: componentWidth,
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF42525),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: _isSigningUp
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "REGISTER",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginPages(title: '')),
                              (route) => false,
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xFFF42525),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/images/fitness_silhouette.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      _isSigningUp = true;
    });

    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    try {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        if (!user.emailVerified) {
          await user.sendEmailVerification();
          common_toast.showToast(
              message: "Registration successful. Please verify your email.");
        }

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPages(title: 'Login'),
          ),
          (route) => false,
        );
      } else {
        common_toast.showToast(message: "Failed to create user. Try again.");
      }
    } catch (e) {
      common_toast.showToast(message: "Error: ${e.toString()}");
    } finally {
      setState(() {
        _isSigningUp = false;
      });
    }
  }
}
