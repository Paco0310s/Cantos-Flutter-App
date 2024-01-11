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
      () => const ViewSongView(),
      transition: Transition.rightToLeft,
    );
  }
}
