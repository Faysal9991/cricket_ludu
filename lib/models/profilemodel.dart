class ProfileModel{
  String? uid;
  String? name;
  String? mail;
  double totalWin=0;
  double totalLoss=0;
  int? totalBalance;

  ProfileModel({this.uid, this.mail, this.totalBalance, this.name});
  Map<String, dynamic>toJson()=>{
    "uid":uid,
    "mail":mail,
    "name":name,
    "totalWin":totalWin,
  "totalLoss":totalLoss,
    "totalBalance":totalBalance
  };

  ProfileModel.fromJson(Map<String,dynamic> json){
    try{
      uid = json["uid"];
    }catch(e){

    }

    try{
      mail = json["mail"];
    }catch(e){

    }

    try{
      totalBalance = json["totalBalance"];
    }catch(e){

    }

      try{
      totalWin = json["totalWin"];
      }catch(e){

      }

      try{
      totalLoss = json["totalLoss"];
      }catch(e){

      }

      try{
      name = json["name"];
      }catch(e){

      }
  }
}