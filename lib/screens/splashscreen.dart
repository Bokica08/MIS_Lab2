import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab2/screens/clothes_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ClothesScreen())));
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[50],
      child: Center(
        child: Text(
          "Clothing App",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 36.0,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              fontFamily: "Roboto"),
        ),
      ),
    );
  }
}
