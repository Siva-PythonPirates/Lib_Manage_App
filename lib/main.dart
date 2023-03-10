import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lib_management/view_model/app_provider.dart';
import 'package:lib_management/views/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Changes(
      child: const MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        title: 'REC Library',
      ),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _translateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _translateAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const Login(),
          ),
        );
      },
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: FadeTransition(
              opacity: _translateAnimation,
              child: SizedBox(
                height: screenSize.height * 0.5,
                width: screenSize.width * 0.5,
                child: Image.asset('assets/images/rec_logo.jpg'),
              ),
            ),
          ),
          Center(
            child: FadeTransition(
              opacity: _translateAnimation,
              child: Text(
                '\n\n\n\n\n\n\nREC_LIBRARY',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
