import 'dart:async';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lib_management/services/app_constants.dart';
import 'package:lib_management/view_model/app_provider.dart';
import 'package:lib_management/views/home_page.dart';
import 'package:lib_management/views/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      Changes(
        child: MaterialApp(
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
          title: 'REC Library',
          // routes: {'/books/': (context) => const Books()},
        ),
      ),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
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
      const Duration(seconds: 2),
      () async {
        if (await context.read<MyModel>().getLoginDetail()) {
          var temp = await context.read<MyModel>().getUserDetail();

          await context.read<MyModel>().getMailId(temp[1]);
          login = int.parse(temp[0]);
          await context.read<MyModel>().getlocations();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const HomePage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const Login(),
            ),
          );
        }
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
          // Center(
          //   child: FadeTransition(
          //     opacity: _translateAnimation,
          //     child: const Text(
          //       '\n\n\n\n\n\n\nREC_LIBRARY',
          //       style: TextStyle(
          //         fontSize: 32.0,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
