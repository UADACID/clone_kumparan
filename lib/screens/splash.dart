import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';

import '../main.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      Routes.sailor.navigate(
        'dashboard',
        navigationType: NavigationType.pushAndRemoveUntil,
        removeUntilPredicate: (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width / 7),
          child: Image.asset('assets/kumparan_text_logo.png'),
        ),
      ),
    );
  }
}
