import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../../../../domin/ui_helper.dart';
import '../songAlbumDetails/SongProvider.dart';
import '../songAlbumDetails/song.dart';
import 'kdrama_detail.dart';

class KdramaOstDetails extends StatefulWidget {
  String AlbumPicPath = "assets/images/1st row/bts bts.jpeg";

  KdramaOstDetails({required this.AlbumPicPath, required String albumPicPath});

  @override
  State<KdramaOstDetails> createState() => _AlbumDetailsPageState();
}

class _AlbumDetailsPageState extends State<KdramaOstDetails> {
  late AudioPlayer _audioPlayer;

  int? currentlyPlayingIndex;
  bool isPlaying = false;

  final List<Song> kdramaSongs = [
    Song(
        imgPath: "assets/images/kdrama/future.jpeg",
        name: "Future",
        artist: "Red Velvet",
        audioPath: "assets/audio/songs/Future Red Velvet.mp3"),
    Song(
        imgPath: "assets/images/kdrama/kdrama ost playlsit.jpeg",
        name: "Our Beloved Summer",
        artist: "Kim Kyung Hee",
        audioPath: "assets/audio/songs/Our Beloved Summer - Kim Kyung Hee.mp3"),
    Song(
        imgPath: "assets/images/kdrama/spring spoon.jpeg",
        name: "Spring Snow",
        artist: "10CM",
        audioPath: "assets/audio/songs/Spring Snow  10CM.mp3"),
    Song(
        imgPath: "assets/images/kdrama/when life gives you tangerine.jpeg",
        name: "Midnight Walk",
        artist: "d.ear",
        audioPath: "assets/audio/songs/Midnight Walk - d.ear.mp3"),
    Song(
        imgPath: "assets/images/kdrama/christmas tree.jpeg",
        name: "Christmas Tree",
        artist: "V",
        audioPath: "assets/audio/songs/Christmas Tree V.mp3"),
    Song(
        imgPath: "assets/images/kdrama ost.jpeg",
        name: "Love Maybe",
        artist: "MeloMance",
        audioPath: "assets/audio/songs/love maybe-kdrama.mp3"),
    Song(
        imgPath: "assets/images/kdrama/all about you.jpeg",
        name: "All About You",
        artist: "TAEYEON",
        audioPath: "assets/audio/songs/All about you - TAEYEON.mp3"),
    Song(
        imgPath: "assets/images/kdrama/beautiful.jpeg",
        name: "Beautiful",
        artist: "Crush",
        audioPath: "assets/audio/songs/Beautiful - Crush.mp3"),
    Song(
        imgPath: "assets/images/kdrama/sonaki.jpeg",
        name: "Sonaki",
        artist: "ECLIPSE",
        audioPath: "assets/audio/songs/Sudden Shower  ECLIPSE.mp3"),
    Song(
        imgPath: "assets/images/kdrama/its you.jpeg",
        name: "It's You",
        artist: "Jeong Sewoon",
        audioPath: "assets/audio/songs/it's you-kdrama.mp3"),
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
                                  builder: (context) => KdramaDetail()),
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
                  child: Text("Kdrama OST Playlist",
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
                    itemCount: kdramaSongs.length,
                    itemBuilder: (_, index) {
                      final song = kdramaSongs[index];
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
