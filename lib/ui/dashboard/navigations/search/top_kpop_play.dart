import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spotify_clone/domin/app_colors.dart';
import 'package:spotify_clone/domin/ui_helper.dart';
import 'package:spotify_clone/ui/dashboard/navigations/search_bottom_nav_page.dart';

import '../library_bottom_nav_page.dart';
import 'kpop_detail.dart';


class TopKpopPlay extends StatefulWidget {
  String AlbumPicPath="assets/images/1st row/bts bts.jpeg";


  TopKpopPlay({required this.AlbumPicPath, required albumPicPath});

  @override
  State<TopKpopPlay> createState() => _AlbumDetailsPageState();
}

class _AlbumDetailsPageState extends State<TopKpopPlay> {
  final List<Map<String, dynamic>> albumSongThumbnailPath = [
    {"imgPath": "assets/images/bts songs/butter.jpeg", "name": "Butter", "artist":"BTS"},
    {"imgPath": "assets/images/bts songs/permission to dance.png", "name": "Permission to Dance","artist":"BTS"},
    {"imgPath": "assets/images/bts dyna album.png", "name": "Dynamite","artist":"BTS"},
    {"imgPath": "assets/images/kpop/abcd.jpeg", "name": "ABCD","artist":"NAYEON"},
    {"imgPath": "assets/images/kpop/antifragile.png", "name": "Antifragile","artist":"LE SSERAFIM"},
    {"imgPath": "assets/images/kpop/igloo.jpeg", "name": "Igloo", "artist":"KISS OF LIFE"},
    {"imgPath": "assets/images/kpop/strategy.jpeg", "name": "Strategy","artist":"TWICE"},
    {"imgPath": "assets/images/kpop/crazy.jpeg", "name": "Crazy","artist":"LE SSERAFIM"},
    {"imgPath": "assets/images/bts songs/boy with luv.jpeg", "name": "Boy With Luv", "artist":"BTS"},
  ];

  PaletteGenerator ? paletteGenerator;

  @override
  void initState() {
    super.initState();
    initializePaletteGenerator();
  }

  void initializePaletteGenerator() async {
    paletteGenerator= await getColorPalette(widget.AlbumPicPath);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.4,
              decoration:BoxDecoration(
                  gradient: LinearGradient(
                    colors:[
                      paletteGenerator!= null? HSLColor.fromColor(paletteGenerator!.colors.toList()[2]).withLightness(0.3).toColor(): Colors.black,
                      Colors.black,
                    ],
                    stops: [0, 1.0],
                    begin: Alignment.topCenter,
                    end:  Alignment.bottomCenter,
                  )
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SafeArea(
                          child: InkWell(
                            child: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => KpopDetail()),
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
                            image: AssetImage(widget.AlbumPicPath))
                    ),
                  )
                ],
              )
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Top BTS Plays",style: TextStyle(color: Colors.white,fontSize: 30),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("77,935,256 saves . 1h 3min", style: TextStyle(color: Colors.grey),),
                  ),
                  mSpacer(),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        shrinkWrap: true,
                        itemCount: albumSongThumbnailPath.length,
                        itemBuilder: (_, index){
                          return ListTile(
                            leading: Image.asset(albumSongThumbnailPath[index]['imgPath'],),
                            title: Text(albumSongThumbnailPath[index]['name'], style: TextStyle(color: Colors.white),),
                            subtitle:  Text(albumSongThumbnailPath[index]['artist'], style: TextStyle(color: Colors.grey),),
                            trailing: Icon(Icons.more_horiz,color: Colors.grey,),
                          );
                        }),
                  )
                ],
              ))


        ],
      ),
    );
  }
}
