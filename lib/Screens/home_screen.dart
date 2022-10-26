import 'package:flutter/material.dart';
import 'package:shared_preference/Screens/login_Screen.dart';
import 'package:shared_preference/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BGColor,
        centerTitle: true,
        title: const Text('Home Screen'),
        actions: [
          IconButton(
              onPressed: ()async{
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.remove('isLogin');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),


    );
  }
}
