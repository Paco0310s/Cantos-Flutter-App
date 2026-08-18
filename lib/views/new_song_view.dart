import 'package:cantos_flutter/models/song_model.dart';
import 'package:cantos_flutter/providers/new_song_provider.dart';
import 'package:cantos_flutter/services/moments_service.dart';
import 'package:cantos_flutter/services/time_service.dart';
import 'package:cantos_flutter/utils/constans.dart';
import 'package:cantos_flutter/widgets/my_text.dart';
import 'package:cantos_flutter/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class NewSongView extends StatelessWidget {
  final SongModel? song;

  const NewSongView({super.key, this.song});

  @override
  Widget build(BuildContext context) {
    final NewSongProvider newSongProvider = Provider.of<NewSongProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: MyText(song == null ? 'Nuevo canto' : 'Modificar canto'),
        actions: [
          IconButton(
            icon: const Icon(Icons.format_quote, size: 32),
            tooltip: 'Poner/Quitar comillas',
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextField(
                  controller: newSongProvider.titleController,
                  text: 'Nombre del canto',
                  keyboardType: TextInputType.text,
                ),
                const Gap(10),
                MyTextField(
                  controller: newSongProvider.toneController,
                  text: 'Tono del canto',
                  keyboardType: TextInputType.text,
                ),
                const Gap(10),
                MyTextField(
                  controller: newSongProvider.lyricsController,
                  text: 'Letra del canto',
                  keyboardType: TextInputType.multiline,
                  minLines: 2,
                  maxLines: 20,
                ),
                const Gap(7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MyText('Momentos:', fontSize: 18, fontWeight: FontWeight.bold),
                    IconButton(
                      onPressed: () {
                        showMoments(context, newSongProvider);
                      },
                      icon: const Row(
                        children: [
                          Icon(Icons.add, color: Constants.color2),
                          Gap(5),
                          MyText('Agregar ', fontSize: 16, fontWeight: FontWeight.bold),
                        ],
                      ),
                    ),
                  ],
                ),
                Builder(builder: (context) {
                  if (newSongProvider.moments.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: newSongProvider.moments.map((moment) {
                            return Dismissible(
                              direction: DismissDirection.up,
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                newSongProvider.removeMoment(moment);
                              },
                              background: Container(
                                margin: const EdgeInsets.only(right: 5, top: 5),
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Constants.error,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Constants.color2),
                                ),
                                child: const Icon(Icons.delete_forever, color: Constants.color4),
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(right: 5, top: 5),
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Constants.color3,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Constants.color2),
                                ),
                                child: MyText(moment.moment),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  }
                  return const Center(child: MyText('No hay momentos seleccionados', fontSize: 14, fontWeight: FontWeight.w400, color: Constants.error));
                }),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MyText('Tiempos:', fontSize: 18, fontWeight: FontWeight.bold),
                    IconButton(
                      onPressed: () {
                        _showTimeSongs(context, newSongProvider);
                      },
                      icon: const Row(
                        children: [
                          Icon(Icons.add, color: Constants.color2),
                          Gap(5),
                          MyText('Agregar ', fontSize: 16, fontWeight: FontWeight.bold),
                        ],
                      ),
                    ),
                  ],
                ),
                Builder(builder: (context) {
                  if (newSongProvider.timeSongs.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: newSongProvider.timeSongs.map((time) {
                            return Dismissible(
                              direction: DismissDirection.up,
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                newSongProvider.removeTime(time);
                              },
                              background: Container(
                                margin: const EdgeInsets.only(right: 5, top: 5),
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Constants.error,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Constants.color2),
                                ),
                                child: const Icon(Icons.delete_forever, color: Constants.color4),
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(right: 5, top: 5),
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Constants.color3,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Constants.color2),
                                ),
                                child: MyText(time.time),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  }
                  return const Center(child: MyText('No hay tiempos seleccionados', fontSize: 14, fontWeight: FontWeight.w400, color: Constants.error));
                }),
                const Gap(30),
                ElevatedButton(
                  onPressed: () {
                    if (song == null) {
                      newSongProvider.addSong();
                    } else {
                      newSongProvider.updateExistingSong(song);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    foregroundColor: Colors.white,
                    backgroundColor: Constants.color1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: MyText(
                    song == null ? 'Guardar' : 'Modificar',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showMoments(BuildContext context, NewSongProvider newSongProvider) {
    return showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const MyText('Momentos:', fontSize: 18, fontWeight: FontWeight.bold),
          backgroundColor: Constants.color4,
          content: SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            child: FutureBuilder(
              future: MomentsService.getMoments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => newSongProvider.changeActiveMoment(snapshot.data![index]),
                        child: Row(
                          children: [
                            Checkbox(
                              value: context.watch<NewSongProvider>().isMomentSelected(snapshot.data![index]),
                              activeColor: Constants.color2,
                              onChanged: (value) => newSongProvider.changeActiveMoment(snapshot.data![index]),
                            ),
                            const Gap(5),
                            MyText(snapshot.data![index].moment),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const MyText('Aceptar', fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> _showTimeSongs(BuildContext context, NewSongProvider newSongProvider) {
    return showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const MyText('Tiempos:', fontSize: 18, fontWeight: FontWeight.bold),
          backgroundColor: Constants.color4,
          content: SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            child: FutureBuilder(
              future: TimeService.getTimeSongs(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => newSongProvider.changeActiveTime(snapshot.data![index]),
                        child: Row(
                          children: [
                            Checkbox(
                              value: context.watch<NewSongProvider>().isTimeSelected(snapshot.data![index]),
                              activeColor: Constants.color2,
                              onChanged: (value) => newSongProvider.changeActiveTime(snapshot.data![index]),
                            ),
                            const Gap(5),
                            MyText(snapshot.data![index].time),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const MyText('Aceptar', fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
