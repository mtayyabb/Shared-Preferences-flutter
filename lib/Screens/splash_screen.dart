import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preference/Screens/home_screen.dart';
import 'package:shared_preference/Screens/login_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    isLogin();
  }
  void isLogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin = sp.getBool('isLogin') ?? false;
    if(isLogin){
      Timer(Duration(seconds: 3), () {
        //pushReplacement used to exit app without go back to splash screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );

      });

    }
    else{
      Timer(Duration(seconds: 3), () {
        //pushReplacement used to exit app without go back to splash screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff548235),
      body: Center(
        child: Image(image: AssetImage('assets/Logo.png')),
      ),
    );
  }
}
