import 'package:flutter/material.dart';
import 'package:shared_preference/constants.dart';
class ButtonDesign extends StatelessWidget {
  String btnText;
  VoidCallback OnTap;
  ButtonDesign({Key? key , required this.btnText,required this.OnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: OnTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: BGColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(btnText,style: TextStyle(color: Colors.white,fontSize: 20),)),
      ),
    );
  }
}
