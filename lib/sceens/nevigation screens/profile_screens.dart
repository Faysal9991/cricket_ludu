
import 'package:beting_app/sceens/login_signup/login_signup/login_screen.dart';
import 'package:beting_app/sceens/login_signup/uplod_scrrensort.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Helper/fbase.dart';
import '../../Helper/style.dart';

import '../../models/profilemodel.dart';
import '../../widget/login_widget.dart';
import '../rechargepage.dart';
import '../withdrawscreen.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
  FireBase fireBase = FireBase();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "playerZone",
            style: GoogleFonts.aBeeZee(color: Colors.white),
          ),
          backgroundColor: Style.backgroundColor,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(FontAwesomeIcons.bell))
          ]),
      backgroundColor: Style.backgroundColor3,
      body: StreamBuilder<ProfileModel>(
        stream: fireBase.myProfileStream(),
        builder: (context, snap) {
          return snap.hasData?Padding(
            padding: EdgeInsets.only(left: width * 0.05, top: height * 0.02),
            child: Column(
              children: [
                Container(
                  height: height * 0.5,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: height * 0.06,
                          child: CircleAvatar(
                              radius: height * 0.05,
                              child: Icon(
                                Icons.person,
                                size: height * 0.05,
                              )),
                        ),
                      ),
                      Text(
                        "Name: ${snap.data!.name}",
                        style: GoogleFonts.actor(color: Colors.black87),
                      ),
                      Text(
                        "Emai: ${snap.data!.mail}",
                        style: GoogleFonts.actor(color: Colors.black87),
                      ),
                      Text(
                        "UID or refarel id: ${snap.data!.uid}",
                        style: GoogleFonts.actor(color: Colors.black87),
                      ),
                      Row(
                        children: [
                           SizedBox(width: width * 0.03),
                          SizedBox(
                            width: width*0.4,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                              ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                            RechargeScreen()));
                                },
                                child:  Text("Recarge",
                                style: GoogleFonts.lato(fontSize: 12,
                                fontWeight: FontWeight.bold),)),
                          ),
                          SizedBox(width: width * 0.03),
                          SizedBox(
                            width: width*0.4,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                              ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WithDrawRequest()));
                                },
                                child: const Text("withdraw")),
                          ),

                        ],
                      ),
                      Row(
                        children: [
                           SizedBox(width: width * 0.03),
                          SizedBox(  width: width*0.4,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                              ),
                                onPressed: () {}, child: const Text("Reffer&ern")),
                          ),
                          SizedBox(width: width * 0.03),
                          SizedBox(
                              width: width*0.4,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                              ),
                            onPressed: () {}, child: const Text("History")))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            onPressed: () {
                               Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UpoldScreenSort()));
                            },
                            child:
                           Text("Uplod your wining Screen sort ang get Pyment",style: GoogleFonts.lato(fontSize: 12),)),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height*0.01,),
                  Container(
                        height: height * 0.2,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius: BorderRadius.circular(5)),
                        child: StreamBuilder<ProfileModel>(
                          stream: fireBase.myProfileStream(),
                          builder: (context, snap) {
                            return snap.hasData?LoginWidget(
                              h: height * 0.02,
                              w: width * 0.9,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: (){  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WithDrawRequest()));
                                },
                                          child: CircleAvatar(radius: width*0.13,
                                          backgroundColor: const Color(0xff54BA4F),

                                            child: CircleAvatar(
                                              radius: width*0.11,
                                              backgroundColor: const Color(0xffCEDBD2),
                                              child: Padding(
                                           padding:  EdgeInsets.only(top: height*0.036),
                                           child: Column(

                                             children: [
                                               Text("Total win",style: GoogleFonts.lato(fontSize: 14,color: Colors.black,),),
                                               Text("${snap.data!.totalWin} BDT",style: GoogleFonts.lato(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.green),)
                                             ],
                                           ),
                                              ),),
                                              ),
                                        ),
                                            SizedBox(width: width*0.01,),
                                        InkWell(
                                          onTap: () {
                                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RechargeScreen()));
                                },

                                          child: CircleAvatar(radius: width*0.13,
                                                                  backgroundColor: Colors.red,

                                                                    child: CircleAvatar(
                                                                      radius: width*0.11,
                                                                      backgroundColor: const Color(0xffFBECEC),
                                                                      child: Padding(
                                           padding:  EdgeInsets.only(top: height*0.036),
                                           child: Column(

                                             children: [
                                               Text("Total Losse",style: GoogleFonts.lato(fontSize: 14,color: Colors.black),),
                                               Text("${snap.data!.totalLoss} BDT",style: GoogleFonts.lato(fontSize: 10,fontWeight: FontWeight.bold,color:Colors.red),)
                                             ],
                                           ),
                                                                      ),),
                                                                      ),
                                        ),
                                                                    SizedBox(width: width*0.04,),
                                        CircleAvatar(radius: width*0.16,
                                        backgroundColor: Colors.teal,

                                          child: InkWell(
                                            onTap: (){  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RechargeScreen()));},
                                            child: CircleAvatar(
                                              radius: width*0.14,
                                              backgroundColor: const Color(0xffCEDBD2),
                                              child: Padding(
                                                padding:  EdgeInsets.only(top: height*0.036),
                                                child: Column(

                                                  children: [
                                                    Text("Balance",style: GoogleFonts.lato(fontSize: 14),),
                                                    Text("${snap.data!.totalBalance} BDT",style: GoogleFonts.lato(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.green),)
                                                  ],
                                                ),
                                              ),),
                                          ),
                                            ),

                                       ],
                                    ),
                                  ),
                                  Positioned(
                                    top: height*0.08,
                                    left: width*0.23,
                                    child: const CircleAvatar(
                                      radius: 12,
                                        backgroundColor: Colors.green,
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.white,
                                        child: Icon(FontAwesomeIcons.upLong,size: 15,color: Colors.green,)),
                                    ),
                                  )
                                ],
                              ),
                            ):Center(child: CircularProgressIndicator(),);
                          }
                        ),
                      ),

     SizedBox(
                  height: height*0.05,
                  width: width*0.9,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange
                    ),
                    onPressed: (){
                       Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginScreen()));
                    }, child: const Text("log out")),
                )
              ],
            ),
          ):Center(child: Text("Loading"),);
        }
      ),
    );
  }
}