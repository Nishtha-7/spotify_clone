import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/domin/app_colors.dart';
import 'package:spotify_clone/domin/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/album_row_widget.dart';
import 'package:spotify_clone/ui/dashboard/navigations/search/comfort_detail.dart';
import 'package:spotify_clone/ui/dashboard/navigations/search/disney_detail.dart';
import 'package:spotify_clone/ui/dashboard/navigations/search/hindi_detail.dart';
import 'package:spotify_clone/ui/dashboard/navigations/search/kdrama_detail.dart';
import 'package:spotify_clone/ui/dashboard/navigations/search/kpop_detail.dart';
import 'package:spotify_clone/ui/dashboard/navigations/search/love_detail.dart';
import 'package:spotify_clone/ui/dashboard/navigations/search/sleep_detail.dart';
import 'package:spotify_clone/ui/dashboard/navigations/search/trending_detail.dart';
import 'package:spotify_clone/ui/dashboard/navigations/search/wedding_detail.dart';

class SearchBottomNavPage extends StatelessWidget {
  final List<Map<String, dynamic>> mTopGenreList = [
    {"imgPath": "assets/images/bts dyna album.png", "name": "K pop"},
    {"imgPath": "assets/images/kdrama ost.jpeg", "name": "K Drama\nOST"},
    {"imgPath": "assets/images/Coastin.png", "name": "Mood"},
    {"imgPath": "assets/images/western.jpeg", "name": "Western"},
  ];
  final List<Map<String, dynamic>> mpopularPodcastsList = [
    {"imgPath": "assets/images/love.jpeg", "name": "Love"},
    {"imgPath": "assets/images/hiphop.jpeg", "name": "Hip-Hop"},
    {"imgPath": "assets/images/comedy.jpeg", "name": "Comedy"},
    {"imgPath": "assets/images/chill.jpeg", "name": "Chill"},
  ];
  final List<Map<String, dynamic>> mbrowseAllList = [
    {"imgPath": "assets/images/hindi.jpeg", "name": "Hindi"},
    {"imgPath": "assets/images/sabrina carpenter img.jpeg", "name": "Trending"},
    {"imgPath": "assets/images/podcast chart.jpeg", "name": "Podcast\nCharts"},
    {"imgPath": "assets/images/3rd row/sleep.jpeg", "name": "Sleep"},
    {"imgPath": "assets/images/workout.jpeg", "name": "Workout"},
    {"imgPath": "assets/images/indie pop.jpeg", "name": "Indie pop"},
    {"imgPath": "assets/images/jazz.jpeg", "name": "Jazz"},
    {"imgPath": "assets/images/disney.jpeg", "name": "Disney"},
    {"imgPath": "assets/images/3rd row/comfort.jpeg", "name": "Comfort"},
    {"imgPath": "assets/images/wedding playlist.jpeg", "name": "Wedding"},
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              mSpacer(),
              titleUI(),
              mSpacer(mHeight: 14),
              searchBarUI(),
              mSpacer(mHeight: 14),
              topGenres(context),
              mSpacer(mHeight: 14),
              popularPodcasts(context),
              mSpacer(mHeight: 14),
              browseAll(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Search', style: TextStyle(color: Colors.white, fontSize: 23)),
          mSpacer(mWidth: 230),
          Icon(Icons.camera_alt_outlined, size: 27, color: Colors.white),
          mSpacer(mWidth: 20),
        ],
      ),
    );
  }

  Widget searchBarUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        child: TextField(
          cursorColor: AppColors.primaryColor,
          autofocus: false,
          decoration: InputDecoration(
            hintText: "Artists, songs or podcasts",
            hintStyle: TextStyle(color: Colors.black),
            border: InputBorder.none,
            prefixIconConstraints: BoxConstraints(minWidth: 25, maxHeight: 25),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.search, size: 30),
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget topGenres(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your top genres', style: TextStyle(color: Colors.white, fontSize: 17)),
          mSpacer(),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: mTopGenreList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final genreName = mTopGenreList[index]['name'];
                return GestureDetector(
                  onTap: () {
                    if (genreName == 'K pop') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => KpopDetail()),
                      );
                    }else if (genreName == 'K Drama\nOST') {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => KdramaDetail()),
                      );
                    }
                  },
                  child: AlbumRowWidget(
                    thumbnailPath: mTopGenreList[index]['imgPath'],
                    albumName: genreName,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }


  Widget popularPodcasts(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Popular Podcast categories', style: TextStyle(color: Colors.white, fontSize: 17)),
          mSpacer(),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: mpopularPodcastsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    if (mpopularPodcastsList[index]['name'] == 'Love') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoveDetail()),
                      );
                    }
                  },
                  child: AlbumRowWidget(
                    thumbnailPath: mpopularPodcastsList[index]['imgPath'],
                    albumName: mpopularPodcastsList[index]['name'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }



  Widget browseAll(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Browse all', style: TextStyle(color: Colors.white, fontSize: 17)),
          mSpacer(),
          GridView.builder(
            itemCount: mbrowseAllList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 16 / 9,
              crossAxisCount: 2,
              mainAxisSpacing: 11,
            ),
            itemBuilder: (_, index) {
              final item = mbrowseAllList[index];
              return GestureDetector(
                onTap: () {
                  if (item['name'] == 'Hindi') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HindiDetail()),
                    );
                  }else if (item['name'] == 'Trending') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TrendingDetail()),
                    );
                  }else if (item['name'] == 'Sleep') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SleepDetail()),
                    );
                  }else if (item['name'] == 'Disney') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DisneyDetail()),
                    );
                  }else if (item['name'] == 'Comfort') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComfortDetail()),
                    );
                  }
                  else if (item['name'] == 'Wedding') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WeddingDetail()),
                    );
                  }
                },
                child: AlbumRowWidget(
                  thumbnailPath: mbrowseAllList[index]['imgPath'],
                  albumName: mbrowseAllList[index]['name'],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
