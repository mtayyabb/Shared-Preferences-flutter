import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preference/Components/button_compo.dart';
import 'package:shared_preference/Screens/home_screen.dart';
import 'package:shared_preference/Screens/sign_up_screen.dart';
import 'package:shared_preference/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool obscureText = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BGColor,
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(10,50,10,00),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: BGColor,
                backgroundImage: AssetImage('assets/Logo.png',),
                radius: 50,
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.email_outlined,color: tFC,),
                  hintText: 'email',
                  hintStyle: const TextStyle(color: tFC),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: tFC),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: BGColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),

                ),

              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: obscureText,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(color: tFC),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: obscureText
                        ? const Icon(
                      Icons.visibility_off,
                      color: tFC,
                    )
                        : const Icon(
                      Icons.visibility,
                      color: BGColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: tFC),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: BGColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              ButtonDesign(btnText: 'Login', OnTap: () async{ 
                SharedPreferences sp = await SharedPreferences.getInstance();
                String? email = sp.getString('email');
                String? password = sp.getString('password');
                sp.setBool('isLogin', true);
                print(email);
                print(password);
                if(email == emailController.text.toString() && password == passwordController.text.toString()){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }
                else{
                  return print('please Sign Up');
                }
              },),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account yet?"),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                    },
                      child: const Text('Sign up',style: TextStyle(color: BGColor,fontSize: 16),))
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
