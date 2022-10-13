import 'package:beting_app/Helper/fbase.dart';
import 'package:beting_app/sceens/cricket_football.dart';
import 'package:beting_app/sceens/ludu.dart';
import 'package:beting_app/sceens/screen_sort_uplod.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Helper/style.dart';
import '../../models/profilemodel.dart';
import '../rechargepage.dart';
import '../withdrawscreen.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  FireBase fireBase = FireBase();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
        body: Padding(
          padding: EdgeInsets.only(
            left: width * 0.03,
            top: height * 0.02,
            right: width * 0.03,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * 0.25,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(children: [
                    SizedBox(
                        height: height * 0.21,
                        width: width,
                        child: Image.asset(
                          "assets/ludubord.jpg",
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                        height: height * 0.04,
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {
                              Get.to(LuduScreen());
                            },
                            child: Text(
                              "40 Match found ",
                              style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )))
                  ]),
                ),

                /* football...............*/

                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.25,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(children: [
                    Row(
                      children: [
                        SizedBox(
                            height: height * 0.21,
                            width: width * 0.47,
                            child: Image.asset(
                              "assets/crocket.png",
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                            height: height * 0.21,
                            width: width * 0.47,
                            child: Image.asset(
                              "assets/football.jpg",
                              fit: BoxFit.cover,
                            )),
                      ],
                    ),
                    SizedBox(
                        height: height * 0.04,
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {
                               Get.to(CricketFootballScreen());
                            },
                            child: Text(
                              "Match found 40",
                              style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ))),
                  ]),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: height * 0.05,
                      width: width * 0.3,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shadowColor: Colors.white,
                              shape: const StadiumBorder()),
                          onPressed: () {
                            Get.to(const RechargeScreen());
                          },
                          child: Text(
                            "Deposit",
                            style: GoogleFonts.lato(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    SizedBox(
                      height: height * 0.05,
                      width: width * 0.3,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shadowColor: Colors.white,
                              shape: const StadiumBorder()),
                          onPressed: () {},
                          child: Text(
                            "ALL TRX",
                            style: GoogleFonts.lato(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    SizedBox(
                      height: height * 0.05,
                      width: width * 0.3,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shadowColor: Colors.white,
                              shape: const StadiumBorder()),
                          onPressed: () {
                            Get.to(WithDrawRequest());
                          },
                          child: Text(
                            "Withdraw",
                            style: GoogleFonts.lato(color: Colors.white),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  height: height * 0.05,
                  width: width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shadowColor: Colors.white,
                          shape: const StadiumBorder()),
                      onPressed: () {
                        Get.to(ScreenSortUplod());
                      },
                      child: Text(
                        "Screenshot Upload",
                        style: GoogleFonts.lato(color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: height * 0.05,
                      width: width * 0.46,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shadowColor: Colors.white,
                              shape: const StadiumBorder()),
                          onPressed: () {},
                          child: Text(
                            "Reffer & earn",
                            style: GoogleFonts.lato(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    SizedBox(
                      height: height * 0.05,
                      width: width * 0.46,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shadowColor: Colors.white,
                              shape: const StadiumBorder()),
                          onPressed: () {},
                          child: Text(
                            "Match Result",
                            style: GoogleFonts.lato(color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
