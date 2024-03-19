import 'package:cantos_flutter/models/song_model.dart';
import 'package:cantos_flutter/providers/new_song_provider.dart';
import 'package:cantos_flutter/widgets/my_text.dart';
import 'package:cantos_flutter/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class NewSongView extends StatelessWidget {
  final SongModel? song;

  const NewSongView({Key? key, this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewSongProvider newSongProvider = Provider.of<NewSongProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: MyText(song == null ? 'Nuevo canto' : 'Modificar canto'),
        actions: [
          IconButton(
            icon: const Icon(Icons.format_quote, size: 32),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyText('Nombre', fontSize: 18),
                const SizedBox(height: 5),
                MyTextField(
                  controller: newSongProvider.titleController..text = song?.title ?? '',
                  text: 'Nombre del canto', 
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(height: 20),
                const MyText('Letra', fontSize: 18),
                const SizedBox(height: 5),
                MyTextField(
                  controller: newSongProvider.lyricsController..text = song?.lyrics ?? '',
                  text: 'Letra del canto',
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog.adaptive(
                                title: const MyText('Momentos:'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    for (int i = 0; i < 10; i++)
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: true,
                                            activeColor: const Color.fromARGB(255, 139, 139, 139),
                                            onChanged: (value) {},
                                          ),
                                          const Gap(5),
                                          const MyText('Momento'),
                                        ],
                                      ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const MyText('Cancelar', fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
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
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(0, 50),
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(255, 99, 97, 97),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const MyText(
                          'Momento',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Gap(20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog.adaptive(
                                title: const MyText('Tiempos:'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    for (int i = 0; i < 10; i++)
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: true,
                                            activeColor: const Color.fromARGB(255, 139, 139, 139),
                                            onChanged: (value) {},
                                          ),
                                          const Gap(5),
                                          const MyText('Tiempo'),
                                        ],
                                      ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const MyText('Cancelar', fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
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
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(0, 50),
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(255, 99, 97, 97),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const MyText(
                          'Tiempo',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(20),
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
                    backgroundColor: const Color.fromARGB(255, 99, 97, 97),
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
}
