import 'package:cantos_flutter/models/song_model.dart';
import 'package:cantos_flutter/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewSongProvider extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController lyricsController = TextEditingController();

  void addSong() async {
    int id = await getLastSongId() + 1;
    final SongModel song = SongModel(
      id: id,
      title: titleController.text,
      lyrics: lyricsController.text,
    );

    final resp = await addNewSong(song);

    if (resp) {
      titleController.clear();
      lyricsController.clear();
      Get.snackbar('Canto agregado', 'El canto se ha agregado correctamente');
      
    } else {
      Get.snackbar('Error', 'No se ha podido agregar el canto');
    }
  }

  void updateExistingSong(SongModel? song) async{
    if (song != null) {
      song.title = titleController.text;
      song.lyrics = lyricsController.text;

      final resp = await updateSong(song);

      if (resp) {
        titleController.clear();
        lyricsController.clear();
        Get.snackbar('Canto actualizado', 'El canto se ha actualizado correctamente');
      } else {
        Get.snackbar('Error', 'No se ha podido actualizar el canto');
      }
    }
  }
}
