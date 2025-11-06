import 'package:fitnessapp/app_colors.dart';
import 'package:fitnessapp/screens/signin_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController(text: '');
  final emailCtrl = TextEditingController(text: '');
  final passCtrl = TextEditingController(text: '');
  bool showPassword = false;

  InputDecoration _fieldDecoration(String hint, {Widget? suffix}) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      hintStyle: const TextStyle(
        fontSize: 14,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w400,
        color: Colors.grey
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      suffixIcon: suffix,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(AppColors.colorScaffoldBackground),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Title
                          Text(
                            'Sign up now',
                            style: TextStyle(
                              fontSize: 26,

                              fontWeight: FontWeight.w600,
                              color: Color(AppColors.colorPrimaryBlack),
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Please fill the details and create account',
                            style: TextStyle(
                              color: Color(
                                  AppColors.colorPrimaryBlack
                              ).withOpacity(0.5),
                              fontSize: 16,
                              fontFamily:'Lato',
                              fontWeight: FontWeight.w400
                            ),
                          ),

                          const SizedBox(height: 32),

                          // Name
                          TextFormField(
                            controller: nameCtrl,
                            style:  TextStyle(
                              fontFamily: 'Lato',
                              color: Color(AppColors.colorPrimaryBlack),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: _fieldDecoration('Username'),
                            validator:
                                (v) =>
                                    (v == null || v.trim().isEmpty)
                                        ? 'Please enter your name'
                                        : null,
                          ),
                          const SizedBox(height: 16),

                          // Email
                          TextFormField(
                            controller: emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              color: Color(AppColors.colorPrimaryBlack),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: _fieldDecoration('Email'),
                            validator: (v) {
                              if (v == null || v.isEmpty) return 'Please enter email';
                              final emailReg = RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+$");
                              if (!emailReg.hasMatch(v)) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Password
                          TextFormField(
                            controller: passCtrl,
                            obscureText: !showPassword,
                            style:  TextStyle(
                              fontFamily: 'Lato',
                              color: Color(AppColors.colorPrimaryBlack),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: _fieldDecoration(
                              'Password',
                              suffix: IconButton(
                                onPressed:
                                    () =>
                                        setState(() => showPassword = !showPassword),
                                icon: Icon(
                                  showPassword
                                      ? Icons.visibility_off_rounded
                                      : Icons.visibility_rounded,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.length < 8) {
                                return 'Password must be 8 characters';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 10),
                          const Text(
                            'Password must be 8 character',
                            style: TextStyle(color: Colors.white60, fontSize: 16),
                          ),

                          const SizedBox(height: 28),

                          // Sign Up Button
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));

                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(AppColors.colorPrimaryBlack),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Color(AppColors.colorWhite),
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0,
                                  fontSize: 16.0,
                                  fontFamily: 'Lato',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                          const SizedBox(height: 26),

                          // Already have account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: TextStyle(color: Color(
                                    AppColors.colorPrimaryBlack
                                ).withOpacity(0.5),),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInPage()));
                                },
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                    color:  Color(
                                        AppColors.colorPrimaryBlack
                                    ),
                                    fontFamily: 'Lato',
                                    decoration: TextDecoration.underline


                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 18),
                          Center(
                            child: Text(
                              'Or connect',
                              style: TextStyle(color:  Color(
                                  AppColors.colorPrimaryBlack
                              ).withOpacity(0.5)),
                            ),
                          ),



                          // Social icons

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _SocialCircle(icon: Icons.facebook),
                              const SizedBox(width: 22),
                              _SocialCircle(icon: Icons.email),
                              const SizedBox(width: 22),
                              _SocialCircle(icon: Icons.alternate_email),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialCircle extends StatelessWidget {
  final IconData icon;
  const _SocialCircle({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white12, width: 1),
      ),
      child: Icon(icon, size: 34, color: Color(AppColors.colorPrimaryBlack)),
    );
  }
}
