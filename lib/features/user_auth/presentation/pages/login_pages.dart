import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/presentation/firebase_auth_implementation/firebase_auth_service.dart'
    as auth_service;
import 'package:flutter_firebase/features/user_auth/presentation/pages/home_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/registration_page.dart';
import 'package:flutter_firebase/global/common/toast.dart' as common_toast;
import 'package:flutter_firebase/features/user_auth/presentation/widget/form_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key, required String title});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  bool _isSigning = false;

  final auth_service.FirebaseAuthService _auth =
      auth_service.FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double componentWidth = MediaQuery.of(context).size.width * 0.7;

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
                      width: 150,
                      height: 90,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'LOG IN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: componentWidth,
                      child: FormContainerWidget(
                        controller: _emailController,
                        hintText: "Email",
                        isPasswordField: false,
                        prefixIcon: Icon(Icons.mail, color: Colors.red),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: componentWidth,
                      child: FormContainerWidget(
                        controller: _passwordController,
                        hintText: "Password",
                        isPasswordField: true,
                      ),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: _signIn,
                      child: Container(
                        width: componentWidth,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFF42525),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: _isSigning
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  "ENTER",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: (componentWidth - 40) / 2,
                          height: 1,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "OR",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Container(
                          width: (componentWidth - 40) / 2,
                          height: 1,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationPage(title: ''),
                          ),
                          (route) => false,
                        );
                      },
                      child: Container(
                        width: componentWidth,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFF42525)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "CREATE AN ACCOUNT",
                            style: TextStyle(
                              color: Color(0xFFF42525),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
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

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      common_toast.showToast(message: "Please enter both email and password.");
      setState(() {
        _isSigning = false;
      });
      return;
    }

    try {
      User? user = await _auth.signInWithEmailAndPassword(email, password);

      if (user != null) {
        if (!user.emailVerified) {
          await user.sendEmailVerification();
          common_toast.showToast(
              message: "Email not verified. Please verify your email.");
          setState(() {
            _isSigning = false;
          });
          return;
        }

        common_toast.showToast(message: "Welcome to Work It Out!");
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              email: email,
            ),
          ),
          (route) => false,
        );
      } else {
        common_toast.showToast(
            message: "An unexpected error occurred. Please try again.");
      }
    } catch (e) {
      debugPrint("Error during sign-in: $e");

      String errorMessage;
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
            errorMessage = "No user found with this email.";
            break;
          case 'wrong-password':
            errorMessage = "Incorrect password. Please try again.";
            break;
          case 'network-request-failed':
            errorMessage = "Network error. Please check your connection.";
            break;
          default:
            errorMessage = "An error occurred: ${e.message}.";
        }
      } else {
        errorMessage = "An unknown error occurred. Please try again later.";
      }

      common_toast.showToast(message: errorMessage);
    } finally {
      setState(() {
        _isSigning = false;
      });
    }
  }
}
