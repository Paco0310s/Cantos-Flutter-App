import 'package:cantos_flutter/models/song_model.dart';
import 'package:cantos_flutter/views/new_scheem_view.dart';
import 'package:cantos_flutter/views/view_song_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheemsProvider extends ChangeNotifier {
  void goToNewScheem(int index) {
    Get.to(
      () => const NewScheemView(newScheem: false),
      transition: Transition.rightToLeft,
    );
  }

  void goToViewSong() {
    Get.to(
      () => ViewSongView(song: SongModel(id: -1, title: '', lyrics: '')),
      transition: Transition.rightToLeft,
    );
  }
}
