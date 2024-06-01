import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'main.dart';
class  splash extends StatefulWidget {
  const splash ({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatehome();
  }
    navigatehome()async{
     await Future.delayed(Duration(milliseconds: 2500),() {} );
     Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MyHomePage()));
    }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash:
    Column(
      children: [
        Center(
          child: LottieBuilder.asset('Lottie/Animation - 1712554485099.json'),
        )
      ],
    ),
        nextScreen: MyHomePage(),
       splashIconSize: 400,
    );

  }
}
