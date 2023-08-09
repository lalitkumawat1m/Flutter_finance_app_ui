import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_finance_app/pages/home_page.dart';
import 'package:flutter_finance_app/theme/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/button.dart';
class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final TextEditingController _bvn =
      TextEditingController();
   
//  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;
  final formKey = GlobalKey<FormState>();

  String currentText = "";
  bool hasError = false;
  late Timer _timer;
  int _start = 120;
  bool isLoading = false;
  Duration myDuration = const Duration(minutes: 2);
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) 
{        if (_start == 0) {
          setState(() {
            timer.cancel();
            isLoading = false;
          });
        } else {
          setState(() {
            _start--; 
         });
        } 
     },
    );
  }

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();

    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    errorController!.close();
  }

 
  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon:const Icon(Icons.arrow_back_ios_new, size: 20, color: Color(0xff67727d),)),
        elevation: 0.0,
        backgroundColor:primary,
        centerTitle: true,
        title:const Text('Verification',  style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xff67727d)),),
      ),
      backgroundColor: primary,
      body: getBody(),
    );
  }

  Widget getBody() {

   
   

  //  var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Center(
      child: Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
                        "We need to verify your Identity before you can continue\nCheck your e-mail for code",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color(0xff67727d)),
                      )
          ),
          const SizedBox(
            height: 50,
          ),
         Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PinCodeTextField(
                    autoFocus: true,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        // fieldHeight: 30,
                        // fieldWidth: 30,
                        activeFillColor: buttoncolor.withOpacity(0.5),
                        disabledColor: Colors.white.withOpacity(0.5),
                        inactiveColor: Colors.white.withOpacity(0.5),
                        inactiveFillColor: const Color(0xff67727d),
                        selectedColor: Colors.white.withOpacity(0.5),
                        activeColor: Colors.white.withOpacity(0.5),
                        selectedFillColor: const Color(0xff67727d),
                        errorBorderColor: red),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: _bvn,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    textStyle: const TextStyle(color: Colors.white),
                    useHapticFeedback: true,
                    onCompleted: (v) {
                      currentText = v;
                
                    },
                    onChanged: (value) {
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    appContext: context,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _start != 0
                  ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                        children: [
                          Text(
                            "Resend Code in",
                            style: TextStyle(
                                color: const Color(0xff67727d).withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(width: 10),
                          Text(_start.toString(),
                            style:const TextStyle(
                                color: Color(0xff67727d),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                  )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Didn't receive code?",
                          style: TextStyle(
                              color: const Color(0xff67727d).withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                          _start = 120;
                              isLoading = true;
                              startTimer();
                            });
                          },
                          child:const Text(
                            "Request again",
                            style: TextStyle(
                                color:Color(0xff67727d),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        )
                      ],
                    ),
              const SizedBox(height: 10),
              CustomButton(
                      minWidth: MediaQuery.of(context).size.width * 0.9,
                      maxWidth: MediaQuery.of(context).size.width * 0.9,
                      minHeight: 60,
                      onPressed: () {
                        formKey.currentState!.validate();

                        if (currentText.length != 6) {
                          errorController!.add(ErrorAnimationType
                              .shake); // Triggering error shake animation
        
                  setState(() => hasError = true);
                  
                        } else {
                          setState(
                            () {
                                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
                            },
                          );
                        }
                      },
                      color: buttoncolor,
                      title: "VERIFY")
            ],
          ),
        ),

    );
  }
}
