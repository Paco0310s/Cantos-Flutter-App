import 'package:cantos_flutter/models/moment_model.dart';
import 'package:cantos_flutter/models/song_variation_model.dart';
import 'package:cantos_flutter/models/time_model.dart';

class SongModel {
  final int id;
  String title;
  final String? artist;
  final String? album;
  final List<SongVariationModel> variations;
  List<MomentModel> moments;
  List<TimeModel> timeSongs;

  SongModel({
    required this.id,
    required this.title,
    required this.variations,
    required this.moments,
    required this.timeSongs,
    this.artist,
    this.album,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
      id: json["id"],
      title: json["title"],
      artist: json["artist"],
      album: json["album"],
      variations: json["variations"] != null ? List<SongVariationModel>.from(json["variations"].map((x) => SongVariationModel.fromJson(x))) : [],
      moments: json["moments"] != null ? List<MomentModel>.from(json["moments"].map((x) => MomentModel.fromJson(x))) : [],
      timeSongs: json["time"] != null ? List<TimeModel>.from(json["time"].map((x) => TimeModel.fromJson(x))) : [],
    );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "artist": artist,
    "album": album,
    "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
    "moments": List<dynamic>.from(moments.map((x) => x.toJson())),
    "time": List<dynamic>.from(timeSongs.map((x) => x.toJson())),
  };
  
}