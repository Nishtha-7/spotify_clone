import 'package:flutter/material.dart';
import 'package:spotify_clone/domin/app_colors.dart';
import 'package:spotify_clone/domin/ui_helper.dart';

import 'my_profile_nav_page.dart';

class SettingsNavPage extends StatelessWidget {
  List<String> mSettingList = [
    "Account",
    "Storage",
    "Data Saver",
    "Language",
    "Playback",
    "Explicit Content",
    "Device",
    "car",
    "Social",
    "Voice Assistant & Apps",
    "Audio Quality",
  ];

  SettingsNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          mSpacer(mHeight: 70),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white,),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Text("Settings", style: TextStyle(color: Colors.white,fontSize: 16),),
                InkWell(
                  child: Icon(Icons.arrow_back_ios_new_sharp, color: AppColors.blackColor,),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyProfileNavPage(ProfilePicPath: 'assets/images/profile.webp'),
                      ),
                    );
                  },



                ),
              ],
            ),
          ),
          mSpacer(),
          ListTile(
            leading: Container(
              width: 60,
              height:60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/profile.webp"))
              ),
            ),
            contentPadding: EdgeInsets.zero,
            title: Text("Nish", style: TextStyle(color: Colors.white,fontSize: 18),),
            subtitle: Text("View Profile",style: TextStyle(color: Colors.grey,fontSize: 13),),
            trailing: Icon(Icons.chevron_right_sharp, color: Colors.grey,size: 30,),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: mSettingList.length,
                  itemBuilder: (_,index){
                return  ListTile(
                  title: Text(mSettingList[index], style: TextStyle(color: Colors.white,fontSize: 16),),
                  trailing: Icon(Icons.chevron_right_sharp, color: Colors.grey,size: 30,),
                );
              }))
        ],
      ),
    );
  }
}
