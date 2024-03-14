import 'dart:async';
import 'package:flutter/material.dart';
import 'package:umall/utils/imageconstant.dart';
import 'package:umall/view/loginscreen/view/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.splash),
              SizedBox(height: 20),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
