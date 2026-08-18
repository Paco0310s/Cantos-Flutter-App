import 'package:cantos_flutter/models/song_model.dart';
import 'package:cantos_flutter/utils/constans.dart';
import 'package:cantos_flutter/views/new_song_view.dart';
import 'package:cantos_flutter/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ViewSongView extends StatelessWidget {
  final SongModel song;

  const ViewSongView({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const _FloatingButtonsChangeSong(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: MyText(song.title),
        actions: [
          Visibility(
            visible: false,
            child: IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {},
            ),
          ),
          Visibility(
            visible: false,
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ),
          PopupMenuButton<String>(onSelected: (value) {
            if (value == 'edit') {
              Get.to(
                () => NewSongView(song: song),
                transition: Transition.rightToLeft,
              );
            } else if (value == 'delete') {
              showAdaptiveDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog.adaptive(
                    title: const MyText('Eliminar'),
                    content: const MyText('¿Estás seguro de eliminar este canto?'),
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
                        child: const MyText('Eliminar', fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                },
              );
            } else if (value == 'up') {
              // Subir de tono
              // Muestra un dialogo para seleccionar el tono
              showAdaptiveDialog(context: context, builder: 
                (BuildContext context) {
                  return AlertDialog.adaptive(
                    title: const MyText('Subir de tono'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const MyText('Selecciona el tono al que deseas subir'),
                        const Gap(10),
                        SizedBox(
                          width: double.infinity,
                          child: DropdownButton<String>(
                            value: 'C',
                            onChanged: (String? value) {},
                            items: const [
                              DropdownMenuItem(
                                value: 'C',
                                child: MyText('Do'),
                              ),
                              DropdownMenuItem(
                                value: 'D',
                                child: MyText('Re'),
                              ),
                              DropdownMenuItem(
                                value: 'E',
                                child: MyText('Mi'),
                              ),
                              DropdownMenuItem(
                                value: 'F',
                                child: MyText('Fa'),
                              ),
                              DropdownMenuItem(
                                value: 'G',
                                child: MyText('Sol'),
                              ),
                              DropdownMenuItem(
                                value: 'A',
                                child: MyText('La'),
                              ),
                              DropdownMenuItem(
                                value: 'B',
                                child: MyText('Si'),
                              ),
                            ],
                          ),
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
                        child: const MyText('Subir', fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                },
              );
            } else if (value == 'down') {
              // Bajar de tono
            } else if (value == 'pdf') {
              // Exportar en PDF
            }
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 'edit',
                child: MyText('Modificar'),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: MyText('Eliminar'),
              ),
              // const PopupMenuItem(
              //   value: 'up',
              //   child: MyText('Subir de tono'),
              // ),
              // const PopupMenuItem(
              //   value: 'down',
              //   child: MyText('Bajar de tono'),
              // ),
              // const PopupMenuItem(
              //   value: 'pdf',
              //   child: MyText('Exportar en PDF'),
              // ),
            ];
          }),
        ],
      ),
      body: Container(
        color: Constants.color3,
        padding: const EdgeInsets.all(8),
        child: InteractiveViewer(
          minScale: 1,
          maxScale: 2,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Builder(builder: (context) {
              final words = song.variations.first.lyrics.split(' ');
              return RichText(text: TextSpan(
                children: words.map((e) {
                  // Si es un acorde se pinta de otro color
                  if (isChord(e)) {
                    return TextSpan(
                      text: e,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 236, 111, 102),
                      ),
                    );
                  }
                  return TextSpan(
                    text: e,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  );
                }).toList(),
              ));
            }),
          ),
        ),
      ),
    );
  }
}

class _FloatingButtonsChangeSong extends StatelessWidget {
  const _FloatingButtonsChangeSong();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Visibility(
        visible: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: 'left',
              onPressed: () {},
              backgroundColor: Constants.colorPrimaryLight,
              child: const Icon(FeatherIcons.arrowLeft),
            ),
            FloatingActionButton(
              heroTag: 'right',
              onPressed: () {},
              backgroundColor: Constants.colorPrimaryLight,
              child: const Icon(FeatherIcons.arrowRight),
            ),
          ],
        ),
      ),
    );
  }
}

isChord(String chord) {
  return chord.contains('DO') || chord.contains('RE') || chord.contains('MI') || chord.contains('FA') || chord.contains('SOL') || chord.contains('LA') || chord.contains('SI');
}