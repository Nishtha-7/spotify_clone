import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domin/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/my_library_liked.dart';
import 'package:spotify_clone/ui/custom_widgets/type_chip_widget.dart';

import '../../../domin/app_colors.dart';
import '../dashboard_page.dart';
import 'album_details_page.dart';
import 'library/my_profile_nav_page.dart';

class LibraryBottomNavPage extends StatelessWidget {
  final List<Map<String, dynamic>> mLibraryList = [
    {"imgPath": "assets/images/this is bts.jpeg", "name": "This is BTS"},
    {"imgPath": "assets/images/1st row/img12.png", "name": "Lana Del Rey",},
    {"imgPath": "assets/images/coldplay img.jpeg", "name": "ColdPlay"},
    {"imgPath": "assets/images/1st row/img13.png", "name": "Marvin Gaye"},
    {"imgPath": "assets/images/taylor lover.jpeg", "name": "Taylor Swift"},
    {"imgPath": "assets/images/suga img.jpeg", "name": "Agust D"},
    {"imgPath": "assets/images/rm img.jpeg", "name": "RM"},
  ];

List<String> mTypes = ["Playlist", "Artists", "Albums", "Podcast & Shows"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Column(
          children: [
            mSpacer(),
            titleUI(context),
            mSpacer(),
            typeChipUI(),
            mSpacer(mHeight: 25),
            recentlyPlayedUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    mSpacer(mHeight: 16),
                    MyLibraryLiked(isLeadingGradient: true, mSolidColors: Colors.purple, mTitle: "Liked Songs", mSubtitle: "Playlist. 58 Songs",),
                    mSpacer(),
                    MyLibraryLiked(mGradientColors: [ Color(0xff4A39EA),
                      Color(0xff868AE1),
                      Color(0xffB9D4DB),] ,mLeadingIcon: Icons.notifications_active, mSolidColors: Colors.purple, mLeadingIconColor:Colors.white, mTitle: "New Episodes", mSubtitle: "Updated 2 days ago",),
                    mSpacer(mHeight: 15),
                    ListView.builder(
                      itemCount: mLibraryList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_,index){
                        return Column(
                          children: [
                            GestureDetector(
                              child: ListTile(
                                onTap: () {
                                  // Check if it's the BTS album (you can make it dynamic later)
                                  if (mLibraryList[index]["name"] == "This is BTS") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AlbumDetailsPage(
                                          AlbumPicPath: mLibraryList[index]["imgPath"],
                                        ),
                                      ),
                                    );
                                  }
                                },
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    mLibraryList[index]["imgPath"],
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(mLibraryList[index]["name"]),
                                subtitle: Text("Artist"),
                                titleTextStyle: TextStyle(color: Colors.white, fontSize: 17),
                                subtitleTextStyle: TextStyle(color: Colors.grey, fontSize: 13),
                              ),

                            ),
                            mSpacer(mHeight: 14),
                          ],
                        );
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );;
  }
  Widget titleUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              }

          ),
          GestureDetector(
            onTap: () {
              // Navigate to MyProfileNavPage when profile picture is clicked
              Navigator.push(
                context, // Ensure context is in scope
                MaterialPageRoute(
                  builder: (BuildContext context) => MyProfileNavPage(ProfilePicPath: 'assets/images/profile.webp'),
                ),
              );
            },
            child: CircleAvatar(
              radius: 25,
              child: Image.asset('assets/images/profile.webp'), // Your profile picture
            ),
          ),
          mSpacer(),
          Text('Your Library', style: TextStyle(color: Colors.white, fontSize: 25)),
          Spacer(),
          Icon(Icons.add, size: 35, color: Colors.grey,)
        ],
      ),
    );
  }


  Widget typeChipUI(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          itemCount: mTypes.length,
          scrollDirection: Axis.horizontal,
            itemBuilder: (_, index){
          return TypeChipWidget(typeName: mTypes[index]);
        }),
      )
    );
  }
  Widget recentlyPlayedUI(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
            RotatedBox(
                quarterTurns: 3,
            child: Icon(Icons.compare_arrows_rounded,color: Colors.white,size: 23,)),
          Text("Recently Played",style: TextStyle(color: Colors.white,fontSize: 16),),
          Spacer(),
          SvgPicture.asset("assets/svg/Component 17.svg",color: Colors.white,),
        ],
      ),
    );
  }
}
