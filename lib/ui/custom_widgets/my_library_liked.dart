import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domin/ui_helper.dart';

class MyLibraryLiked extends StatelessWidget {
  bool isLeadingGradient;
  List<Color>? mGradientColors;
  Color mSolidColors;
  IconData mLeadingIcon;
  Color mLeadingIconColor;
  String mTitle;
  String mSubtitle;

  MyLibraryLiked(
      {this.mLeadingIcon = Icons.favorite,
      this.isLeadingGradient = false,
      this.mGradientColors,
      required this.mSolidColors,
      this.mLeadingIconColor = Colors.white,
        required this.mTitle,
        required this.mSubtitle,
      });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 60,
        child: Icon(
          mLeadingIcon,
          color: Colors.white,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
            color: mSolidColors ?? Color(0xff5E3B7A),
            gradient: isLeadingGradient
                ? LinearGradient(
                    colors: mGradientColors ??
                        [
                          Color(0xff4A39EA),
                          Color(0xff868AE1),
                          Color(0xffB9D4DB),
                        ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null),
      ),
      title: Text(mTitle),
      titleTextStyle: TextStyle(color: Colors.white,fontSize: 17),
      subtitleTextStyle: TextStyle(color: Colors.grey, fontSize: 13),
      subtitle: Row(
        children: [
          SvgPicture.asset("assets/svg/pinned.svg"),
          mSpacer(mHeight: 4),
          Text(mSubtitle),
        ],
      ),
    );
  }
}
