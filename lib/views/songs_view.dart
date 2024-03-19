import 'package:cantos_flutter/models/song_model.dart';
import 'package:cantos_flutter/services/firebase_service.dart';
import 'package:cantos_flutter/views/view_song_view.dart';
import 'package:cantos_flutter/widgets/my_loading.dart';
import 'package:cantos_flutter/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongsView extends StatelessWidget {
  const SongsView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSongs(),
      builder: (context, snapshot) {
         if (snapshot.connectionState == ConnectionState.waiting) {
          return const MyLoading();
        } else if (snapshot.hasError) {
          return Center(child: MyText('Error: ${snapshot.error}'));
        } else {
          return _SongsList(snapshot.data as List<SongModel>);
        }
      },
    );
  }
}

class _SongsList extends StatelessWidget {

  final List<SongModel> songs;

  const _SongsList(this.songs);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ListTile(
            onTap: () {
              Get.to(() => ViewSongView(song: songs[index]), transition: Transition.rightToLeft);
            },
            title: MyText(songs[index].title),
            subtitle: MyText('${songs[index].artist}, ${songs[index].album}'),
          ),
        );
      },
    );
  }
  
}
