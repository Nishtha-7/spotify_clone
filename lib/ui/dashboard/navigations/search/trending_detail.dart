import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domin/app_colors.dart';
import 'package:spotify_clone/domin/ui_helper.dart';
import 'package:spotify_clone/ui/dashboard/navigations/search/trending_music_details.dart';

class TrendingDetail extends StatelessWidget {

  List<Map<String,dynamic>> mRecentlyPlayedList=[
    {"imgPath": "assets/images/trending/rend9.jpeg",
      "name": "trending playlist"
    },{"imgPath": "assets/images/trending/trebd12.png",
      "name": "2024 trends"
    },{"imgPath": "assets/images/trending/trend.png",
      "name": "top trend global"
    },{"imgPath": "assets/images/trending/trend1.jpeg",
      "name": "hindi trends"
    },
  ];
  List<Map<String,dynamic>> mEditorPicksUI=[
    {"imgPath": "assets/images/spotify blend 4.png",
      "name": "your fav blend"
    },{"imgPath": "assets/images/trending/trend blend.jpeg",
      "name": "trend blend"
    },
  ];
  List<Map<String,dynamic>> mMyTopFavs = [
    {"imgPath": "assets/images/trending/trend2.jpeg", "name": "top english hits"},
    {"imgPath": "assets/images/trending/trend3.jpeg", "name": "trendy songs"},
    {"imgPath": "assets/images/trending/trend4.jpeg", "name": "trend chart"},
    {"imgPath": "assets/images/trending/trend5.jpeg", "name": "Indie trend"},
    {"imgPath": "assets/images/trending/trend6.jpeg", "name": "trending hot hits"},
  ];
  List<Map<String,dynamic>> mYourGenre = [
    {"imgPath": "assets/images/trending/trend7.jpeg", "name": "trend house"},
    {"imgPath": "assets/images/trending/trend8.jpeg", "name": "top trendings"},
    {"imgPath": "assets/images/trending/trend10.jpeg", "name": "trends"},
    {"imgPath": "assets/images/trending/trend13.jpeg", "name": "trending top 50"},
    {"imgPath": "assets/images/trending/trend5.jpeg", "name": "Indie trends"},
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
          title: Text("Hot Trendings",style: TextStyle(color: Colors.white),),
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
                      builder: (_) => TrendingMusicDetails(
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
