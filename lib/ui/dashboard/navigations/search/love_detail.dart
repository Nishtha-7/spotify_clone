import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domin/app_colors.dart';
import 'package:spotify_clone/domin/ui_helper.dart';

import 'love_music_detail.dart';

class LoveDetail extends StatelessWidget {

  List<Map<String,dynamic>> mRecentlyPlayedList=[
    {"imgPath": "assets/images/love/love1.jpeg",
      "name": "love song playlist"
    },{"imgPath": "assets/images/love/love3.jpeg",
      "name": "top 50 love songs"
    },{"imgPath": "assets/images/love/love4.jpeg",
      "name": "love songs"
    },{"imgPath": "assets/images/love/love songs.jpeg",
      "name": "top hits"
    },
  ];
  List<Map<String,dynamic>> mEditorPicksUI=[
    {"imgPath": "assets/images/spotify blend 4.png",
      "name": "love blend"
    },{"imgPath": "assets/images/love/love blend.jpeg",
      "name": "Love top blend for you"
    },
  ];
  List<Map<String,dynamic>> mMyTopFavs = [
    {"imgPath": "assets/images/love/love5.jpeg", "name": "hindi love playlist"},
    {"imgPath": "assets/images/love/love2.jpeg", "name": "top bollywood love songs"},
    {"imgPath": "assets/images/love/love6.jpeg", "name": "soft love songs"},
    {"imgPath": "assets/images/love/love7.jpeg", "name": "top hits play"},
    {"imgPath": "assets/images/love/love8.jpeg", "name": "love covers"},
  ];
  List<Map<String,dynamic>> mYourGenre = [
    {"imgPath": "assets/images/love/love8.jpeg", "name": "love covers"},
    {"imgPath": "assets/images/love/love9.jpeg", "name": "old love songs"},
    {"imgPath": "assets/images/love/love10.jpeg", "name": "10s Love Songs"},
    {"imgPath": "assets/images/love/love11.jpeg", "name": "Indie love"},
    {"imgPath": "assets/images/love/love5.jpeg", "name": "top hindi love aom=ngs"},
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade700,
          elevation: 0,
          centerTitle: true,
          title: Text("Love Playlists",style: TextStyle(color: Colors.white),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mSpacer(mHeight: 16),
              UniquelyYours(),
              UniquelyYoursUI(),
              mSpacer(mHeight: 20),
              editorPicksUI(),
              mSpacer(mHeight: 20),
              MyTopFavs(),
              mSpacer(mHeight: 15),
              YourGenre(),
            ],
          ),
        ),
      ),
    );
  }
  Widget UniquelyYours(){
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ Text('Uniquely Yours',style: TextStyle(color: Colors.white, fontSize: 23),),

            ],
          ),
        )
      ],
    );
  }

  Widget UniquelyYoursUI(){
    return SizedBox(
      height: 140,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: mRecentlyPlayedList.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoveMusicDetail(
                        AlbumPicPath: mRecentlyPlayedList[index]['imgPath'],
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Image.asset(mRecentlyPlayedList[index]['imgPath'], width: 100, height: 100,),
                    mSpacer(mHeight: 8),
                    Text(mRecentlyPlayedList[index]['name'], style: TextStyle(color: Colors.white, fontSize: 13),)
                  ],
                ),
              ),
            );
          }),
    );
  }


  Widget editorPicksUI(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: Text("Made For Us", style: TextStyle(color: Colors.white,
              fontSize: 22),),
        ),
        mSpacer(mHeight: 7),
        SizedBox(
          height: 200,
          child: ListView.builder(

              scrollDirection: Axis.horizontal,
              itemCount: mEditorPicksUI.length,
              itemBuilder: (_,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(mEditorPicksUI[index]['imgPath'],width: 150,height: 150,),
                      mSpacer(mHeight: 8),
                      Text(mEditorPicksUI[index]['name'],style: TextStyle(color: Colors.grey,fontSize: 13),)
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
  Widget MyTopFavs(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: Text("My Top Favs", style: TextStyle(color: Colors.white,
              fontSize: 22),),
        ),
        mSpacer(mHeight: 7),
        SizedBox(
          height: 200,
          child: ListView.builder(

              scrollDirection: Axis.horizontal,
              itemCount: mMyTopFavs.length,
              itemBuilder: (_,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(mMyTopFavs[index]['imgPath'],width: 150,height: 150,),
                      mSpacer(mHeight: 8),
                      Text(mMyTopFavs[index]['name'],style: TextStyle(color: Colors.grey,fontSize: 13),)
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
  Widget YourGenre(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: Text("Your Genre Mixes", style: TextStyle(color: Colors.white,
              fontSize: 22),),
        ),
        mSpacer(mHeight: 7),
        SizedBox(
          height: 200,
          child: ListView.builder(

              scrollDirection: Axis.horizontal,
              itemCount: mYourGenre.length,
              itemBuilder: (_,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(mYourGenre[index]['imgPath'],width: 150,height: 150,),
                      mSpacer(mHeight: 8),
                      Text(mYourGenre[index]['name'],style: TextStyle(color: Colors.grey,fontSize: 13),)
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

}
