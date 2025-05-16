import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../../../../domin/ui_helper.dart';
import '../songAlbumDetails/SongProvider.dart';
import '../songAlbumDetails/song.dart';
import 'kpop_detail.dart';

class KpopMusicDetail extends StatefulWidget {
  String AlbumPicPath = "assets/images/1st row/bts bts.jpeg";

  KpopMusicDetail({required this.AlbumPicPath, required String albumPicPath});

  @override
  State<KpopMusicDetail> createState() => _AlbumDetailsPageState();
}

class _AlbumDetailsPageState extends State<KpopMusicDetail> {
  late AudioPlayer _audioPlayer;

  int? currentlyPlayingIndex;
  bool isPlaying = false;

  final List<Song> kpopSongs = [
    Song(imgPath: "assets/images/bts songs/butter.jpeg",
  name: "Butter",
  artist: "BTS",
  audioPath: "assets/audio/songs/Butter  BTS.mp3"),

   Song( imgPath: "assets/images/bts songs/permission to dance.png",
  name: "Permission to Dance",
  artist: "BTS",
  audioPath: "assets/audio/songs/Permission to Dance - BTS.mp3"),

  Song(imgPath: "assets/images/bts dyna album.png",
  name: "Dynamite",
  artist: "BTS",
  audioPath: "assets/audio/songs/Dynamite - BTS.mp3"),

    Song(imgPath: "assets/images/kpop/abcd.jpeg",
  name: "ABCD",
  artist: "NAYEON",
  audioPath: "assets/audio/songs/ABCD  NAYEON.mp3"),

   Song(imgPath: "assets/images/kpop/antifragile.png",
  name: "Antifragile",
  artist: "LE SSERAFIM",
  audioPath: "assets/audio/songs/ANTIFRAGILE - LE SSERAFIM.mp3"),

    Song( imgPath: "assets/images/kpop/igloo.jpeg",
  name: "Igloo",
  artist: "KISS OF LIFE",
  audioPath: "assets/audio/songs/Igloo  KISS OF LIFE.mp3"),

    Song(imgPath: "assets/images/kpop/strategy.jpeg",
  name: "Strategy",
  artist: "TWICE",
  audioPath: "assets/audio/songs/Strategy - TWICE.mp3"),

    Song(imgPath: "assets/images/kpop/crazy.jpeg",
  name: "Crazy",
  artist: "LE SSERAFIM",
  audioPath: "assets/audio/songs/CRAZY - LE SSERAFIM.mp3"),

    Song(imgPath: "assets/images/bts songs/boy with luv.jpeg",
  name: "Boy With Luv",
  artist: "BTS",
  audioPath: "assets/audio/songs/Boy With Luv _feat. Halsey_ - BTS.mp3"),
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
                                  builder: (context) => KpopDetail()),
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
                  child: Text("Kpop Hits",
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
                    itemCount: kpopSongs.length,
                    itemBuilder: (_, index) {
                      final song = kpopSongs[index];
                      final isCurrent = currentlyPlayingIndex == index;

                      return ListTile(
                        leading: Image.asset(song.imgPath),
                        title: Text(song.name,
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text(song.artist,
                            style: TextStyle(color: Colors.grey)),
                        trailing: IconButton(
                          icon: Icon(
                            isCurrent && isPlaying
                                ? Icons.pause_circle
                                : Icons.play_circle,
                            color: Colors.green,
                            size: 35,
                          ),
                          onPressed: () async {
                            if (isCurrent && isPlaying) {
                              await _audioPlayer.pause();
                              setState(() {
                                isPlaying = false;
                              });
                              Provider.of<SongProvider>(context, listen: false).clearSong();
                            } else {
                              await _audioPlayer.setAsset(song.audioPath);
                              await _audioPlayer.play();
                              setState(() {
                                currentlyPlayingIndex = index;
                                isPlaying = true;
                              });
                              Provider.of<SongProvider>(context, listen: false).playSong(song);

                            }
                          },
                        ),
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
