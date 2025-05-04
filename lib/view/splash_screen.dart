
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.sizeOf(context).width;
    double height=   MediaQuery.sizeOf(context).height;

    return Scaffold(
      body:
          
          Center(
            child: Container(
              width:width *(200/375) ,
              height: height*(200/812),
             child:  Image.asset("assets/images/splash.png"),
            ),
          ),
        
          
        
      
    );
  }
}