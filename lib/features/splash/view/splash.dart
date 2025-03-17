import 'dart:async';
import 'package:alerto_emergency_response_app/core/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), (){
      context.go("/mainPage");
    });
  }
  @override
  Widget build(BuildContext context) {
    final isDarkMode=Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              isDarkMode?AppImage.darkLogo:AppImage.lightLogo,
              filterQuality: FilterQuality.high,
              width: 200,
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
