import 'package:cantos_flutter/models/song_model.dart';
import 'package:cantos_flutter/services/songs_service.dart';
import 'package:cantos_flutter/utils/constans.dart';
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
      future: SongsService.getSongs(),
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
        return _SongItem(song: songs[index]);
      },
    );
  }
  
}

class _SongItem extends StatelessWidget {
  const _SongItem({
    required this.song,
  });

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7, left: 7, right: 7),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Constants.color3,
        border: Border.fromBorderSide(BorderSide(color: Constants.color1, width: .5)),
      ),
      child: ListTile(
        onTap: () {
          Get.to(() => ViewSongView(song: song), transition: Transition.rightToLeft);
        },
        title: MyText(song.title),
        subtitle: MyText('${song.moments.map((e) => e.moment)}, ${song.timeSongs.map((e) => e.time)}'),
      ),
    );
  }
}
