import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/ui/dashboard/navigations/search/trending_detail.dart';

import '../../../../domin/ui_helper.dart';
import '../songAlbumDetails/SongProvider.dart';
import '../songAlbumDetails/song.dart';

class TrendingMusicDetails extends StatefulWidget {
  String AlbumPicPath = "assets/images/1st row/bts bts.jpeg";

  TrendingMusicDetails({required this.AlbumPicPath});

  @override
  State<TrendingMusicDetails> createState() => _AlbumDetailsPageState();
}

class _AlbumDetailsPageState extends State<TrendingMusicDetails> {
  late AudioPlayer _audioPlayer;

  int? currentlyPlayingIndex;
  bool isPlaying = false;

  final List<Song> trendingSongs = [
    Song(
        imgPath: "assets/images/sabrina carpenter img.jpeg",
        name: "Please Please Please",
        artist: "Sabrina Carpenter",
        audioPath:
            "assets/audio/songs/Please Please Please - Sabrina Carpenter.mp3"),
    Song(
        imgPath: "assets/images/comfort/mine love mine all mine.jpeg",
        name: "Mine Love Mine All Mine",
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
        imgPath: "assets/images/sabrina carpenter img.jpeg",
        name: "Espresso",
        artist: "Sabrina Carpenter",
        audioPath: "assets/audio/songs/Espresso - Sabrina Carpenter.mp3"),
    Song(
        imgPath: "assets/images/taylor lover.jpeg",
        name: "Cruel Summer",
        artist: "Taylor Swift",
        audioPath: "assets/audio/songs/Cruel Summer - Taylor Swift.mp3"),
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
                                  builder: (context) => TrendingDetail()),
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
                  child: Text("Trendy Song Playlist",
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
                    itemCount: trendingSongs.length,
                    itemBuilder: (_, index) {
                      final song = trendingSongs[index];
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
