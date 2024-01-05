import 'package:cantos_flutter/views/view_song_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongsView extends StatelessWidget {
  const SongsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ListTile(
            onTap: () {
              Get.to(() => const ViewSongView(), transition: Transition.rightToLeft);
            },
            title: const Text('Nombre'),
            subtitle: const Text('[Momento], [Tiempo], [Tono]'),
          ),
        );
      },
    );
  }
}
