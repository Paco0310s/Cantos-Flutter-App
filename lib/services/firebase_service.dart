import "package:cantos_flutter/models/song_model.dart";
import "package:cloud_firestore/cloud_firestore.dart";

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<SongModel>> getSongs() async {
  List<SongModel> songs = [];

  CollectionReference songsCollection = db.collection("songs");

  QuerySnapshot songsSnapshot = await songsCollection.orderBy("title").get();

  for (var song in songsSnapshot.docs) {
    songs.add(SongModel.fromJson(song.data() as Map<String, dynamic>));
  }

  return songs;
}

Future<bool> addNewSong(SongModel song) async {
  CollectionReference songsCollection = db.collection("songs");

  try {
    await songsCollection.add(song.toJson());
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updateSong(SongModel song) async {
  CollectionReference songsCollection = db.collection("songs");

  try {
    await songsCollection.doc(song.id.toString()).update(song.toJson());
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> deleteSong(int id) async {
  CollectionReference songsCollection = db.collection("songs");

  try {
    await songsCollection.doc(id.toString()).delete();
    return true;
  } catch (e) {
    return false;
  }
}

Future<SongModel> getSong(int id) async {
  CollectionReference songsCollection = db.collection("songs");

  DocumentSnapshot songSnapshot = await songsCollection.doc(id.toString()).get();

  return SongModel.fromJson(songSnapshot.data() as Map<String, dynamic>);
}

Future<List<SongModel>> searchSongs(String query) async {
  List<SongModel> songs = [];

  CollectionReference songsCollection = db.collection("songs");

  QuerySnapshot songsSnapshot = await songsCollection.where("title", isGreaterThanOrEqualTo: query).get();

  for (var song in songsSnapshot.docs) {
    songs.add(SongModel.fromJson(song.data() as Map<String, dynamic>));
  }

  return songs;
}

getLastSongId() async {
  CollectionReference songsCollection = db.collection("songs");

  QuerySnapshot songsSnapshot = await songsCollection.orderBy("id", descending: true).limit(1).get();

  final lastSong = songsSnapshot.docs.first.data() as Map<String, dynamic>;

  return lastSong["id"];
}