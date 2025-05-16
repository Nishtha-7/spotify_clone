import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domin/app_colors.dart';
import 'package:spotify_clone/domin/ui_helper.dart';

class HomeBottomNavPage extends StatelessWidget {

  List<Map<String,dynamic>> mRecentlyPlayedList=[
    {"imgPath": "assets/images/taylor lover.jpeg",
      "name": "Cruel Summer"
    },{"imgPath": "assets/images/1st row/img12.png",
      "name": "Lana Del Rey"
    },{"imgPath": "assets/images/1st row/bts bts.jpeg",
      "name": "BTS"
    },{"imgPath": "assets/images/sabrina carpenter img.jpeg",
      "name": "Espresso"
    },
  ];
  List<Map<String,dynamic>> mReviewList=[
    {"imgPath": "assets/images/2nd row/Screen Shot 2021-12-07 at 14.11 1.png",
      "name": "Your top songs 2021)"
    },{"imgPath": "assets/images/2nd row/Screen Shot 2021-12-07 at 14.17 1.png",
      "name": "Your artist revealed"
    },
  ];
  List<Map<String,dynamic>> mEditorPicksUI=[
    {"imgPath": "assets/images/kdrama/kdrama playlist2.jpeg",
      "name": "Sunghoon, Gaho, PUNCH\n10CM, Jiho, WENDY"
    },{"imgPath": "assets/images/kpop/kpop playlist bts1.jpeg",
      "name": "BTS, Twice, Seventeen,\nLE SSERAFIM, TXT"
    },{"imgPath": "assets/images/hindi/boly play5.jpeg",
      "name": "Arijit Singh, Anurag Saikai,\nPritam, Vishal-Shekhar"
    },
  ];
  List<Map<String,dynamic>> mMyTopFavs = [
    {"imgPath": "assets/images/kdrama/IU Kdramaost.jpeg", "name": "Hotel Del Luna OST"},
    {"imgPath": "assets/images/billie eilish img.jpeg", "name": "Billie Eilish"},
    {"imgPath": "assets/images/disney/disney play2.jpeg", "name": "Best of Disney"},
    {"imgPath": "assets/images/1st row/img14.png", "name": "Indie Pop"},
    {"imgPath": "assets/images/trending/rend9.jpeg", "name": "Best of Western Music"},
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             RecentlyPlayedUI(),
              RecentlyPlayedListUI(),
              mSpacer(mHeight: 9),
              reviewUI(),
              mSpacer(mHeight: 22),
              mReviewListUI(),
              mSpacer(),
              editorPicksUI(),
              mSpacer(),
              MyTopFavs(),
            ],
          ),
        ),
      ),
    );
  }
  Widget RecentlyPlayedUI(){
    return  Column(
      children: [
      Padding(
        padding: const EdgeInsets.all(11.0),
        child: Row(
         children: [ Text('Recently played',style: TextStyle(color: Colors.white, fontSize: 23),),
           Spacer(),
           SvgPicture.asset("assets/svg/Vectorss-1.svg",width: 23,height: 23,),
           mSpacer(mWidth: 20),
           SvgPicture.asset("assets/svg/orientation lock-1.svg",width: 24,height: 24,),
           mSpacer(mWidth: 20),
           SvgPicture.asset("assets/svg/Settings-1.svg",width: 30,height: 30,),
         ],
        ),
      )
      ],
    );
  }

  Widget RecentlyPlayedListUI(){
    return SizedBox(
      height: 140,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: mRecentlyPlayedList.length,
          itemBuilder: (_,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0),
            child: Column(
              children: [
                Image.asset(mRecentlyPlayedList[index]['imgPath'],width: 100,height: 100,),
                mSpacer(mHeight: 8),
                Text(mRecentlyPlayedList[index]['name'],style: TextStyle(color: Colors.white,fontSize: 13),)
              ],
            ),
          );
      }),
    );
  }

  Widget reviewUI(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        children: [
          Image.asset("assets/images/Screen Shot 2021-12-07 at 12.39 1.png", width: 55,height: 55,),
          mSpacer(),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("#SPOTIFYWRAPPED",style: TextStyle(color: Colors.grey,
                fontSize: 11,),),
              Text("Your 2021 in review", style: TextStyle(color: Colors.white,
                  fontSize: 22),),
            ],
          ))
        ],
      ),
    );
  }

  Widget mReviewListUI(){
    return SizedBox(
      height: 180,
      child: ListView.builder(

          scrollDirection: Axis.horizontal,
          itemCount: mReviewList.length,
          itemBuilder: (_,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(mReviewList[index]['imgPath'],width: 150,height: 150,),
                  mSpacer(mHeight: 8),
                  Text(mReviewList[index]['name'],style: TextStyle(color: Colors.white,fontSize: 13),)
                ],
              ),
            );
          }),
    );
  }

  Widget editorPicksUI(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: Text("Editors's Picks", style: TextStyle(color: Colors.white,
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
      crossAxisAlignment: CrossAxisAlignment.start,
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

}
