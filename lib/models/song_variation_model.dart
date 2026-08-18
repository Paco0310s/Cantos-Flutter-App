class SongVariationModel {
  final int id;
  final int songId;
  String lyrics;
  String tone;
  String? description;
  String? imageUrl;
  String? audioUrl;
  String? videoUrl;
  final DateTime createdAt;
  DateTime updatedAt;

  SongVariationModel({
    required this.id,
    required this.songId,
    required this.lyrics,
    required this.tone,
    required this.description,
    required this.imageUrl,
    required this.audioUrl,
    required this.videoUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SongVariationModel.fromJson(Map<String, dynamic> json) {
    return SongVariationModel(
      id: json['id'],
      songId: json['song_id'],
      lyrics: json['lyrics'],
      tone: json['tone'],
      description: json['description'],
      imageUrl: json['image_url'],
      audioUrl: json['audio_url'],
      videoUrl: json['video_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'song_id': songId,
      'lyrics': lyrics,
      'tone': tone,
      'description': description,
      'image_url': imageUrl,
      'audio_url': audioUrl,
      'video_url': videoUrl,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}