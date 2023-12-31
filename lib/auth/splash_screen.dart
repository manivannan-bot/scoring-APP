import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../homescreens/home_screen.dart';
import '../utils/colours.dart';
import '../utils/images.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  getPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? login = preferences.getBool("isLoginScreen");

    if(login == true){
      //String? token = await FirebaseMessaging.instance.getToken();
      String token=' ';
      print(token);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("device_token" , token.toString());
      Timer(
          const Duration(seconds: 2), () async {
        //Navigator.pushNamed(context, 'menu_screen');
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      );
    } else{
      Timer(
          const Duration(seconds: 2), () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      //  Navigator.pushNamed(context, 'login_screen');
      }
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColor.lightColor,
        body: Column(
          children: [
            FadeInRight(
              child: Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(Images.splashTop, fit: BoxFit.cover, width: 100.w,)),
            ),
            const Spacer(),
            ZoomIn(child: Image.asset(Images.logo, width: 50.w,)),
            const Spacer(),
            FadeInLeft(
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset(Images.splashBottom, fit: BoxFit.cover, width: 100.w,)),
            ),
          ],
        ),
      ),
    );
  }
}
