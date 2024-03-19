class SongModel {
  final int id;
  String title;
  final String? artist;
  final String? album;
  final String? photoUrl;
  final String? songUrl;
  String lyrics;

  SongModel({
    required this.id,
    required this.title,
    this.artist,
    this.album,
    this.photoUrl,
    this.songUrl,
    required this.lyrics,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
      id: json["id"],
      title: json["title"],
      artist: json["artist"],
      album: json["album"],
      photoUrl: json["photoUrl"],
      songUrl: json["songUrl"],
      lyrics: json["lyrics"],
    );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "artist": artist,
    "album": album,
    "photoUrl": photoUrl,
    "songUrl": songUrl,
    "lyrics": lyrics,
  };
  
}