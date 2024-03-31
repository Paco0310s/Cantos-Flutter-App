import "package:cantos_flutter/models/time_model.dart";
import "package:cloud_firestore/cloud_firestore.dart";

FirebaseFirestore db = FirebaseFirestore.instance;

class TimeService {
  static CollectionReference timeSongs = db.collection("time");

  static Future<List<TimeModel>> getTimeSongs() async {
    QuerySnapshot querySnapshot = await timeSongs.get();
    List<TimeModel> timeList = querySnapshot.docs
        .map((doc) => TimeModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return timeList;
  }
}