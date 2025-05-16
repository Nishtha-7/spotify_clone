import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/ui/dashboard/navigations/songAlbumDetails/SongProvider.dart';
import 'package:spotify_clone/ui/dashboard/navigations/songAlbumDetails/song_tile.dart';

import '../../../../domin/ui_helper.dart';
import '../songAlbumDetails/song.dart';
import 'comfort_detail.dart';

class ComfortMusicDetail extends StatefulWidget {
  String AlbumPicPath = "assets/images/1st row/bts bts.jpeg";

  ComfortMusicDetail({required this.AlbumPicPath});

  @override
  State<ComfortMusicDetail> createState() => _AlbumDetailsPageState();
}

class _AlbumDetailsPageState extends State<ComfortMusicDetail> {
  late AudioPlayer _audioPlayer;

  int? currentlyPlayingIndex;
  bool isPlaying = false;

  final List<Song> comfortSongs = [
    Song(
        imgPath: "assets/images/comfort/sleep.jpeg",
        name: "Sweet Night",
        artist: "V",
        audioPath: "assets/audio/songs/Sweet Night - V.mp3"),
    Song(
        imgPath: "assets/images/comfort/mine love mine all mine.jpeg",
        name: "My Love Mine All Mine",
        artist: "Mitski",
        audioPath: "assets/audio/songs/My Love Mine All Mine - Mitski.mp3"),
    Song(
        imgPath: "assets/images/bts songs/Answer love myself.jpeg",
        name: "Answer: Love Myself",
        artist: "BTS",
        audioPath: "assets/audio/songs/Answer _ Love Myself - BTS.mp3"),
    Song(
        imgPath: "assets/images/3rd row/comfort.jpeg",
        name: "Winter Bear",
        artist: "V",
        audioPath: "assets/audio/songs/Winter Bear - V.mp3"),
    Song(
      imgPath: "assets/images/bts songs/take two bts.jpeg",
      name: "Take Two",
      artist: "BTS",
      audioPath: "assets/audio/songs/Take Two - BTS.mp3",
    ),
    Song(
        imgPath: "assets/images/bts songs/masgic shop.jpeg",
        name: "Magic Shop",
        artist: "BTS",
        audioPath: "assets/audio/songs/Magic Shop - BTS.mp3"),
    Song(
        imgPath: "assets/images/comfort/double take.jpeg",
        name: "Double Take ",
        artist: "Dhruv",
        audioPath: "assets/audio/songs/double take - Dhruv.mp3"),
    Song(
        imgPath: "assets/images/comfort/pano.jpeg",
        name: "Pano",
        artist: "Zack Tabudlo",
        audioPath: "assets/audio/songs/Pano - Zack Tabudlo.mp3"),
  ];

  PaletteGenerator? paletteGenerator;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    initializePaletteGenerator();

    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          isPlaying = false;
          currentlyPlayingIndex = null;
        });
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void initializePaletteGenerator() async {
    paletteGenerator = await getColorPalette(widget.AlbumPicPath);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  paletteGenerator != null
                      ? HSLColor.fromColor(paletteGenerator!.colors.toList()[2])
                          .withLightness(0.3)
                          .toColor()
                      : Colors.black,
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SafeArea(
                        child: InkWell(
                          child: Icon(Icons.arrow_back_ios_new_sharp,
                              color: Colors.white),
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ComfortDetail()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 230,
                  height: 230,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage(widget.AlbumPicPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Comfort Playlist",
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("77,935,256 saves • 1h 3min",
                      style: TextStyle(color: Colors.grey)),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: comfortSongs.length,
                    itemBuilder: (_, index) {
                      return SongTile(
                        song: comfortSongs[index],
                        index: index,
                        currentlyPlayingIndex: currentlyPlayingIndex,
                        audioPlayer: _audioPlayer,
                        onPlaybackChanged: (newIndex, playing) {
                          setState(() {
                            currentlyPlayingIndex = newIndex;
                            isPlaying = playing;
                          });
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
