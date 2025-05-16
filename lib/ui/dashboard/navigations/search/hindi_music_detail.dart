import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../../../../domin/ui_helper.dart';
import '../songAlbumDetails/SongProvider.dart';
import '../songAlbumDetails/song.dart';
import 'hindi_detail.dart';

class HindiMusicDetail extends StatefulWidget {
  String AlbumPicPath = "assets/images/1st row/bts bts.jpeg";

  HindiMusicDetail({required this.AlbumPicPath});

  @override
  State<HindiMusicDetail> createState() => _AlbumDetailsPageState();
}

class _AlbumDetailsPageState extends State<HindiMusicDetail> {
  late AudioPlayer _audioPlayer;

  int? currentlyPlayingIndex;
  bool isPlaying = false;

  final List<Song> hindiSongs = [
    Song(
        imgPath: "assets/images/wedding/wedding 1.jpeg",
        name: "Punjabi Wedding Song",
        artist: "Vishal-Shekhar, Sunidhi Chauhan, Benny Dayal",
        audioPath:
            "assets/audio/songs/Punjabi Wedding Song  Vishal-Shekhar.mp3"),
    Song(
        imgPath: "assets/images/wedding/wedd.jpeg",
        name: "Wedding da Season",
        artist: "Mika Singh, Neha Kakkar, Amaal Malik",
        audioPath: "assets/audio/songs/Wedding Da Season - Mika Singh.mp3"),
    Song(
        imgPath: "assets/images/wedding/wedding 2.jpeg",
        name: "Kudmayi",
        artist: "Pritam, Shahid Mallya, Amitabh Bhattacharya",
        audioPath: "assets/audio/songs/Kudmayi - Pritam.mp3"),
    Song(
        imgPath: "assets/images/wedding/wedding 3.jpeg",
        name: "Raula",
        artist: "Pritam, Diljit Dosanjh, Neeti Mohan",
        audioPath: "assets/audio/songs/Raula - Pritam.mp3"),
    Song(
        imgPath: "assets/images/wedding/wedding 4.jpeg",
        name: "Nachne De Saare",
        artist: "Jasleen Royal Harhdeep Kaur,Aditya Sharma",
        audioPath: "assets/audio/songs/Nachde Ne Saare - Jasleen Royal.mp3"),
    Song(
        imgPath: "assets/images/wedding/wedding 5.jpeg",
        name: "Aaj Sajeya",
        artist: "Goldie Sohel",
        audioPath: "assets/audio/songs/Aaj Sajeya - Goldie Sohel.mp3"),
    Song(
        imgPath: "assets/images/wedding/wedding 6.jpeg",
        name: "Doli Saja Ke Rakhna",
        artist: "Lata Mangeshkar, Udit Narayan",
        audioPath:
            "assets/audio/songs/doli saja Ke Rakhna - Lata Mangeshkar.mp3"),
    Song(
        imgPath: "assets/images/wedding/wedding 7.jpeg",
        name: "Drama Queen",
        artist: "Vishal-Shekhar, Shreya Ghoshal, Vishal Dadlani",
        audioPath: "assets/audio/songs/Drama Queen Vishal-Shekhar.mp3"),
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
                                  builder: (context) => HindiDetail()),
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
                  child: Text("Best Hindi Hits",
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
                    itemCount: hindiSongs.length,
                    itemBuilder: (_, index) {
                      final song = hindiSongs[index];
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
