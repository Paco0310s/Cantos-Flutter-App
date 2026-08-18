import 'package:cantos_flutter/models/moment_model.dart';
import 'package:cantos_flutter/models/song_model.dart';
import 'package:cantos_flutter/models/song_variation_model.dart';
import 'package:cantos_flutter/models/time_model.dart';
import 'package:cantos_flutter/services/songs_service.dart';
import 'package:cantos_flutter/utils/my_snackbar.dart';
import 'package:flutter/material.dart';

class NewSongProvider extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController lyricsController = TextEditingController();
  TextEditingController toneController = TextEditingController();

  List<MomentModel> moments = [];
  List<TimeModel> timeSongs = [];

  int indexVariation = 0;

  void addSong() async {
    bool validation = validationFields();
    if (!validation) return;

    int id = await SongsService.getLastSongId() + 1;

    final SongModel song = SongModel(
      id: id,
      title: titleController.text,
      variations: [
        SongVariationModel(
          id: 1,
          songId: id,
          lyrics: lyricsController.text,
          tone: toneController.text,
          description: null,
          imageUrl: null,
          audioUrl: null,
          videoUrl: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        )
      ],
      moments: moments,
      timeSongs: timeSongs,
    );

    final resp = await SongsService.addNewSong(song);

    if (resp) {
      resetFields();
      MySnackBar.showSnackBarSuccess('El canto se ha agregado correctamente');
    } else {
      MySnackBar.showSnackBarError('No se ha podido agregar el canto');
    }
  }

  void updateExistingSong(SongModel? song) async{
    if (song != null) {
      bool validation = validationFields();
      if (!validation) return;
      
      song.title = titleController.text;
      song.variations[indexVariation].tone = toneController.text;
      song.variations[indexVariation].updatedAt = DateTime.now();
      song.variations[indexVariation].lyrics = lyricsController.text;

      final resp = await SongsService.updateSong(song);

      if (resp) {
        resetFields();
        MySnackBar.showSnackBarSuccess('El canto se ha actualizado correctamente');
      } else {
        MySnackBar.showSnackBarError('No se ha podido actualizar el canto');
      }
    }
  }

  resetFields() {
    titleController.clear();
    lyricsController.clear();
    toneController.clear();
    moments = [];
    timeSongs = [];
    indexVariation = 0;
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

  bool validationFields() {
    if (titleController.text.isEmpty) {
      MySnackBar.showSnackBarError('El título del canto es requerido');
      return false;
    }

    if (lyricsController.text.isEmpty) {
      MySnackBar.showSnackBarError('La letra del canto es requerida');
      return false;
    }

    if (toneController.text.isEmpty) {
      MySnackBar.showSnackBarError('El tono del canto es requerido');
      return false;
    }

    if (moments.isEmpty) {
      MySnackBar.showSnackBarError('Debes seleccionar al menos un momento');
      return false;
    }

    if (timeSongs.isEmpty) {
      MySnackBar.showSnackBarError('Debes seleccionar al menos un tiempo');
      return false;
    }

    return true;
  }

}
