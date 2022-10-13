
class CricketFootball{
  String? uid;
  String? name;
  String? country1;
  String? country2;
  int? value1;
  int? value2;

  CricketFootball ({

    this.uid,
    this.name,
    this.country1,
    this.country2,
    this.value1,
    this.value2,


  });

  Map<String, dynamic> toJson()=>{
    "uid":uid,
    "name":name,
    "country1":country1,
    "country2":country2,
    "value1":value1,
    "value2":value2,

  };
  CricketFootball.fromJson(Map<String, dynamic> json){
    try {
      uid = json["uid"];
    } catch (e) {}
    try {
      name = json["name"];
    } catch (e) {

    }
    try {
      country1 = json["country1"];
    } catch (e) {

    }
    try {
      country2 = json["country2"];
    } catch (e) {

    }
    try {
      value1 = json["value1"];
    } catch (e) {

    }
    try {
      value2 = json["value12"];
    } catch (e) {

    }


  }
  }
