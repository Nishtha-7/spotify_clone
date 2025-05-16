import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/ui/dashboard/navigations/songAlbumDetails/song.dart';

import 'SongProvider.dart';

class SongTile extends StatelessWidget {
  final Song song;
  final int index;
  final int? currentlyPlayingIndex;
  final AudioPlayer audioPlayer;
  final Function(int?, bool) onPlaybackChanged; // callback

  const SongTile({
    Key? key,
    required this.song,
    required this.index,
    required this.currentlyPlayingIndex,
    required this.audioPlayer,
    required this.onPlaybackChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCurrent = currentlyPlayingIndex == index;
    final isPlaying = isCurrent && audioPlayer.playing;

    return ListTile(
      leading: Image.asset(song.imgPath, width: 60, height: 60, fit: BoxFit.cover),
      title: Text(song.name, style: TextStyle(color: Colors.white)),
      subtitle: Text(song.artist, style: TextStyle(color: Colors.grey)),
      trailing: IconButton(
        icon: Icon(
          isPlaying ? Icons.pause_circle : Icons.play_circle,
          color: Colors.green,
          size: 35,
        ),
        onPressed: () async {
          if (isPlaying) {
            await audioPlayer.pause();
            onPlaybackChanged(null, false);
            Provider.of<SongProvider>(context, listen: false).clearSong();
          } else {
            await audioPlayer.setAsset(song.audioPath);
            await audioPlayer.play();
            onPlaybackChanged(index, true);
            Provider.of<SongProvider>(context, listen: false).playSong(song);
          }
        },
      ),
    );
  }
}
