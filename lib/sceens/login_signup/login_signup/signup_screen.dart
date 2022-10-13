import 'dart:ui';

import 'package:beting_app/bottom_nevigation.dart';
import 'package:flutter/material.dart';
import '../../../Helper/fbase.dart';
import '../../../widget/login_widget.dart';
import 'login_screen.dart';


class SignUpScreen extends StatefulWidget {
   SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
  
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
   TextEditingController name = TextEditingController();
  TextEditingController rafercode = TextEditingController();

  FireBase fireBase = FireBase();

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
          children:[
            // SizedBox(
            //     height: h,
            //     width: w,
            //     child: Image.asset("assets/login.jpg",fit: BoxFit.cover,)),

            Center(
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 24,
                    spreadRadius: 16,
                    color: Colors.black.withOpacity(0.1),
                  )
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                    child: Container(
                      height: h*0.9,
                      width: w,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white.withOpacity(0.1),
                          )),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding:  EdgeInsets.only(left: w*0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: h*0.1,),
                              const Text("Please Fill the  filed and opne new account",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                              SizedBox(height: h*0.06,),

                              SizedBox(height: h*0.02,),
                              LoginWidget( h: h*0.06, w: w*0.9,
                                child: TextFormField(
controller: name,
                                  decoration:  InputDecoration(
                                    hintText: "Enter your full name",
                                    hintStyle: TextStyle(color: Colors.white),
                                    contentPadding: EdgeInsets.all(20.0),
                                    border: InputBorder.none,

                                  ),
                                ),
                              ),

                              SizedBox(height: h*0.02,),
  LoginWidget( h: h*0.06, w: w*0.9,
                                child: TextFormField(
                                  controller: email,
                                  
                                  decoration: InputDecoration(
                  hintText: "Enter your Gmail",
                                    hintStyle: TextStyle(color: Colors.white),
                                      contentPadding: const EdgeInsets.all(20.0),
                                      border: InputBorder.none,
                                    
                                  ),
                                ),
                              ),
                             SizedBox(height: h*0.02,),
                             LoginWidget( h: h*0.06, w: w*0.9,
                                child: TextFormField(
                  controller: rafercode,
                                  decoration: InputDecoration(

                                      hintText: "Refer code",
                                    hintStyle: TextStyle(color: Colors.white),
                                      contentPadding: const EdgeInsets.all(20.0),
                                      border: InputBorder.none,
                                    
                                  ),
                                ),
                              ),
                              SizedBox(height: h*0.02,),
                              LoginWidget( h: h*0.06, w: w*0.9,
                                child: TextFormField(
                                  controller: password,
                                  decoration: InputDecoration(

                                      hintText: "Enter your password",
                                      hintStyle: TextStyle(color: Colors.white),
                                      contentPadding: const EdgeInsets.all(20.0),
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(onPressed: (){},
                                          icon: const Icon(Icons.remove_red_eye)
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(height: h*0.02,),
                             
                              SizedBox(
                                  width: w*0.9,
                                  child: ElevatedButton(
                                      onPressed: ()async{

                                        final x = await fireBase.signUpWithEmailAndPassword(email.text.trim(), password.text.trim(), name.text.trim());
                                        if(rafercode.text.trim()==x.user){

                                        }
                                        if(x.user!=null){
                                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>NavegationBar()));
                                        }
                                      }, child: const Text("Register account"))),
                              SizedBox(height: h*0.02,),
                              Row(
                                children: [
                                  const Text("Do you have account?",style: TextStyle(color: Color(0xffA5A3A3)),),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: (){
                                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                                        },
                                        child: const Text("Login",style: TextStyle(color: Colors.teal),)),
                                  )
                                ],
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: w*0.38,top: h*0.05),
                                child: CircleAvatar(
                                    radius: 17,
                                    backgroundColor: Colors.white,
                                    child: Image.asset("assets/google.png")),
                              )
                            ],
                          ),
                        ),
                      ),

                    ),
                  ),
                ),
              ),
            ),
          ]
      ),

    );
  }
}
