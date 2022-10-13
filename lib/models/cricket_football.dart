class CricketFootballModel {
  String? matchID;
  String? teamA;
  String? teamB;
  double? betRateA;
  double? betRateB;
  String? addedTime;
  String? start;
  String? end;
  List<UserData>? teamAUsers = [];
  List<UserData>? teamBUsers = [];
  int? winTeamA;
  int? beatStatus;

  CricketFootballModel(
      {this.matchID,
      this.teamA,
      this.teamB,
      this.teamAUsers,
      this.teamBUsers,
      this.addedTime,
      this.betRateA,
      this.betRateB,
      this.start,
      this.winTeamA,
      this.beatStatus,
      this.end});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["matchID"] = matchID;
    map["teamAName"] = teamA;
    map["teamBName"] = teamB;
    map["betRateA"] = betRateA;
    map["betRateB"] = betRateB;
    map["startTime"] = start;
    map["endTime"] = end;
    map["winTeamA"] = winTeamA;
    map["beatStatus"] = beatStatus;
    map["postedTime"] = addedTime;
    if (teamAUsers != null) {
      map['teamAUsers'] = teamAUsers?.map((v) => v.toJson()).toList();
    } else {
      map['teamAUsers'] = [];
    }
    if (teamBUsers != null) {
      map['teamBUsers'] = teamBUsers?.map((v) => v.toJson()).toList();
    } else {
      map['teamBUsers'] = [];
    }
    return map;
  }

  CricketFootballModel.fromJson(Map<String, dynamic> json) {
    matchID = json["matchID"] ?? "";
    teamA = json["teamAName"] ?? "";
    teamB = json["teamBName"] ?? "";
    betRateA = json["betRateA"] ?? 0.0;
    betRateB = json["betRateB"] ?? 0.0;
    winTeamA = json["winTeamA"] ?? 0;
    beatStatus = json["beatStatus"] ?? 0;
    if (json["teamAUsers"] != null) {
      teamAUsers = [];
      json["teamAUsers"].forEach((e) {
        teamAUsers!.add(UserData.fromJson(e));
      });
    } else {
      teamAUsers = [];
    }
    if (json["teamBUsers"] != null) {
      teamBUsers = [];
      json["teamBUsers"].forEach((e) {
        teamBUsers!.add(UserData.fromJson(e));
      });
    } else {
      teamBUsers = [];
    }
    addedTime = json["postedTime"] ?? "";
    start = json["startTime"] ?? "";
    end = json["endTime"] ?? "";
  }
}

class UserData {
  String? userID;
  int? amount;

  UserData({this.userID, this.amount});

  Map<String, dynamic> toJson() => {"userID": userID, "amount": amount};

  UserData.fromJson(Map<String, dynamic> json) {
    userID = json["userID"] ?? "";
    amount = json["amount"] ?? 0;
  }
}
