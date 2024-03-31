import 'package:cantos_flutter/models/moment_model.dart';
import 'package:cantos_flutter/models/song_model.dart';
import 'package:cantos_flutter/models/time_model.dart';
import 'package:cantos_flutter/services/songs_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewSongProvider extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController lyricsController = TextEditingController();
  List<MomentModel> moments = [];
  List<TimeModel> timeSongs = [];

  void addSong() async {
    int id = await SongsService.getLastSongId() + 1;
    final SongModel song = SongModel(
      id: id,
      title: titleController.text,
      lyrics: lyricsController.text,
      moments: moments,
      timeSongs: timeSongs,
    );

    final resp = await SongsService.addNewSong(song);

    if (resp) {
      resetFields();
      Get.snackbar('Canto agregado', 'El canto se ha agregado correctamente');
      
    } else {
      Get.snackbar('Error', 'No se ha podido agregar el canto');
    }
  }

  void updateExistingSong(SongModel? song) async{
    if (song != null) {
      song.title = titleController.text;
      song.lyrics = lyricsController.text;

      final resp = await SongsService.updateSong(song);

      if (resp) {
        resetFields();
        Get.snackbar('Canto actualizado', 'El canto se ha actualizado correctamente');
      } else {
        Get.snackbar('Error', 'No se ha podido actualizar el canto');
      }
    }
  }

  resetFields() {
    titleController.clear();
    lyricsController.clear();
    moments = [];
    timeSongs = [];
  }

  bool isMomentSelected(MomentModel moment) {
    final exists = moments.any((element) => element.moment == moment.moment);
    return exists;
  }

  changeActiveMoment(MomentModel moment) {
    final exists = isMomentSelected(moment);

    if (exists) {
      moments.removeWhere((element) => element.moment == moment.moment);
    } else {
      moments.add(moment);
    } 

    notifyListeners();
  }

  removeMoment(MomentModel moment) {
    moments.removeWhere((element) => element.moment == moment.moment);
    notifyListeners();
  }

  bool isTimeSelected(TimeModel time) {
    final exists = timeSongs.any((element) => element.time == time.time);
    return exists;
  }

  changeActiveTime(TimeModel time) {
    final exists = isTimeSelected(time);

    if (exists) {
      timeSongs.removeWhere((element) => element.time == time.time);
    } else {
      timeSongs.add(time);
    } 

    notifyListeners();
  }

  removeTime(TimeModel time) {
    timeSongs.removeWhere((element) => element.time == time.time);
    notifyListeners();
  }

}
