import "package:cantos_flutter/models/song_model.dart";
import "package:cloud_firestore/cloud_firestore.dart";

FirebaseFirestore db = FirebaseFirestore.instance;

class SongsService {
  static CollectionReference songs = db.collection("songs");

  static Future<List<SongModel>> getSongs() async {
    QuerySnapshot querySnapshot = await songs.get();
    List<SongModel> songsList = querySnapshot.docs
        .map((doc) => SongModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return songsList;
  }

  static Future<bool> addNewSong(SongModel song) async {
    try {
      await songs.add(song.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> updateSong(SongModel song) async {
    try {
      await songs.doc(song.id.toString()).update(song.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteSong(int id) async {
    try {
      await songs.doc(id.toString()).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<SongModel> getSong(int id) async {
    DocumentSnapshot songSnapshot = await songs.doc(id.toString()).get();
    return SongModel.fromJson(songSnapshot.data() as Map<String, dynamic>);
  }

  static Future<List<SongModel>> searchSongs(String query) async {
    QuerySnapshot songsSnapshot = await songs.where("title", isGreaterThanOrEqualTo: query).get();
    List<SongModel> songsList = songsSnapshot.docs
        .map((doc) => SongModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return songsList;
  }

  static getLastSongId() async {
    QuerySnapshot songsSnapshot = await songs.orderBy("id", descending: true).limit(1).get();
    final lastSong = songsSnapshot.docs.isNotEmpty ? songsSnapshot.docs.first.data() as Map<String, dynamic> : {"id": 1};
    return lastSong["id"];
  }
}
