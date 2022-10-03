import 'package:beting_app/Helper/fbase.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Helper/style.dart';
import '../models/gamemodel.dart';
import '../models/profilemodel.dart';
import '../widget/beting_card.dart';

class CricketFootballScreen extends StatefulWidget {
      CricketFootballScreen({super.key});

  @override
  State<CricketFootballScreen> createState() => _CricketFootballScreenState();
}

class _CricketFootballScreenState extends State<CricketFootballScreen> {
  final FireBase fireBase = FireBase();

  ProfileModel profileModel = ProfileModel();

  @override
  void initState() {
    // TODO: implement initState
    fireBase.myProfile().then((value) {
      setState(() {
        profileModel=value;
      });
    });
    super.initState();
  }


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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: width * 0.35,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.green,
                          shape: const StadiumBorder()),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FutureBuilder<ProfileModel>(
                              future: fireBase.myProfile(),
                              builder: (context, snap) {
                                return snap.hasData?Text(
                                  "${snap.data!.totalBalance}",
                                  style: GoogleFonts.lato(color: Colors.black),
                                ):Center(child: CircularProgressIndicator(),);
                              }
                          ),
                          const Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.black,
                            size: 8,
                          )
                        ],
                      )),
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(FontAwesomeIcons.bell))
            ]),
        backgroundColor: Style.backgroundColor,
        body:
       Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: StreamBuilder<List<GameModel>>(
                            stream: fireBase.allCricket(),
                            builder: (context, snap) {
                              return snap.hasData?ListView.builder(
                                  itemCount: snap.data!.length,
                                  itemBuilder: (context, index) {
                                    GameModel game = snap.data![index];
                                    String game1 = game.name!.split("-").first;
                                    String game2 = game.name!.split("-")[1];

                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
      height: height * 0.14,
      width: width,
      decoration: BoxDecoration(
          color: const Color(0xffEBFCED),
          borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Text("$game1 vs $game2",style: GoogleFonts.alike(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
                ),),
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
               Padding(
                 padding:  EdgeInsets.only(left: width*0.04),
                 child: Text("Bet Rate:",style: GoogleFonts.alike(
                  fontSize: 15,
                  color: Colors.black26,

                  )),
               ),
               Text("${game.entryFee}",style: GoogleFonts.alike(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                ))
                      ],
                    ),


                  ],
                ),
                Container(
                  height: height*0.02,
                  width: width*0.003,
                  color:Colors.teal,
                ),
                 Column(
                  children: [
                    Row(
                      children: [
               Text("Bet Rate:",style: GoogleFonts.alike(
                fontSize: 15,
                color: Colors.black26,

                )),
               Padding(
                padding:  EdgeInsets.only(right: width*0.04),
                 child: Text("${game.entryFee}",style: GoogleFonts.alike(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  )
                 ),
               )
                      ],
                    ),

                  ],
                ),
              ],
             ),
              Text("Admin charge 7% from frofit amount",style: GoogleFonts.alike(
                fontSize: 10,
                color: Colors.black,
                fontWeight: FontWeight.w300,
                )),
              SizedBox(
                  width: width,
                  height: height*0.04,
                  child: ElevatedButton(onPressed:game.slotoneusers.contains(profileModel.uid)||game.slottwousers.contains(profileModel.uid)?null: (){
                    TextEditingController selected = TextEditingController();

                                        showMaterialModalBottomSheet(
                                              expand: true,
                                             context: context,
                                             builder: (BuildContext context) {

                                               return StatefulBuilder(
                                                 builder: (tcontext, st) {
                                                   bool gamechose1=true;
                                                   return Container(
                                                     height: height*0.4,
                                                     width: width*0.9,
                                                     color: Colors.black,
                                                     child: Column(
                                                       children: [
                                                         SizedBox(height: height*0.03,),
                                                         Text("Your ammount",style: GoogleFonts.lato(color: Colors.white),),
                                                         Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: Container(

                                                             color: Colors.white,
                                                             width: width*4,
                                                             height: height*0.04,
                                                             child: Center(child: Text("${game.entryFee}")),

                                                           ),
                                                         ),
                                                         Text("Potential wingings \$50.9",style: GoogleFonts.lato(color: Colors.white),),
                                                         Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: Container(

                                                             color: Colors.white,
                                                             width: width,
                                                             height: height*0.1,
                                                             child: Column(
                                                               children: [
                                                                 TextField(
                                                                   controller: selected,
                                                                   decoration: InputDecoration(
                                                                     hintText: "Input team serial number from below",
                                                                     border: OutlineInputBorder(

                                                                     )
                                                                   ),
                                                                 ),
                                                                 Row(
                                                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                   children: [
                                                                     Row(
                                                                       children: [

                                                                         Text("1.$game1", style: TextStyle(
                                                                             fontWeight: FontWeight.bold
                                                                         ),)
                                                                       ],
                                                                     ),
                                                                     Row(
                                                                         children: [

                                                                           Text("2.$game2", style: TextStyle(
                                                                               fontWeight: FontWeight.bold
                                                                           ),)
                                                                         ],
                                                                       ),

                                                                   ],
                                                                 ),
                                                               ],
                                                             )
                                                             /*TextField(
                                                           decoration: InputDecoration(
                                                            hintText: "your team name"
                                                           ),
                                                         )*/,
                                                           ),
                                                         ),
                                                         ElevatedButton(onPressed: profileModel.totalBalance!<game.entryFee!?null: ()async{

                                                           await fireBase.joinGameCricket(game, profileModel, selected.text.trim()=="1"?1:2);
                                                           Navigator.of(context).pop();
                                                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Bet added')));
                                                         }, child: Text("Submit and play")),
                                                         Text("Thank you for Playing games" ,style: GoogleFonts.ebGaramond(color: Colors.white,fontWeight: FontWeight.bold,fontSize:height*0.04),)


                                                       ],
                                                     ),
                                                   );
                                                 }
                                               );
                                             }
                                           );



                  }, child: Text("Want to bet")))
             ],
          ),
          )
                                    );
                                  }):Center(child: CircularProgressIndicator(),);
                            }
                          )),



















        );
  }
}