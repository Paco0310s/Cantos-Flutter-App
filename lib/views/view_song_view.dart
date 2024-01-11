import 'package:cantos_flutter/utils/constans.dart';
import 'package:cantos_flutter/views/new_song_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class ViewSongView extends StatelessWidget {
  const ViewSongView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: const Text('Nombre del canto'),
        actions: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
          PopupMenuButton<String>(onSelected: (value) {
            if (value == 'edit') {
              Get.to(
                () => const NewSongView(newSong: false),
                transition: Transition.rightToLeft,
              );
            } else if (value == 'delete') {
              showAdaptiveDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog.adaptive(
                    title: const Text('Eliminar'),
                    content: const Text('¿Estás seguro de eliminar este canto?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Cancelar', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Eliminar', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
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
                child: Text('Modificar'),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Text('Eliminar'),
              ),
              const PopupMenuItem(
                value: 'up',
                child: Text('Subir de tono'),
              ),
              const PopupMenuItem(
                value: 'down',
                child: Text('Bajar de tono'),
              ),
              const PopupMenuItem(
                value: 'pdf',
                child: Text('Exportar en PDF'),
              ),
            ];
          }),
        ],
      ),
      body: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(10),
        minScale: 0.01,
        maxScale: 2,
        child: const SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Text(
            'lipsum lorem dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum lipsum lorem dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum lipsum lorem dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
