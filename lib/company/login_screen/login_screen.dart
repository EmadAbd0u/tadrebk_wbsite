import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_web/person/create_account/create_account.dart';
import 'package:flutter_web/shared/components/components.dart';
import 'package:flutter_web/tadrebk%20home%20Website/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isPassword = false;

  Future<void> allowUserToLogin(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'No record found. You are not a registered user.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.deepOrangeAccent,
            duration: Duration(seconds: 6),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error occurred: ${e.message}',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.deepOrangeAccent,
          duration: const Duration(seconds: 6),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const BlurHash(
            hash: 'LBAAdl4o_NIo9G_4IVofD*M|Rjxu',
            image: 'assets/images/Tadrebk Log in.png',
            curve: Curves.bounceIn,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultFormField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!value.contains('@') || !value.contains('.com')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        label: 'Email address',
                        labelColor: Colors.white,
                        prefix: Icons.email_outlined,
                        fillColor: Colors.black.withOpacity(0.5),
                        id: 'email',
                      ),
                      const SizedBox(height: 20),
                      defaultFormField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)').hasMatch(value)) {
                            return 'Password must contain letters and numbers';
                          }
                          return null;
                        },
                        fillColor: Colors.black.withOpacity(0.5),
                        labelColor: Colors.white,
                        suffix: isPassword ? Icons.visibility : Icons.visibility_off_outlined,
                        prefix: Icons.lock_outline,
                        label: 'Password',
                        isPassword: isPassword,
                        suffixPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      defaultButton(
                        width: 250,
                        function: () async {
                          if (_formKey.currentState!.validate()) {
                            await allowUserToLogin(
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        },
                        text: "Login",
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account..?',
                            style: TextStyle(
                              color: Colors.white, // تم تغيير لون النص إلى اللون الأحمر
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => const CreateAccountPerson(),));
                              // قم بتحديد مسار الانتقال إلى شاشة التسجيل هنا
                            },
                            child: const Text(
                              'Create Account',
                              style: TextStyle(
                                color: Colors.red, // تم تغيير لون النص إلى اللون الأخضر
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
