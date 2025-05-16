import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/domin/app_colors.dart';
import 'package:spotify_clone/domin/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/my_compact_music_player_widget.dart';
import 'package:spotify_clone/ui/dashboard/navigations/home_bottom_nav_page.dart';
import 'package:spotify_clone/ui/dashboard/navigations/library/my_profile_nav_page.dart';
import 'package:spotify_clone/ui/dashboard/navigations/library/settings_nav_page.dart';
import 'package:spotify_clone/ui/dashboard/navigations/library_bottom_nav_page.dart';
import 'package:spotify_clone/ui/dashboard/navigations/search_bottom_nav_page.dart';

import 'navigations/album_details_page.dart';
import 'navigations/search/comfort_detail.dart';
import 'navigations/search/disney_detail.dart';
import 'navigations/search/hindi_detail.dart';
import 'navigations/search/kdrama_detail.dart';
import 'navigations/search/kdrama_ost_details.dart';
import 'navigations/search/kpop_detail.dart';
import 'navigations/search/kpop_music_detail.dart';
import 'navigations/search/love_detail.dart';
import 'navigations/search/sleep_detail.dart';
import 'navigations/search/trending_detail.dart';
import 'navigations/songAlbumDetails/SongProvider.dart';

class NowPlayingScreen extends StatefulWidget {
  const NowPlayingScreen({super.key});

  @override
  State<NowPlayingScreen> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<NowPlayingScreen> {
  PaletteGenerator? paletteGenerator;
  double currentValue=34.0;
  bool isPlaying=false;
  String? lastSongPath;



  @override
  void initState() {
    super.initState();
  }

  initializeColorPalette(String imgPath) async {
    final generatedPalette = await getColorPalette(imgPath);
    if (mounted) {
      setState(() {
        paletteGenerator = generatedPalette;
      });
    }
  }


  int SelectedBottomIndex= 0;
  List<Widget> mBottomNavPage = [
    HomeBottomNavPage(),
    SearchBottomNavPage(),
    LibraryBottomNavPage(),
    MyProfileNavPage(ProfilePicPath: 'assets/images/profile.webp'),
    AlbumDetailsPage( AlbumPicPath: 'assets/images/1st row/bts bts.jpeg',),
    SettingsNavPage(),
  ];


  @override
  Widget build(BuildContext context) {
    final songProvider = Provider.of<SongProvider>(context);
    final currentImagePath = songProvider.currentSong?.imgPath ?? "assets/images/BTS img.jpeg";

    if (currentImagePath != lastSongPath) {
      lastSongPath = currentImagePath;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        initializeColorPalette(currentImagePath);
      });
    }
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 73.0),
              child: mBottomNavPage[SelectedBottomIndex],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context, builder: (_){
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end:Alignment.bottomCenter ,
                                stops: [0.16,1.0],
                                colors:[
                                  HSLColor.fromColor(paletteGenerator!.dominantColor!.color).withLightness(0.34).toColor(),
                                  Colors.black87,
                                ])
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                mSpacer(
                                    mHeight: 25
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        child: SvgPicture.asset("assets/svg/Down.svg",width: 30, height:30,color: Colors.white,),
                                        onTap: (){
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Text("This is BTS", style: TextStyle(color: Colors.white, fontSize: 16),),
                                      Icon(Icons.more_horiz, color: Colors.white,size: 21,)
                                    ],
                                  ),
                                ),
                                mSpacer(mHeight: 16),
                                Padding(padding: EdgeInsets.all(20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(11),
                                    child: SizedBox(
                                      height: 370,
                                      width: 370,
                                      child: Image.asset(songProvider.currentSong?.imgPath ?? "assets/images/BTS img.jpeg",
                                        fit: BoxFit.cover,),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    ListTile(
                                      title: Text( songProvider.currentSong?.name ?? "For Youth",
                                        maxLines: 1,
                                        softWrap: false,),
                                      subtitle: Text(songProvider.currentSong?.artist ?? "BTS",),
                                      titleTextStyle: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold, overflow: TextOverflow.fade),
                                      subtitleTextStyle: TextStyle(color: Colors.grey,fontSize: 18),
                                      trailing: Icon(Icons.favorite_border,color: Colors.white, size: 26,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: StatefulBuilder(
                                        builder: (_, ss) {
                                          return SliderTheme(
                                            data: SliderThemeData(
                                                overlayShape: SliderComponentShape.noOverlay
                                            ),
                                            child: Slider(
                                              activeColor: Colors.green,
                                              thumbColor:Colors.white,
                                              inactiveColor: Colors.white24,
                                              min: 0,
                                              max: 100,
                                              value: currentValue,
                                              onChanged: (value) {
                                                ss(() {
                                                  currentValue = value;
                                                });
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16, right: 16),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("0:38",style: TextStyle(color: Colors.grey, fontSize: 14),),
                                          Text("-1:18",style: TextStyle(color: Colors.grey, fontSize: 14),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgPicture.asset("assets/svg/Shuffle-1.svg"),
                                          Icon(Icons.skip_previous_sharp, color: Colors.white, size: 40,),
                                          StatefulBuilder(
                                              builder: (context, ss) {
                                                return InkWell(
                                                    onTap: () {
                                                      isPlaying = ! isPlaying;
                                                      ss(() {
        
                                                      });
                                                    },
                                                    child: Icon(isPlaying
                                                        ? Icons
                                                        .pause_circle_filled_sharp
                                                        : Icons.play_circle_fill_sharp,
                                                      color: Colors.white, size: 70,));
                                              }
                                          ),
                                          Icon(Icons.skip_next_sharp, color: Colors.white, size: 40,),
                                          SvgPicture.asset("assets/svg/Repeat-1.svg",color: AppColors.primaryColor,),
        
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(Icons.bluetooth,color: Colors.green,size: 14,),
                                              Text("BEATSPILL+",style: TextStyle(color: Colors.green,fontSize: 12,
                                              ),
                                              ),
                                            ],
                                          ),
                                          SvgPicture.asset("assets/svg/Share-1.svg",width: 25, height: 25,),
                                          Icon(Icons.playlist_play_sharp, color: Colors.white, size: 35,),
                                        ],
                                      ),
                                    )
        
                                  ],
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                height: 59,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.teal,
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(11))
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Text("Lyrics",style: TextStyle(color: Colors.white,fontSize: 20),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 7),
                                        width:60,
                                        child: Row(
                                          children: [
                                            Text("MORE",style: TextStyle(color: Colors.white,fontSize: 11),),
                                            SvgPicture.asset("assets/svg/Vector zoom.svg"),
                                          ],
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.black54,
                                            borderRadius: BorderRadius.circular(100)
                                        ),
                                      )
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    });
                  },
                  child: SafeArea(
                    child: MyCompactMusicPlayerWidget(audioPlayer:  songProvider.audioPlayer,
                    ),
                  ),
                ))
          ],
        ),
      ),
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: SelectedBottomIndex,
          iconSize: 16,
          selectedLabelStyle: TextStyle(color: AppColors.whiteColor),
          unselectedLabelStyle: TextStyle(color: AppColors.greyColor),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: AppColors.secondaryColor,
          onTap: (value){
            SelectedBottomIndex=value;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/png/Home_outline.png',width: 20,height: 20,color: Colors.grey, ),
              label: "Home",
              activeIcon: Image.asset('assets/png/Home_Solid.png',width: 20,height: 20, color: Colors.white),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/png/Search_Solid.png',width: 20,height: 20, color: Colors.grey),
              label: "Search",
              activeIcon: Image.asset('assets/png/Search_Solid.png',width: 20,height: 20, color: Colors.white),

            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/png/Library_Solid.png',width: 20,height: 20, color: Colors.grey),
              label: "Library",
              activeIcon: Image.asset('assets/png/Library_Solid.png',width: 20,height: 20, color: Colors.white),

            ),
          ]),
    );
  }
}


