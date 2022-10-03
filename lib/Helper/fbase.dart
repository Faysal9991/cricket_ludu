import 'dart:io';

import 'package:beting_app/models/gamemodel.dart';
import 'package:beting_app/models/profilemodel.dart';
import 'package:beting_app/models/withdrawmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/mainadminmodel.dart';
import '../models/rechargemodel.dart';

class FireBase{
  final auth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;
  final cu = FirebaseAuth.instance.currentUser;
  final storage = FirebaseStorage.instance;

  Future<UserCredential> signUpWithEmailAndPassword(String mail, String password, String name)async{
    final x = await auth.createUserWithEmailAndPassword(email: mail, password: password).then((value) async{
      await store.collection("profile").doc(value.user?.uid).set(ProfileModel(uid: value.user?.uid, mail: value.user?.email, totalBalance: 0, name: name).toJson());
      return value;
    });
    return x;
  }
  Future<UserCredential> signinwithemailandpassword(String mail, String password)async{
    final x = await auth.signInWithEmailAndPassword(email: mail, password: password);
    return x;
  }
  logout()async{
    await auth.signOut();
  }

  Future<bool> joinGame(GameModel gameModel, ProfileModel profileModel)async{
    if(gameModel.slotonecapacity!>gameModel.slotoneusers.length){
      gameModel.slotoneusers.add(profileModel.uid!);
    }else{
      gameModel.slottwousers.add(profileModel.uid!);
    }
    profileModel.totalBalance=profileModel.totalBalance!-gameModel.entryFee!;
     final x = await store.collection("game").doc(gameModel.uid).update(gameModel.toJson()).onError((error, stackTrace) => false);
     final y = await store.collection("profile").doc(profileModel.uid).update(profileModel.toJson()).onError((error, stackTrace) => false);
     return true;



  }

  Future<String> uploadImage(File imageFile, String fileName) async{
    final x = await storage.ref("profile/$fileName").putFile(imageFile);
    final y = await x.ref.getDownloadURL();
    return y;
  }

  Future<bool> joinGameCricket(GameModel gameModel, ProfileModel profileModel, int serial)async{
    if(serial==1){
      gameModel.slotoneusers.add(profileModel.uid!);
    }else{
      gameModel.slottwousers.add(profileModel.uid!);
    }

    profileModel.totalBalance=profileModel.totalBalance!-gameModel.entryFee!;
    final x = await store.collection("game").doc(gameModel.uid).update(gameModel.toJson()).onError((error, stackTrace) => false);
    final y = await store.collection("profile").doc(profileModel.uid).update(profileModel.toJson()).onError((error, stackTrace) => false);
    return true;



  }

  Future<bool> rechargeRequest(RechargeModel rechargeModel)async{
    final x = await store.collection("recharge").doc().set(rechargeModel.toJson()).onError((error, stackTrace) => false);
    return true;
  }

  Future<bool> withdrawRequest(WithdrawModel withdrawModel)async{
    final x = await store.collection("withdraw").doc().set(withdrawModel.toJson()).onError((error, stackTrace) => false);
    return true;
  }
  Stream<List<GameModel>> allLudo(){
    return store.collection("game").where("boardType", isEqualTo: "Ludo").snapshots().map((event) => event.docs.map((e) {
      GameModel gameModel = GameModel.fromJson(e.data());
      gameModel.uid = e.id;
      return gameModel;
    }).toList());
  }

  Stream<List<GameModel>> allCricket(){
    return store.collection("game").where("boardType", isEqualTo: "Cricket").snapshots().map((event) => event.docs.map((e) {
      GameModel gameModel = GameModel.fromJson(e.data());
      gameModel.uid = e.id;
      return gameModel;
    }).toList());
  }
  
  Stream<List<GameModel>> allgames(){
    return store.collection("game").snapshots().map((event) => event.docs.map((e) {
      GameModel gameModel = GameModel.fromJson(e.data());
      gameModel.uid = e.id;
      return gameModel;
    }).toList());
  }

  Stream<ProfileModel> myProfileStream(){
    return store.collection("profile").doc(auth.currentUser!.uid).snapshots().map((event) => ProfileModel.fromJson(event.data()!));
  }

  Future<ProfileModel>myProfile()async{
    ProfileModel profileModel = ProfileModel();
    final x = await store.collection("profile").doc(auth.currentUser!.uid).get().then((value) {
      profileModel = ProfileModel.fromJson(value.data()!);
    });

    return profileModel;

  }
  Stream<MainAdminModel> mainadmindatas(){
    return store.collection("mainadmin").doc("staticdata").snapshots().map((event) => MainAdminModel.fromJson(event.data()!));
  }

  Future<bool>rechargeTobalance(String amount, String transactionId)async{
    final x = await store.collection("recharges").doc().set(RechargeModel(uid: auth.currentUser!.uid, amount: amount, transactionId: transactionId).toJson()).onError((error, stackTrace) => false);
    return true;
  }

}