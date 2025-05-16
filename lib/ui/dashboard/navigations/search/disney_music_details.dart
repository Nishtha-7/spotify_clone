import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../../../../domin/ui_helper.dart';
import '../songAlbumDetails/SongProvider.dart';
import '../songAlbumDetails/song.dart';
import '../songAlbumDetails/song_tile.dart';
import 'disney_detail.dart';

class DisneyMusicDetails extends StatefulWidget {
  String AlbumPicPath = "assets/images/1st row/bts bts.jpeg";

  DisneyMusicDetails({required this.AlbumPicPath});

  @override
  State<DisneyMusicDetails> createState() => _AlbumDetailsPageState();
}

class _AlbumDetailsPageState extends State<DisneyMusicDetails> {
  late AudioPlayer _audioPlayer;

  int? currentlyPlayingIndex;
  bool isPlaying = false;

  final List<Song> disneySongs = [
    Song(
        imgPath: "assets/images/disney/disney play5.jpeg",
        name: "Let it Go",
        artist: "Idina Menzel",
        audioPath: "assets/audio/songs/Let It Go - Idina Menzel (1).mp3"),
    Song(
        imgPath: "assets/images/disney/frozen.jpeg",
        name: "Into the Unknown",
        artist: "Idina Menzel, AURORA",
        audioPath: "assets/audio/songs/Into the Unknown  Idina Menzel.mp3"),
    Song(
        imgPath: "assets/images/disney/moana ost.jpeg",
        name: "How Far I'll Go",
        artist: "Alessia Cara",
        audioPath: "assets/audio/songs/How Far I'll Go  Auli'i Cravalho.mp3"),
    Song(
        imgPath: "assets/images/disney/tangles.jpeg",
        name: "When Will My Life Begin",
        artist: "Mandy Moore",
        audioPath:
            "assets/audio/songs/When Will My Life Begin-Mandy Moore.mp3"),
    Song(
        imgPath: "assets/images/disney/disney play5.jpeg",
        name: "Do You Want To Build a Snowman",
        artist: "Kristen Bell, Agatha Lee Monn",
        audioPath:
            "assets/audio/songs/Do You Want to Build a Snowman- Kristen Bell.mp3"),
    Song(
        imgPath: "assets/images/disney/speechless.jpeg",
        name: "Speechless",
        artist: "Naomi Scott",
        audioPath: "assets/audio/songs/Speechless (Full) Naomi Scott.mp3"),
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
                                  builder: (context) => DisneyDetail()),
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
                  child: Text("Disney Playlist",
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
                    itemCount: disneySongs.length,
                    itemBuilder: (_, index) {
                      return SongTile(
                        song: disneySongs[index],
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
