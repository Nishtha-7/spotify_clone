import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:just_audio/just_audio.dart';

import '../../domin/ui_helper.dart';
import '../dashboard/navigations/songAlbumDetails/SongProvider.dart';
import '../dashboard/navigations/songAlbumDetails/song.dart';

class MyCompactMusicPlayerWidget extends StatefulWidget {
  final AudioPlayer audioPlayer;

  const MyCompactMusicPlayerWidget({Key? key, required this.audioPlayer}) : super(key: key);

  @override
  State<MyCompactMusicPlayerWidget> createState() => _MyCompactMusicPlayerWidgetState();
}

class _MyCompactMusicPlayerWidgetState extends State<MyCompactMusicPlayerWidget> {
  PaletteGenerator? paletteGenerator;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final songProvider = Provider.of<SongProvider>(context);
    final currentSong = songProvider.currentSong;

    if (currentSong != null) {
      _updatePalette(currentSong.imgPath);
    }
  }

  Future<void> _updatePalette(String imagePath) async {
    paletteGenerator = await getColorPalette(imagePath);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final songProvider = Provider.of<SongProvider>(context);
    final song = songProvider.currentSong;

    if (song == null) {
      return SizedBox.shrink(); // No song is playing
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 73,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: paletteGenerator != null
            ? paletteGenerator!.dominantColor!.color.withOpacity(0.4)
            : Colors.black54,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image: DecorationImage(
                      image: AssetImage(song.imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        song.name,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        song.artist,
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    songProvider.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () async {
                    if (songProvider.isPlaying) {
                      await widget.audioPlayer.pause();
                      songProvider.pauseSong();
                    } else {
                      await widget.audioPlayer.setAsset(song.audioPath);
                      await widget.audioPlayer.play();
                      songProvider.playSong(song);
                    }
                  },
                ),
              ],
            ),
            LinearProgressIndicator(
              value: songProvider.progress,
              valueColor: AlwaysStoppedAnimation<Color>(
                paletteGenerator != null
                    ? paletteGenerator!.dominantColor!.color.withOpacity(0.9)
                    : Colors.white,
              ),
              backgroundColor: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(11),
            ),
          ],
        ),
      ),
    );
  }
}
