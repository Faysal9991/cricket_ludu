

import 'package:beting_app/Helper/fbase.dart';
import 'package:beting_app/models/withdrawmodel.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../models/mainadminmodel.dart';

class WithDrawRequest extends StatefulWidget {
  const WithDrawRequest({Key? key}) : super(key: key);

  @override
  State<WithDrawRequest> createState() => _WithDrawRequestState();
}

class _WithDrawRequestState extends State<WithDrawRequest> {
  FireBase fireBase = FireBase();
  TextEditingController amount = TextEditingController();
  TextEditingController phone = TextEditingController();

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("Withdraw",
                style: GoogleFonts.oleoScript(color: Colors.white)),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
               Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                     InkWell(
                    onTap: () {
                      showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Bkash Deposit option"),
                  
                    actions:[
                         Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(height: height*0.03,),
                                Text("",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.bold),),
                               SizedBox(height: height*0.03,),
                                Row(
                                  children: [
                                      Text("মিনিমাম withdraw ৳200",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                      Container(
                                        height: height*0.03,
                                        width: width*0.4,
                                      decoration: BoxDecoration(  color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                        child:  Padding(
                                          padding:  EdgeInsets.only(top: height*0.01),
                                          child: TextField(
                                            controller: amount,
                                            inputFormatters: [
        LengthLimitingTextInputFormatter(11),
      ],
                                            textAlign: TextAlign.center,
                                             style: const TextStyle(color: Colors.black),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Entre ammount",
                                              hintStyle: TextStyle(color: Colors.black)
                                            ),
              
                                          ),
                                        ),
                                      )
                                  ],
                                ),
          
          
          SizedBox(height: height*0.03,),
          
                                  Row(
                                  children: [
                                      Text("আপনার নম্বরটি  দিন।",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                      Container(
                                        height: height*0.03,
                                        width: width*0.4,
                                         decoration: BoxDecoration(  color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                        child:  Padding(
                                           padding:  EdgeInsets.only(top: height*0.01),
                                          child: TextField(
                                            controller: phone,
                                              inputFormatters: [
        LengthLimitingTextInputFormatter(15),
      ],
                                            textAlign: TextAlign.center,
                                             style: const TextStyle(color: Colors.black),
                                            decoration: const InputDecoration(
                                              hintText: "Entre number",
                                              hintStyle: TextStyle(color: Colors.black)
                                            ),
              
                                          ),
                                        ),
                                      )
                                  ],
                                )
                  ,
             
          
                  ElevatedButton(onPressed: ()async{
                    WithdrawModel withdraw = WithdrawModel(uid: fireBase.cu!.uid, amount: double.parse(amount.text.trim()),number: phone.text.trim());
                    await fireBase.withdrawRequest(withdraw);
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Withdraw request added")));


                  }, child: const Text("Submit"))
                  
                              ],
                            ),
                          ),
                        

                    ],
                  ),
                );
                    },
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                              image: AssetImage("assets/bkash.png"),
                              fit: BoxFit.cover)),
                    ),
                  ),
               
               
               
               /*.................................nogod.......................*/





                 InkWell(
                    onTap: () {
                      showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Nogod Deposit option"),
                  
                    actions:[
                         Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(height: height*0.03,),
                                Text("",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.bold),),
                               SizedBox(height: height*0.03,),
                                Row(
                                  children: [
                                      Text("মিনিমাম withdraw ৳20",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                      Container(
                                        height: height*0.03,
                                        width: width*0.4,
                                      decoration: BoxDecoration(  color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                        child:  Padding(
                                          padding:  EdgeInsets.only(top: height*0.01),
                                          child: TextField(
                                            inputFormatters: [
        LengthLimitingTextInputFormatter(11),
      ],
                                            textAlign: TextAlign.center,
                                             style: const TextStyle(color: Colors.black),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Entre ammount",
                                              hintStyle: TextStyle(color: Colors.black)
                                            ),
              
                                          ),
                                        ),
                                      )
                                  ],
                                ),
          
          
          SizedBox(height: height*0.03,),
          
                                  Row(
                                  children: [
                                      Text("আপনার নম্বরটি  দিন।",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                      Container(
                                        height: height*0.03,
                                        width: width*0.4,
                                         decoration: BoxDecoration(  color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                        child:  Padding(
                                           padding:  EdgeInsets.only(top: height*0.01),
                                          child: TextField(
                                              inputFormatters: [
        LengthLimitingTextInputFormatter(15),
      ],
                                            textAlign: TextAlign.center,
                                             style: const TextStyle(color: Colors.black),
                                            decoration: const InputDecoration(
                                              hintText: "Entre number",
                                              hintStyle: TextStyle(color: Colors.black)
                                            ),
              
                                          ),
                                        ),
                                      )
                                  ],
                                )
                  ,
             
          
             
                  ElevatedButton(onPressed: (){}, child: const Text("Submit"))
                  
                              ],
                            ),
                          ),
                        

                    ],
                  ),
                );
                    },
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                         ),
                         child: SvgPicture.asset("assets/nogod.svg"),
                    ),
                  )
                
               
               
                ],
               ),
                
                
                SizedBox(height: height*0.05,),
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                     InkWell(
                    onTap: () {
                      showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Rocket Deposit option"),
                  
                    actions:[
                         Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                   
                               SizedBox(height: height*0.03,),
                                Row(
                                  children: [
                                      Text("মিনিমাম withdraw ৳20",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                      Container(
                                        height: height*0.03,
                                        width: width*0.4,
                                      decoration: BoxDecoration(  color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                        child:  Padding(
                                          padding:  EdgeInsets.only(top: height*0.01),
                                          child: TextField(
                                            inputFormatters: [
        LengthLimitingTextInputFormatter(11),
      ],
                                            textAlign: TextAlign.center,
                                             style: const TextStyle(color: Colors.black),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Entre ammount",
                                              hintStyle: TextStyle(color: Colors.black)
                                            ),
              
                                          ),
                                        ),
                                      )
                                  ],
                                ),
          
          
          SizedBox(height: height*0.03,),
          
                                  Row(
                                  children: [
                                      Text("আপনার নম্বরটি  দিন।",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                      Container(
                                        height: height*0.03,
                                        width: width*0.4,
                                         decoration: BoxDecoration(  color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                        child:  Padding(
                                           padding:  EdgeInsets.only(top: height*0.01),
                                          child: TextField(
                                              inputFormatters: [
        LengthLimitingTextInputFormatter(15),
      ],
                                            textAlign: TextAlign.center,
                                             style: const TextStyle(color: Colors.black),
                                            decoration: const InputDecoration(
                                              hintText: "Entre number",
                                              hintStyle: TextStyle(color: Colors.black)
                                            ),
              
                                          ),
                                        ),
                                      )
                                  ],
                                )
                  ,
           
          SizedBox(height: height*0.03,),
          
          
                  ElevatedButton(onPressed: (){}, child: const Text("Submit"))
                  
                              ],
                            ),
                          ),
                        

                    ],
                  ),
                );
                    },
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                       ),
                        child: SvgPicture.asset("assets/roket.svg"),
                    ),
                  ),
               
               
               
               /*.................................Upay.......................*/





                 InkWell(
                    onTap: () {
                      showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Upay Deposit option"),
                  
                    actions:[
                         Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(height: height*0.03,),
                                Text("",style: GoogleFonts.lato(color: Colors.white,fontSize: 9,fontWeight: FontWeight.bold),),
                               SizedBox(height: height*0.03,),
                                Row(
                                  children: [
                                      Text("মিনিমাম withdraw ৳20",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                      Container(
                                        height: height*0.03,
                                        width: width*0.4,
                                      decoration: BoxDecoration(  color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                        child:  Padding(
                                          padding:  EdgeInsets.only(top: height*0.01),
                                          child: TextField(
                                            inputFormatters: [
        LengthLimitingTextInputFormatter(11),
      ],
                                            textAlign: TextAlign.center,
                                             style: const TextStyle(color: Colors.black),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Entre ammount",
                                              hintStyle: TextStyle(color: Colors.black)
                                            ),
              
                                          ),
                                        ),
                                      )
                                  ],
                                ),
          
          
          SizedBox(height: height*0.03,),
          
                                  Row(
                                  children: [
                                      Text("আপনার নম্বরটি  দিন।",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                      Container(
                                        height: height*0.03,
                                        width: width*0.4,
                                         decoration: BoxDecoration(  color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                        child:  Padding(
                                           padding:  EdgeInsets.only(top: height*0.01),
                                          child: TextField(
                                              inputFormatters: [
        LengthLimitingTextInputFormatter(15),
      ],
                                            textAlign: TextAlign.center,
                                             style: const TextStyle(color: Colors.black),
                                            decoration: const InputDecoration(
                                              hintText: "Entre number",
                                              hintStyle: TextStyle(color: Colors.black)
                                            ),
              
                                          ),
                                        ),
                                      )
                                  ],
                                )
                  ,
            
                  ElevatedButton(onPressed: (){}, child: const Text("Submit"))
                  
                              ],
                            ),
                          ),
                        

                    ],
                  ),
                );
                    },
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                         ),
                         child: Image.network("https://sgp1.digitaloceanspaces.com/cosmosgroup/news/6986535_New%20Project%20(98).jpg"),
                    ),
                  )
                
               
               
                ],
               )
               
                ],
              ),
            ),
          )),
    );
  }
}
