import 'package:beting_app/Helper/date_converter.dart';
import 'package:beting_app/models/profilemodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class CricketProvider with ChangeNotifier {
  Future<String> picDateTime(BuildContext context) async {
    DateTime? dateTime = await showOmniDateTimePicker(
      context: context,
      type: OmniDateTimePickerType.dateAndTime,
      primaryColor: Colors.cyan,
      backgroundColor: Colors.grey[900],
      calendarTextColor: Colors.white,
      tabTextColor: Colors.white,
      unselectedTabBackgroundColor: Colors.grey[700],
      buttonTextColor: Colors.white,
      timeSpinnerTextStyle: const TextStyle(color: Colors.white70, fontSize: 18),
      timeSpinnerHighlightedTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
      is24HourMode: false,
      isShowSeconds: false,
      startInitialDate: DateTime.now(),
      startFirstDate: DateTime(1600).subtract(const Duration(days: 3652)),
      startLastDate: DateTime.now().add(
        const Duration(days: 3652),
      ),
      borderRadius: const Radius.circular(16),
    );

    return DateConverter.localDateToIsoString(dateTime!);
  }

  int userBalance = 0;

  ProfileModel profileModel = ProfileModel();

  changeUserProfile(ProfileModel p) {
    profileModel = p;
    userBalance = p.totalBalance!;
    // notifyListeners();
  }

  List<String> dataLists = ['Active', 'Beat End', 'Beat finished With Team A', 'Beat finished With Team B'];
  String selectStatus = '';

  changeStatus(String value, {bool isFirstTime = false}) {
    selectStatus = value;
    if (!isFirstTime) notifyListeners();
  }
}
