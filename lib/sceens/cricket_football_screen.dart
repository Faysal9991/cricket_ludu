import 'package:beting_app/Helper/fbase.dart';
import 'package:beting_app/Helper/random_helper.dart';
import 'package:beting_app/models/cricket_football.dart';
import 'package:beting_app/provider/cricket_provider.dart';
import 'package:beting_app/sceens/cricket_football/cricket_footbal_screen.dart';
import 'package:beting_app/sceens/cricket_football/cricket_football_details_screen.dart';
import 'package:beting_app/util/text.styles.dart';
import 'package:beting_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Helper/style.dart';
import '../models/profilemodel.dart';

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
        profileModel = value;
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
          title: Text("playerZone", style: GoogleFonts.aBeeZee(color: Colors.white)),
          backgroundColor: Style.backgroundColor,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: width * 0.35,
                child: Consumer<CricketProvider>(
                    builder: (context, cricketProvider, child) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, shadowColor: Colors.green, shape: const StadiumBorder()),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FutureBuilder<ProfileModel>(
                                future: fireBase.myProfile(),
                                builder: (context, snap) {
                                  if (snap.hasData) {
                                    cricketProvider.changeUserProfile(snap.data!);

                                    return Text("${snap.data!.totalBalance}", style: GoogleFonts.lato(color: Colors.black));
                                  }
                                  return Center(child: CircularProgressIndicator());
                                  // return snap.hasData
                                  //     ? Text("${snap.data!.totalBalance}", style: GoogleFonts.lato(color: Colors.black))
                                  //     : const Center(child: CircularProgressIndicator());
                                }),
                            const Icon(FontAwesomeIcons.plus, color: Colors.black, size: 8)
                          ],
                        ))),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddCricketFootballScreen()));
                },
                icon: const Icon(FontAwesomeIcons.bell))
          ]),
      backgroundColor: Style.backgroundColor,
      body: Consumer<CricketProvider>(
        builder: (context, cricketProvider, child) => Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: StreamBuilder<List<CricketFootballModel>>(
                stream: fireBase.allCricketFootball(),
                builder: (context, snap) {
                  return snap.hasData
                      ? ListView.builder(
                          itemCount: snap.data!.length,
                          itemBuilder: (context, index) {
                            CricketFootballModel game = snap.data![index];

                            return game.beatStatus == 2
                                ? SizedBox.shrink()
                                : InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => CricketFootballDetailsScreen(game)));
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: width,
                                          decoration: BoxDecoration(color: const Color(0xffEBFCED), borderRadius: BorderRadius.circular(8)),
                                          child: Column(
                                            children: [
                                              Text(
                                                "${game.teamA} vs ${game.teamB}",
                                                style: GoogleFonts.alike(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(left: width * 0.04),
                                                              child: Text("Bet Rate: ",
                                                                  style: GoogleFonts.alike(fontSize: 15, color: Colors.black26)),
                                                            ),
                                                            Text(game.betRateA.toString(),
                                                                style: GoogleFonts.alike(
                                                                  fontSize: 15,
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.bold,
                                                                ))
                                                          ],
                                                        ),
                                                        SizedBox(height: 10),
                                                        game.teamAUsers!.contains(profileModel.uid) ||
                                                                game.teamBUsers!.contains(profileModel.uid)
                                                            ? SizedBox.shrink()
                                                            : Center(
                                                                child: ElevatedButton(
                                                                    onPressed: game.beatStatus == 0
                                                                        ? () {
                                                                            openModalBottomSheetForAdd(
                                                                                true,
                                                                                context,
                                                                                cricketProvider.userBalance,
                                                                                game,
                                                                                cricketProvider, (bool status, String message) {
                                                                              ScaffoldMessenger.of(context)
                                                                                  .showSnackBar(SnackBar(content: Text(message)));
                                                                              if (status) {
                                                                                setState(() {});
                                                                              } else {}
                                                                            });
                                                                          }
                                                                        : null,
                                                                    child: Text('Bet Now')))
                                                      ],
                                                    ),
                                                  ),
                                                  Container(height: 50, width: 2, color: Colors.teal),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text("Bet Rate: ",
                                                                style: GoogleFonts.alike(
                                                                  fontSize: 15,
                                                                  color: Colors.black26,
                                                                )),
                                                            Padding(
                                                              padding: EdgeInsets.only(right: width * 0.04),
                                                              child: Text(game.betRateB.toString(),
                                                                  style: GoogleFonts.alike(
                                                                      fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold)),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(height: 10),
                                                        Center(
                                                            child: ElevatedButton(
                                                                onPressed: game.beatStatus == 0
                                                                    ? () {
                                                                        openModalBottomSheetForAdd(
                                                                            false,
                                                                            context,
                                                                            cricketProvider.userBalance,
                                                                            game,
                                                                            cricketProvider, (bool status, String message) {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(SnackBar(content: Text(message)));
                                                                          if (status) {
                                                                            setState(() {});
                                                                          } else {}
                                                                        });
                                                                      }
                                                                    : null,
                                                                child: Text('Bet Now')))
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Text("Admin charge 7% from profit amount",
                                                  style: GoogleFonts.alike(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w300,
                                                  )),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        )),
                                  );
                          })
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                })),
      ),
    );
  }

  void openModalBottomSheetForAdd(bool isSelectA, BuildContext context, int userBalance, CricketFootballModel cricketFootballModel,
      CricketProvider cricketProvider, Function callbackFunction) {
    TextEditingController selected = TextEditingController();
    TextEditingController amount = TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                'Enter Amount for Selected Team: ${isSelectA ? 'A' : 'B'}',
                style: latoStyle500Medium.copyWith(),
                textAlign: TextAlign.center,
              ),
            ),
            content: Container(
              height: 100,
              child: Column(
                children: [
                  CustomTextField(
                      controller: selected, inputType: TextInputType.number, inputAction: TextInputAction.done, hintText: 'Write here'),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        if (userBalance >= int.parse(selected.text)) {
                          String userID = get6DigitNumber() + cricketProvider.profileModel.uid!;
                          UserData userData = UserData(userID: userID, amount: int.parse(selected.text));
                          CricketFootballModel c = cricketFootballModel;
                          bool status = false;
                          if (isSelectA) {
                            for (var element in cricketFootballModel.teamAUsers!) {
                              if (element.userID == userID) {
                                status = true;
                                break;
                              }
                            }

                            if (status) {
                              status = false;
                              userID = get6DigitNumber() + cricketProvider.profileModel.uid!;
                              userData = UserData(userID: userID, amount: int.parse(selected.text));
                              for (var element in cricketFootballModel.teamAUsers!) {
                                if (element.userID == userID) {
                                  status = true;
                                  break;
                                }
                              }

                              if (status) {
                                callbackFunction(false, 'Please try again later, thanks');
                              } else {
                                c.teamAUsers!.add(userData);
                              }
                            } else {
                              c.teamAUsers!.add(userData);
                            }
                          } else {
                            for (var element in cricketFootballModel.teamBUsers!) {
                              if (element.userID == userID) {
                                status = true;
                                break;
                              }
                            }

                            if (status) {
                              status = false;
                              userID = get6DigitNumber() + cricketProvider.profileModel.uid!;
                              userData = UserData(userID: userID, amount: int.parse(selected.text));
                              for (var element in cricketFootballModel.teamBUsers!) {
                                if (element.userID == userID) {
                                  status = true;
                                  break;
                                }
                              }

                              if (status) {
                                callbackFunction(false, 'Please try again later, thanks');
                              } else {
                                c.teamBUsers!.add(userData);
                              }
                            } else {
                              c.teamBUsers!.add(userData);
                            }
                          }

                          fireBase.joinCricketFootballGame(c, cricketProvider.profileModel, int.parse(selected.text)).then((value) {
                            if (value) {
                              callbackFunction(true, 'Bit Successfully added');
                            }
                          });
                        } else {
                          callbackFunction(false, 'Please Recharge');
                        }

                        Navigator.of(context).pop();
                      },
                      child: Text('Submit?'))
                ],
              ),
            ),
          );
        });
  }
}
