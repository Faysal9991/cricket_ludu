import 'package:beting_app/Helper/date_converter.dart';
import 'package:beting_app/Helper/fbase.dart';
import 'package:beting_app/models/cricket_football.dart';
import 'package:beting_app/provider/cricket_provider.dart';
import 'package:beting_app/util/text.styles.dart';
import 'package:beting_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCricketFootballScreen extends StatelessWidget {
  AddCricketFootballScreen({Key? key}) : super(key: key);

  final TextEditingController teamANameController = TextEditingController();
  final TextEditingController teamBNameController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController betRateAController = TextEditingController();
  final TextEditingController betRateBController = TextEditingController();

  final FocusNode teamANameFocus = FocusNode();
  final FocusNode teamBNameFocus = FocusNode();
  final FocusNode startTimeFocus = FocusNode();
  final FocusNode endTimeFocus = FocusNode();
  final FocusNode betRateAFocus = FocusNode();
  final FocusNode betRateBFocus = FocusNode();
  final FireBase fireBase = FireBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Cricket/ Football')),
      bottomNavigationBar: Consumer<CricketProvider>(
        builder: (context, cricketProvider, child) => SizedBox(
          height: 40,
          child: MaterialButton(
            onPressed: () {
              if (teamANameController.text.isEmpty ||
                  teamBNameController.text.isEmpty ||
                  betRateAController.text.isEmpty ||
                  betRateBController.text.isEmpty ||
                  startTimeController.text.isEmpty ||
                  endTimeController.text.isEmpty) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Please fillup all the field'), backgroundColor: Colors.red));
              } else {
                CricketFootballModel cricketFootballModel = CricketFootballModel(
                    matchID: DateTime.now().microsecondsSinceEpoch.toString(),
                    teamA: teamANameController.text,
                    teamB: teamBNameController.text,
                    teamAUsers: [],
                    teamBUsers: [],
                    betRateA: double.parse(betRateAController.text),
                    betRateB: double.parse(betRateBController.text),
                    start: startTimeController.text,
                    end: endTimeController.text,
                    winTeamA: -1,
                    beatStatus: 0,
                    addedTime: DateConverter.localDateToIsoString(DateTime.now()));

                fireBase.createCricketFootballGame(cricketFootballModel).then((value) {
                  if (value) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Added Successfully'), backgroundColor: Colors.greenAccent));
                    teamANameController.clear();
                    teamBNameController.clear();
                    betRateAController.clear();
                    startTimeController.clear();
                    endTimeController.clear();
                    betRateBController.clear();
                  }
                });
              }
            },
            color: Colors.teal,
            child: Text('Add', style: latoStyle500Medium.copyWith(color: Colors.white, fontSize: 18)),
          ),
        ),
      ),
      body: Consumer<CricketProvider>(
        builder: (context, cricketProvider, child) => ListView(
          padding: const EdgeInsets.all(15),
          children: [
            CustomTextField(
              hintText: 'Write Team A Name',
              focusNode: teamANameFocus,
              nextFocus: teamBNameFocus,
              controller: teamANameController,
              verticalSize: 13,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hintText: 'Write Team B Name',
              focusNode: teamBNameFocus,
              nextFocus: betRateAFocus,
              controller: teamBNameController,
              verticalSize: 13,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hintText: 'Enter Bit Rate for Team A',
              focusNode: betRateAFocus,
              nextFocus: betRateBFocus,
              controller: betRateAController,
              inputType: TextInputType.number,
              verticalSize: 13,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hintText: 'Enter Bit Rate for Team B',
              focusNode: betRateBFocus,
              nextFocus: startTimeFocus,
              controller: betRateBController,
              inputType: TextInputType.number,
              verticalSize: 13,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hintText: 'Start Time',
              focusNode: startTimeFocus,
              nextFocus: endTimeFocus,
              controller: startTimeController,
              inputType: TextInputType.datetime,
              isShowSuffixWidget: true,
              suffixWidget: InkWell(
                  onTap: () {
                    cricketProvider.picDateTime(context).then((String value) {
                      startTimeController.text = value;
                    });
                  },
                  child: const Icon(Icons.calendar_month)),
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hintText: 'End Time',
              focusNode: endTimeFocus,
              controller: endTimeController,
              inputType: TextInputType.datetime,
              isShowSuffixWidget: true,
              suffixWidget: InkWell(
                  onTap: () {
                    cricketProvider.picDateTime(context).then((String value) {
                      endTimeController.text = value;
                    });
                  },
                  child: const Icon(Icons.calendar_month)),
            ),
          ],
        ),
      ),
    );
  }
}
