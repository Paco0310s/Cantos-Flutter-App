import 'package:cantos_flutter/models/song_model.dart';
import 'package:cantos_flutter/utils/constans.dart';
import 'package:cantos_flutter/views/new_song_view.dart';
import 'package:cantos_flutter/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class ViewSongView extends StatelessWidget {
  final SongModel song;

  const ViewSongView({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
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
      ),
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
              const PopupMenuItem(
                value: 'up',
                child: MyText('Subir de tono'),
              ),
              const PopupMenuItem(
                value: 'down',
                child: MyText('Bajar de tono'),
              ),
              const PopupMenuItem(
                value: 'pdf',
                child: MyText('Exportar en PDF'),
              ),
            ];
          }),
        ],
      ),
      body: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(10),
        minScale: 1,
        maxScale: 2,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: MyText( song.lyrics, fontSize: 18),
        ),
      ),
    );
  }
}
