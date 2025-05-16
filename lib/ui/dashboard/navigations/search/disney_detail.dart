import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domin/app_colors.dart';
import 'package:spotify_clone/domin/ui_helper.dart';

import 'disney_music_details.dart';

class DisneyDetail extends StatelessWidget {

  List<Map<String,dynamic>> mRecentlyPlayedList=[
    {"imgPath": "assets/images/disney/disney play.jpeg",
      "name": "disney playlist"
    },{"imgPath": "assets/images/disney.jpeg",
      "name": "top frozen play"
    },{"imgPath": "assets/images/disney/disney play1.jpeg",
      "name": "top disney"
    },{"imgPath": "assets/images/disney/disney playyy.jpeg",
      "name": "top 10 hits"
    },
  ];
  List<Map<String,dynamic>> mEditorPicksUI=[
    {"imgPath": "assets/images/spotify blend 1.png",
      "name": "disney blend"
    },{"imgPath": "assets/images/disney/disney blend.jpeg",
      "name": "disney top blend"
    },
  ];
  List<Map<String,dynamic>> mMyTopFavs = [
    {"imgPath": "assets/images/disney/disney play2.jpeg", "name": "disney hits"},
    {"imgPath": "assets/images/disney/disney play3.jpeg", "name": "disney top playlist"},
    {"imgPath": "assets/images/disney/disney play4.jpeg", "name": "disney princess playist"},
    {"imgPath": "assets/images/disney/disney play5.jpeg", "name": "Frozen most played"},
    {"imgPath": "assets/images/disney/disney play6.jpeg", "name": "top disney playlist"},
  ];
  List<Map<String,dynamic>> mYourGenre = [
    {"imgPath": "assets/images/disney/disney play7.jpeg", "name": "story of snow white"},
    {"imgPath": "assets/images/disney/disney play8.jpeg", "name": "tangled plsylist"},
    {"imgPath": "assets/images/disney/disney play9.jpeg", "name": "ultimate disney"},
    {"imgPath": "assets/images/disney/disney playyy.jpeg", "name": "top 10 fairy tales"},
    {"imgPath": "assets/images/disney/disney play6.jpeg", "name": "hit playlist"},
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
          title: Text("Dreamy Disney",style: TextStyle(color: Colors.white),),
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
                      builder: (_) => DisneyMusicDetails(
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
