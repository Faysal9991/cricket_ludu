
import 'dart:ui';

import 'package:beting_app/sceens/login_signup/login_signup/signup_screen.dart';
import 'package:beting_app/widget/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../../../Helper/fbase.dart';
import '../../../bottom_nevigation.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FireBase fireBase = FireBase();
  @override
  Widget build(BuildContext context) {
        final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
    body: Stack(
      children:[


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
                                SizedBox(height: h*0.18,),
                                const Text("স্বাগতম Jade Ai!",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                                SizedBox(height: h*0.06,),
                                const Text("Enter Gmail account",style: TextStyle(color: Color(0xffA5A3A3)),),
                                SizedBox(height: h*0.02,),
                              LoginWidget( h: h*0.06, w: w*0.9,
                              child: TextFormField(
                                controller: email,
                                 decoration: const InputDecoration(

                        contentPadding: EdgeInsets.all(20.0),
                        border: InputBorder.none,
                      
                      ),
                              ),
                              ),
                
                                SizedBox(height: h*0.02,),
                
                            
                                
                                const Text("Enter Password",
                                style:  TextStyle(color: Color(0xffA5A3A3)),),
                                SizedBox(height: h*0.02,),
                                 LoginWidget( h: h*0.06, w: w*0.9,
                              child: TextFormField(
                                controller: password,
                                 decoration: InputDecoration(

                        contentPadding: const EdgeInsets.all(20.0),
                        border: InputBorder.none,
                        suffixIcon: IconButton(onPressed: (){}, 
                        icon: const Icon(Icons.remove_red_eye)
                        )
                      ),
                              ),
                              ),
                            SizedBox(height: h*0.02,),
                                const Text("Forget password",style: TextStyle(color: Color(0xffA5A3A3)),),
                                SizedBox(height: h*0.02,),
                                SizedBox(
                    width: w*0.9,
                    child: ElevatedButton(
                      
                      onPressed: ()async{

                        final x = await fireBase.signinwithemailandpassword(email.text.trim(), password.text.trim());
                        if(x.user!=null){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>NavegationBar()));
                        }else{
                          final massage = SnackBar(content: Text("Email password didn't match"));
                          ScaffoldMessenger.of(context).showSnackBar(massage);

                        }

                      }, child: const Text("Login"))),
                    SizedBox(height: h*0.02,),
                    Row(
                      children: [
                         const Text("You don't have account?",style: TextStyle(color: Color(0xffA5A3A3)),),
                         const Spacer(),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: InkWell(
                            onTap: (){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignUpScreen()));
                            },
                            child: const Text("open a new account",style: TextStyle(color: Colors.white),)),
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
