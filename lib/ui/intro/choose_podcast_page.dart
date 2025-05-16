import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotify_clone/domin/app_colors.dart';
import 'package:spotify_clone/domin/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/my_rounded_img_card.dart';
import 'package:spotify_clone/ui/dashboard/dashboard_page.dart';

import '../../domin/app_routes.dart';
import '../custom_widgets/my_circular_img.dart';
import '../custom_widgets/my_custom_rounded_btn.dart';

class ChoosePodcastPage extends StatelessWidget {
  List<List<Map<String, dynamic>>> mPodcast = [
    [
      {
        "imgPath": "assets/images/Self Titled.png",
        "name": "Self Titled",
        "isBlackBg":true,
        "isSpotifyOriginal":false,
      },
      {
        "imgPath": "assets/images/Default.png",
        "name": "Psych",
        "isBlackBg":false,
        "isSpotifyOriginal":true,
      },
      {
        "imgPath": "assets/images/BTS img.jpeg",
        "name": "More in True crime",
        "isBlackBg":true,
        "isSpotifyOriginal":true,
      },
    ],
    [
      {
        "imgPath": "assets/images/Bryce Vine.png",
        "name": "Bryce Vine",
        "isBlackBg":true,
        "isSpotifyOriginal":true,
      },
      {
        "imgPath": "assets/images/Tycho.png",
        "name": "Tycho",
        "isBlackBg":true,
        "isSpotifyOriginal":false,
      },
      {
        "imgPath": "assets/images/BTS img.jpeg",
        "name": "More in Comedy",
        "isBlackBg":false,
        "isSpotifyOriginal":true,
      },
    ],
    [
      {
        "imgPath": "assets/images/Member.png",
        "name": "Our members",
        "isBlackBg":false,
        "isSpotifyOriginal":true,
      },
      {
        "imgPath": "assets/images/Anthem of the Peaceful Army.png",
        "name": "The Peaceful Army",
        "isBlackBg":true,
        "isSpotifyOriginal":true,
      },
      {
        "imgPath": "assets/images/BTS img.jpeg",
        "name": "Nore in Stories",
        "isBlackBg":true,
        "isSpotifyOriginal":false,
      },
    ],
    [
      {
        "imgPath": "assets/images/Mothership.png",
        "name": "Mothership",
        "isBlackBg":true,
        "isSpotifyOriginal":false,
      },
      {
        "imgPath": "assets/images/Chon.png",
        "name": "Chon",
        "isBlackBg":true,
        "isSpotifyOriginal":false,
      },
      {
        "imgPath": "assets/images/BTS img.jpeg",
        "name": "More in Relationships",
        "isBlackBg":true,
        "isSpotifyOriginal":false,
      },
    ],
    [
      {
        "imgPath": "assets/images/From the Fires.png",
        "name": "From the Fires",
        "isBlackBg":true,
        "isSpotifyOriginal":false,
      },
      {
        "imgPath": "assets/images/MGK.png",
        "name": "MGK",
        "isBlackBg":true,
        "isSpotifyOriginal":false,
      },
      {
        "imgPath": "assets/images/BTS img.jpeg",
        "name": "More in Drama",
        "isBlackBg":true,
        "isSpotifyOriginal":false,
      },
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                  width: 300,
                  child: Text(
                    "Now choose some podcasts.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                    ),
                  )),
              mSpacer(mHeight: 17),
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: getSearchTextFieldDecoration(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 21.0),
                  child: Stack(
                    children: [
                      ListView.builder(
                          itemCount: mPodcast.length,
                          itemBuilder: (_, index) {
                            return Container(
                              padding: EdgeInsets.only(bottom: 11),
                              height: 170,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: mPodcast[index].length,
                                  itemBuilder: (_, childIndex) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: Column(
                                        children: [
                                          childIndex== 2 ? Container(
                                            padding: EdgeInsets.symmetric(vertical: 11),
                                            width: 120,
                                            height: 120,
                                            child: Center(child: Text(mPodcast[index][childIndex]['name'],style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(11),
                                              color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
                                            ),
                                          ):MyRoundedImgCard(
                                            mWidth: 120,
                                            mHeight: 120,
                                            imgPath: mPodcast[index][childIndex]
                                                ['imgPath'],
                                            isBlackBg: mPodcast[index][childIndex]['isBlackBg'],
                                            isSpotifyOriginal:mPodcast[index][childIndex]['isSpotifyOriginal'] ,
                                          ),
                                          mSpacer(),
                                          Text(
                                            childIndex== 2 ? "": mPodcast[index][childIndex]['name'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            );
                          }),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          child: Center(
                            child: MyCustomRoundedBtn(
                              mWidth: 100,
                              text: "Done" ,
                              OnTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardPage()));
                              },
                            ),
                          ),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  stops: [0.1, 1],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.blackColor.withOpacity(0.5),
                                    Colors.transparent,
                                  ])),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
