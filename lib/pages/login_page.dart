import 'package:flutter/material.dart';
import 'package:flutter_finance_app/pages/home_page.dart';
import 'package:flutter_finance_app/pages/signup_page.dart';
import 'package:flutter_finance_app/theme/colors.dart';

import '../widgets/auth_page_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email =
      TextEditingController();
  TextEditingController password = TextEditingController();
 bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: primary,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: Center(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 150,
            height: 200,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/logo1.png'),
                    fit: BoxFit.contain)),
          ),
         
         const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SmallText(text: 'Welcome back!!', size: 20),
          ),
          
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    TextField(
                      controller: _email,
                      cursorColor: black,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: black),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          prefixIconColor: black,
                          hintText: "Email",
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                       validator: (password) {
                            if (password!.isEmpty) {
                              return 'please enter Password';
                            } else {
                              return null;
                            }
                          },
                      obscureText: isSelected,
                      controller: password,
                      cursorColor: black,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: black),
                      decoration:  InputDecoration(
                          prefixIcon:const Icon(Icons.lock_outline_rounded),
                          prefixIconColor: Colors.black,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isSelected = !isSelected;
                                });
                              },
                              icon: isSelected
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                            ),
                          suffixIconColor: Colors.black,
                          hintText: "Password",
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            },
            child: Container(
              
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                
                  color:buttoncolor, borderRadius: BorderRadius.circular(25)),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
           Padding(
            padding:const EdgeInsets.only(left: 26.0, right: 26.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                 onPressed: () {
                   Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupPage(),
                  ));
                 },
                 child:const Text( "Signup",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),),
                ),
              const  SizedBox(width: 8,),
               TextButton(onPressed: () {
                   Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupPage(),
                  ));
               },
                 child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
               ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

