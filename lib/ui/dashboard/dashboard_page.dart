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
import 'package:spotify_clone/ui/dashboard/navigations/songAlbumDetails/SongProvider.dart';
import 'package:spotify_clone/ui/dashboard/navigations/album_details_page.dart';
import 'package:spotify_clone/ui/dashboard/playing_screen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  PaletteGenerator? paletteGenerator;
  double currentValue = 34.0;
  bool isPlaying = false;
  String? lastSongPath;



  @override
  void initState() {
    super.initState();
    initializeColorPalette();
  }

  initializeColorPalette() async {
    paletteGenerator = await getColorPalette("assets/images/BTS img.jpeg");
  }

  int SelectedBottomIndex = 0;

  List<Widget> mBottomNavPage = [
    HomeBottomNavPage(),
    SearchBottomNavPage(),
    LibraryBottomNavPage(),
    MyProfileNavPage(ProfilePicPath: 'assets/images/profile.webp'),
    AlbumDetailsPage(AlbumPicPath: 'assets/images/1st row/bts bts.jpeg'),
    SettingsNavPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentSong = Provider.of<SongProvider>(context).currentSong;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 73.0),
            child: mBottomNavPage[SelectedBottomIndex],
          ),

          // Compact Player Section
          Align(
            alignment: Alignment.bottomCenter,
            child: Consumer<SongProvider>(
              builder: (context, songProvider, _) {
                final song = songProvider.currentSong;
                if (song == null) return const SizedBox();

                  return SafeArea(
                    bottom: true,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const NowPlayingScreen()),
                          );
                        },
                          child: MyCompactMusicPlayerWidget(audioPlayer:  songProvider.audioPlayer,)

                      )
                  );

              },
            ),
          )
        ],
      ),
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: SelectedBottomIndex,
        iconSize: 16,
        selectedLabelStyle: const TextStyle(color: AppColors.whiteColor),
        unselectedLabelStyle: const TextStyle(color: AppColors.greyColor),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: AppColors.secondaryColor,
        onTap: (value) {
          SelectedBottomIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/png/Home_outline.png', width: 20, height: 20, color: Colors.grey),
            label: "Home",
            activeIcon: Image.asset('assets/png/Home_Solid.png', width: 20, height: 20, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/png/Search_Solid.png', width: 20, height: 20, color: Colors.grey),
            label: "Search",
            activeIcon: Image.asset('assets/png/Search_Solid.png', width: 20, height: 20, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/png/Library_Solid.png', width: 20, height: 20, color: Colors.grey),
            label: "Library",
            activeIcon: Image.asset('assets/png/Library_Solid.png', width: 20, height: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
