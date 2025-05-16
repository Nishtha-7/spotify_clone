import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domin/app_colors.dart';
import 'package:spotify_clone/domin/ui_helper.dart';
import 'package:spotify_clone/ui/dashboard/navigations/search/sleep_music_details.dart';

class SleepDetail extends StatelessWidget {

  List<Map<String,dynamic>> mRecentlyPlayedList=[
    {"imgPath": "assets/images/sleep/sep4.jpeg",
      "name": "lofi sleep"
    },{"imgPath": "assets/images/sleep/sleep 1.jpeg",
      "name": "sleep playlist"
    },{"imgPath": "assets/images/sleep/sleep 2.jpeg",
      "name": "deep sleep"
    },{"imgPath": "assets/images/sleep/sleep3.jpeg",
      "name": "sleep fuity"
    },
  ];
  List<Map<String,dynamic>> mEditorPicksUI=[
    {"imgPath": "assets/images/spotify blend 1.png",
      "name": "sleep blend"
    },{"imgPath": "assets/images/sleep/sleep7.jpeg",
      "name": "50 deep sleep blend"
    },
  ];
  List<Map<String,dynamic>> mMyTopFavs = [
    {"imgPath": "assets/images/sleep/sleep 5.jpeg", "name": "sleep songs"},
    {"imgPath": "assets/images/sleep/sleep6.webp", "name": "insomnia cure"},
    {"imgPath": "assets/images/sleep/sleep 6.jpeg", "name": "top sleep plays"},
    {"imgPath": "assets/images/sleep/sleep8.jpeg", "name": "best sleep songs"},
    {"imgPath": "assets/images/sleep/sleep10.jpeg", "name": "sleep and relax"},
  ];
  List<Map<String,dynamic>> mYourGenre = [
    {"imgPath": "assets/images/sleep/sleep9.jpeg", "name": "disney sleep"},
    {"imgPath": "assets/images/sleep/sleep11.jpeg", "name": "pop for sleep"},
    {"imgPath": "assets/images/sleep/sleep3.jpeg", "name": "sleep hits"},
    {"imgPath": "assets/images/sleep/sleep6.webp", "name": "sleep night"},
    {"imgPath": "assets/images/sleep/sleep8.jpeg", "name": "top sleep playlist"},
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
          title: Text("Soft sleep playlist",style: TextStyle(color: Colors.white),),
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
                      builder: (_) => SleepMusicDetails(
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
