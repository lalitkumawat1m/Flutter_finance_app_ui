import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_app/theme/colors.dart';

class TransectionPage extends StatefulWidget {
  const TransectionPage({super.key});

  @override
  State<TransectionPage> createState() => _TransectionPageState();
}

class _TransectionPageState extends State<TransectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.back,color: black,),
        actions: const[ Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(CupertinoIcons.search,color: black,),
        )],
        backgroundColor: primary,elevation: 0,),
      backgroundColor: primary,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          // Container(
          //   decoration: BoxDecoration(color: primary, boxShadow: [
          //     BoxShadow(
          //         color: grey.withOpacity(0.01),
          //         spreadRadius: 10,
          //         blurRadius: 3)
          //   ]),
          //   child: const Padding(
          //     padding:
          //         EdgeInsets.only(top: 20, bottom: 25, right: 20, left: 20),
          //     child: Column(
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Icon(CupertinoIcons.back),
          //             Icon(CupertinoIcons.search)
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Transaction",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: mainFontColor,
                    )),
                Text("See all",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: mainFontColor,
                    )),
              ],
            ),
          ),
         
         Padding(
           padding: const EdgeInsets.only(top:5,bottom: 20,left: 25,right: 25),
           child: Column(children: [
            Row(children: [
               Container(              
              padding: const EdgeInsets.only(left:25,right: 25,top: 5,bottom: 5),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(                
                  color:buttoncolor, borderRadius: BorderRadius.circular(25),
                 
                  ),
              child: const Center(
                child: Text(
                  "All",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
             Container(              
              padding: const EdgeInsets.only(left:25,right: 25,top: 5,bottom: 5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(                
                  color:white, borderRadius: BorderRadius.circular(25),
                   boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    )]
                  
                  ),
              child: Center(
                child: Text(
                  "Income",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
             Container(              
              padding: const EdgeInsets.only(left:25,right: 25,top: 5,bottom: 5),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(                
                  color:white, borderRadius: BorderRadius.circular(25),
                   boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    )]
                  
                  ),
              child: Center(
                child: Text(
                  "Expense",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            ],)
           ],),
         ),
        const Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: mainFontColor,
                    )),
               
              ],
            ),
          ),

           Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 25,
                          right: 25,
                        ),
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
                              top: 10, bottom: 20, right: 20, left: 20),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                height: 50,
                                // decoration: BoxDecoration(
                                //   color: arrowbgColor,
                                //   borderRadius: BorderRadius.circular(15),
                                //   // shape: BoxShape.circle
                                // ),
                                child: Center(
                                    child: Icon(Icons.payment,color: mainFontColor,)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: (size.width - 90) * 0.7,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Payment",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Payment from Andrea",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: black.withOpacity(0.5),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ]),
                                ),
                              ),
                            const  Expanded(
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "\$30.00",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: black),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                              top: 20, bottom: 10, right: 20, left: 20),
                  child:
                    Column(
                        children:[
                           Container(
                              padding: const EdgeInsets.only(left:25,right: 25,top: 5,bottom: 5),
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                          width: 325,
                                          height: 325,
                                          decoration: const BoxDecoration(
                                              
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://res.cloudinary.com/dic3o7vzw/image/upload/v1673927487/avatars/cropped_uxagcn.jpg"),
                                                  fit: BoxFit.cover)),
                                        ),
                              ),
                        ]
                      ),
                    
                ),
                 Container(
              
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all( 25),
              decoration: BoxDecoration(
                
                  color:buttoncolor, borderRadius: BorderRadius.circular(25)),
              child: const Center(
                child: Text(
                  "See Details",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
        ],
      ),
    ));
  }
}
