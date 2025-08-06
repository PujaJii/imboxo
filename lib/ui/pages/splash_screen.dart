import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth_pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    Timer(const Duration(seconds: 3), () {
      Get.offAll(()=> LoginPage());
    });
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/splash.png'))),
          child: Center(
            child: Image.asset('assets/images/logo.png',scale: 10,),
          ),
        ),
      ),
    );
  }
}
