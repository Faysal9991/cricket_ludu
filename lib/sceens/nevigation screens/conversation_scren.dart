import 'package:beting_app/Helper/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class CoverstionScreen extends StatelessWidget {
  const CoverstionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Style.backgroundColor3,
      appBar:AppBar(
              title: Text(
                "playerZone",
                style: GoogleFonts.aBeeZee(color: Colors.white),
              ),
              backgroundColor: Style.backgroundColor,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.bell))
              ]),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height*0.3,),
                  Center(child: Text("Click below And Report")),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width ,
                      child: ElevatedButton(
                           style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        onPressed: (){
                           showMaterialModalBottomSheet(
                                               context: context,
                                               builder: (context) => Container(
                                                 height: height*0.7,
                                                 width: width*0.9,
                                                 color: Colors.black,
                                                 child: Column(
                                                   children: [
                                                    Text(" Select your Problm"),
                                                     Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: Text("Recarge problm",style: GoogleFonts.mPlus1(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w700),),),
                                 Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: Text("Withdraw problem",style: GoogleFonts.mPlus1(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w700),),),
                                                                            Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: Text("Forget to Take Screensort",style: GoogleFonts.mPlus1(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w700),),),
                                                                            Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: Text("login problm",style: GoogleFonts.mPlus1(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w700),),),
                                                       Container(
                                                        height: height*0.2,
                                                        width: width*0.9,
                                                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: TextField(
                                                            style: TextStyle(color: Colors.black),
                                                            decoration:  InputDecoration(
                                                              helperText: "input your Facebook Id link \n and describe your problm.",
                                                              helperStyle: GoogleFonts.lato(color: Colors.black,fontSize: 20),
                                                              hintStyle: GoogleFonts.lato(color: Colors.black)

                                                            ),
                                                           ),
                                                         ),
                                                       ),
                                                       ElevatedButton(onPressed: (){}, child: Text("send Report")),
                                                     
                                                     SizedBox(height: height*0.1,),



                                                     Text("We will response soon" ,style: GoogleFonts.ebGaramond(color: Colors.white,fontWeight: FontWeight.bold,fontSize:height*0.04),)


                                                   ],
                                                 ),
                                               ),
                                             );
                        }, child: Text("Report your problem")),
                    ),
                  )
                ],
              ),
    );
  }
}
