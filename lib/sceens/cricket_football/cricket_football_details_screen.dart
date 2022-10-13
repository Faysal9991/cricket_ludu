import 'package:beting_app/Helper/fbase.dart';
import 'package:beting_app/models/cricket_football.dart';
import 'package:beting_app/provider/cricket_provider.dart';
import 'package:beting_app/util/text.styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CricketFootballDetailsScreen extends StatelessWidget {
  final CricketFootballModel cricketFootballModel;
  FireBase fireBase = FireBase();

  CricketFootballDetailsScreen(this.cricketFootballModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<CricketProvider>(context, listen: false)
        .changeStatus(cricketFootballModel.beatStatus == 0 ? "Active" : "Beat End", isFirstTime: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('${cricketFootballModel.teamA} VS ${cricketFootballModel.teamB}'),
      ),
      body: Consumer<CricketProvider>(
        builder: (context, crickProvider, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: DropdownButton(
                  value: crickProvider.selectStatus,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: crickProvider.dataLists.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue == 'Beat End') {
                      cricketFootballModel.beatStatus = 1;
                      crickProvider.changeStatus(newValue!);
                    } else if (newValue == 'Beat finished With Team A') {
                      cricketFootballModel.beatStatus = 2;
                      crickProvider.changeStatus(newValue!);
                      for (var element in cricketFootballModel.teamAUsers!) {
                        int amount = (element.amount!.toDouble() * cricketFootballModel.betRateA!).toInt();
                        int finalAmount = (amount - amount * 0.07).toInt();
                        fireBase.addMoneyAfterBeatFinishedCricket(element.userID!, finalAmount);
                      }
                    } else if (newValue == 'Beat finished With Team B') {
                      cricketFootballModel.beatStatus = 2;
                      crickProvider.changeStatus(newValue!);
                      for (var element in cricketFootballModel.teamBUsers!) {
                        int amount = (element.amount!.toDouble() * cricketFootballModel.betRateB!).toInt();
                        int finalAmount = (amount - (amount * 0.07)).toInt();
                        fireBase.addMoneyAfterBeatFinishedCricket(element.userID!, finalAmount);
                      }
                    } else {
                      cricketFootballModel.beatStatus = 0;
                      crickProvider.changeStatus(newValue!);
                    }
                    fireBase.updateGameStatus(cricketFootballModel);
                  },
                ),
              ),
              Text(
                'Team ${cricketFootballModel.teamA} Total Members: (${cricketFootballModel.teamAUsers!.length})',
                style: latoStyle500Medium.copyWith(fontSize: 17),
              ),
              SizedBox(height: 10),
              Text(
                'Team ${cricketFootballModel.teamB} Total Members: (${cricketFootballModel.teamBUsers!.length})',
                style: latoStyle500Medium.copyWith(fontSize: 17),
              ),
              SizedBox(height: 15),
              Expanded(
                child: ListView(
                  children: [
                    Text('Team ${cricketFootballModel.teamA} Members Lists: (ID)', style: latoStyle600SemiBold.copyWith(fontSize: 17)),
                    SizedBox(height: 15),
                    ListView.builder(
                        itemCount: cricketFootballModel.teamAUsers!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Text(
                              cricketFootballModel.teamAUsers![index].userID!.replaceRange(0, 6, "") +
                                  "   (${cricketFootballModel.teamAUsers![index].amount})",
                              style: latoStyle400Regular);
                        }),
                    SizedBox(height: 20),
                    Text('Team ${cricketFootballModel.teamB} Members Lists: (ID)', style: latoStyle600SemiBold.copyWith(fontSize: 17)),
                    SizedBox(height: 15),
                    ListView.builder(
                        itemCount: cricketFootballModel.teamBUsers!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Text(
                              cricketFootballModel.teamBUsers![index].userID!.replaceRange(0, 6, "") +
                                  " (${cricketFootballModel.teamBUsers![index].amount})",
                              style: latoStyle400Regular);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
