import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spotify_clone/domin/app_colors.dart';
import 'package:spotify_clone/domin/ui_helper.dart';
import 'package:spotify_clone/ui/dashboard/navigations/library/settings_nav_page.dart';

import '../library_bottom_nav_page.dart';

class MyProfileNavPage extends StatefulWidget {
  String ProfilePicPath="assets/images/profile.webp";
  MyProfileNavPage({required this.ProfilePicPath});

  @override
  State<MyProfileNavPage> createState() => _MyProfileNavPageState();
}

class _MyProfileNavPageState extends State<MyProfileNavPage> {
  List<Map<String, dynamic>> mPlaylists =[
    {
      "title" : "Comfort",
      "Likes" : "7 likes",
      "thumbGroup" : [
        "assets/images/btswings.jpeg",
        "assets/images/taylor lover.jpeg",
        "assets/images/coldplay img.jpeg",
        "assets/images/3rd row/sleep.jpeg",
      ],
    },
    {
      "title" : "Study",
      "Likes" : "11 likes",
      "thumbGroup" : [
        "assets/images/billie eilish img.jpeg",
        "assets/images/lana del rey img.jpeg",
        "assets/images/rihanna img.jpeg",
        "assets/images/dua lipa img.jpeg",
      ],
    },
    {
      "title" : "RoadTrip",
      "Likes" : "10 likes",
      "thumbGroup" : [
        "assets/images/v img.jpeg",
        "assets/images/jungkook img.jpeg",
        "assets/images/jhope img.jpeg",
        "assets/images/jin img.jpeg",
      ],
    }
  ];

  List<String> playlistThumbnailPath = [

  ];

  PaletteGenerator? paletteGenerator;

  @override
  void initState() {
    super.initState();
    initializePaletteGenerator();
  }
  void initializePaletteGenerator()async{
    paletteGenerator= await getColorPalette(widget.ProfilePicPath);
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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                paletteGenerator!= null? HSLColor.fromColor(paletteGenerator!.dominantColor!.color).withLightness(0.25).toColor(): Color(0XFFF48FB1),
                      Colors.black,
                    ],
                    stops: [0, 1.0],
                    begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  mSpacer(),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white,),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LibraryBottomNavPage()),
                              );
                            },

                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SettingsNavPage()),
                              );
                            },
                            child: Icon(Icons.more_horiz, color: Colors.white, size: 21),
                          ),

                        ],
                      ),
                    ),
                  ),

                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                          image: AssetImage(widget.ProfilePicPath))
                    ),
                  ),
                  mSpacer(),
                  ElevatedButton(onPressed: (){}, child: Text("Edit Profile"), style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF616161), foregroundColor: Colors.white),),
                  mSpacer(mHeight: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("23",style: TextStyle(color: Colors.white,fontSize: 16),),
                          Text("PLAYLIST",style: TextStyle(color: Colors.grey,fontSize: 12),)
                        ],
                      ),
                      Column(
                        children: [
                          Text("58",style: TextStyle(color: Colors.white,fontSize: 16),),
                          Text("FOLLOWERS",style: TextStyle(color: Colors.grey,fontSize: 12),)
                        ],
                      ),
                      Column(
                        children: [
                          Text("43",style: TextStyle(color: Colors.white,fontSize: 16),),
                          Text("FOLLOWING",style: TextStyle(color: Colors.grey,fontSize: 12),)
                        ],
                      ),
                    ],
                  ),
                  mSpacer(mHeight: 16),

                ],
              ),
            ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all( 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Playlists",style: TextStyle(color: Colors.white,fontSize: 20),),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: mPlaylists.length,
                    itemBuilder: (_,index){
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SizedBox(
                        width: 58,
                        height: 58,
                        child: Wrap(
                          children: (mPlaylists[index]["thumbGroup"]as List<String>).map((eachImg) => Container(
                            width: 29,
                          height: 29,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(eachImg))
                          ),
                        )).toList(),),
                      ),
                      title: Text("${mPlaylists[index]["title"]}", style: TextStyle(color: Colors.white,fontSize: 15),),
                      subtitle: Text("${mPlaylists[index]["Likes"]}",style: TextStyle(color: Colors.grey,fontSize: 13)),
                      trailing: Icon(Icons.chevron_right_sharp, color: Colors.grey,size: 30,),
                    );
                    }),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("See all Playlists", style: TextStyle(color: Colors.white,fontSize: 15),),
                trailing: Icon(Icons.chevron_right_sharp, color: Colors.grey,size: 30,),
              ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
