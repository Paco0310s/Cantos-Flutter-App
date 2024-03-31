import "package:cantos_flutter/models/moment_model.dart";
import "package:cloud_firestore/cloud_firestore.dart";

FirebaseFirestore db = FirebaseFirestore.instance;

class MomentsService {
  static CollectionReference moments = db.collection("moments");

  static Future<List<MomentModel>> getMoments() async {
    QuerySnapshot querySnapshot = await moments.get();
    List<MomentModel> momentsList = querySnapshot.docs
        .map((doc) => MomentModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return momentsList;
  }
}