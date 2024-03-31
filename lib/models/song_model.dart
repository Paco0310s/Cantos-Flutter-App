import 'package:cantos_flutter/models/moment_model.dart';
import 'package:cantos_flutter/models/time_model.dart';

class SongModel {
  final int id;
  String title;
  final String? artist;
  final String? album;
  final String? photoUrl;
  final String? songUrl;
  String lyrics;
  List<MomentModel> moments;
  List<TimeModel> timeSongs;

  SongModel({
    required this.id,
    required this.title,
    this.artist,
    this.album,
    this.photoUrl,
    this.songUrl,
    required this.lyrics,
    required this.moments,
    required this.timeSongs,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
      id: json["id"],
      title: json["title"],
      artist: json["artist"],
      album: json["album"],
      photoUrl: json["photoUrl"],
      songUrl: json["songUrl"],
      lyrics: json["lyrics"],
      moments: json["moments"] != null ? List<MomentModel>.from(json["moments"].map((x) => MomentModel.fromJson(x))) : [],
      timeSongs: json["time"] != null ? List<TimeModel>.from(json["time"].map((x) => TimeModel.fromJson(x))) : [],
    );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "artist": artist,
    "album": album,
    "photoUrl": photoUrl,
    "songUrl": songUrl,
    "lyrics": lyrics,
    "moments": List<dynamic>.from(moments.map((x) => x.toJson())),
    "time": List<dynamic>.from(timeSongs.map((x) => x.toJson())),
  };
  
}