import 'dart:convert';
import 'package:crypto/crypto.dart'; // استيراد المكتبة المسؤولة عن التشفير
import 'package:flutter/material.dart';
import 'package:flutter_web/person/login_screen/login_screen.dart';
import 'package:flutter_web/person/model_firebase/model_firbase.dart';
import 'package:flutter_web/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_web/tadrebk%20home%20Website/screen/home_screen.dart';

class CreateAccountPerson extends StatefulWidget {
  const CreateAccountPerson({Key? key}) : super(key: key);

  @override
  State<CreateAccountPerson> createState() => _CreateAccountPersonState();
}

class _CreateAccountPersonState extends State<CreateAccountPerson> {
  // Declare controllers for text fields
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressStreetController = TextEditingController();
  TextEditingController addressCityController = TextEditingController();

  // Create a form key for form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    addressStreetController.dispose();
    addressCityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background image with blur hash
          BlurHash(
            hash: 'LBAAdl4o_NIo9G_4IVofD*M|Rjxu',
            image: 'assets/images/Tadrebk Create Account.png',
            curve: Curves.bounceIn,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // First name text field
                        defaultFormField(
                          onChanged: (value) {},
                          controller: firstNameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                          label: 'First Name',
                          labelColor: Colors.white,
                          prefix: Icons.person,
                          fillColor: Colors.black.withOpacity(0.5),
                        ),
                        const SizedBox(height: 20),
                        // Last name text field
                        defaultFormField(
                          onChanged: (value) {},
                          controller: lastNameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                          label: 'Last Name',
                          labelColor: Colors.white,
                          prefix: Icons.person,
                          fillColor: Colors.black.withOpacity(0.5),
                        ),
                        const SizedBox(height: 20),

                        // Email text field

                        defaultFormField(
                          onChanged: (value) {},
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          label: 'Email',
                          labelColor: Colors.white,
                          prefix: Icons.email,
                          fillColor: Colors.black.withOpacity(0.5),
                        ),
                        const SizedBox(height: 20),
                        // Password text field
                        defaultFormField(
                          onChanged: (value) {},
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          label: 'Password',
                          labelColor: Colors.white,
                          prefix: Icons.lock,
                          fillColor: Colors.black.withOpacity(0.5),
                          isPassword: false, // Set to true for password field
                        ),
                        const SizedBox(height: 20),
                        // Phone number text field
                        defaultFormField(
                          onChanged: (value) {},
                          controller: phoneNumberController,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }

                            return null;
                          },
                          label: 'Phone Number',
                          labelColor: Colors.white,
                          prefix: Icons.phone,
                          fillColor: Colors.black.withOpacity(0.5),
                        ),
                        const SizedBox(height: 20),
                        // Street address text field
                        defaultFormField(
                          onChanged: (value) {},
                          controller: addressStreetController,
                          type: TextInputType.streetAddress,
                          validate: (value) {
                            return null;
                          },
                          label: 'Street Address',
                          labelColor: Colors.white,
                          prefix: Icons.location_on,
                          fillColor: Colors.black.withOpacity(0.5),
                        ),
                        const SizedBox(height: 20),
                        // City text field
                        defaultFormField(

                          onChanged: (value) {},
                          controller: addressCityController,
                          type: TextInputType.text,
                          validate: (value) {
                            return null;
                          },
                          label: 'City',
                          labelColor: Colors.white,
                          prefix: Icons.location_city,
                          fillColor: Colors.black.withOpacity(0.5),
                        ),
                        const SizedBox(height: 20),
                        // Create Account button
                        defaultButton(

                          function: () async {
                            if (_formKey.currentState!.validate()) {
                              // إنشاء كائن Person من البيانات المدخلة
                              Person person = Person(
                                personId: '', // يمكنك توليد معرف فريد هنا إذا كان مطلوبًا
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                email: emailController.text,
                                uId: passwordController.text,
                                phoneNumber: phoneNumberController.text,
                                addressStreet: addressStreetController.text,
                                addressCity: addressCityController.text,
                              );
                              // استخدام الدالة المخصصة لإنشاء الحساب
                              await createNewAccount(person);
                            }
                          },
                          text: "Create Account",
                        ),
                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'I have account ',
                              style: TextStyle(
                                color: Colors.white, // تم تغيير لون النص إلى اللون الأحمر
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextButton(

                              onPressed: () {
                                // قم بتحديد مسار الانتقال إلى شاشة التسجيل هنا
                                Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen(),));
                              },
                              child: const Text(
                                'SIGN IN',
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
          ),
        ],
      ),
    );
  }

  // دالة لإنشاء حساب جديد في Firebase وحفظه في Firestore
  Future<void> createNewAccount(Person person) async {
    try {
      // تشفير كلمة المرور قبل حفظها في Firestore
      String hashedPassword = sha256.convert(utf8.encode(person.uId)).toString();

      // التسجيل في Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: person.email, password: person.uId);
      User? user = userCredential.user;

      if (user != null) {
        // التسجيل في Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set({
          'email': person.email,
          'first_name': person.firstName,
          'last_name': person.lastName,
          'password': hashedPassword, // حفظ كلمة المرور المشفرة
          'phone_number': person.phoneNumber,
          'address_street': person.addressStreet,
          'address_city': person.addressCity,
        });

        // الانتقال إلى الشاشة التالية بعد التسجيل بنجاح
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } catch (e) {
      // إذا حدث خطأ أثناء التسجيل في Firebase Authentication أو Firestore
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'حدث خطأ: $e',
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
  }
}
