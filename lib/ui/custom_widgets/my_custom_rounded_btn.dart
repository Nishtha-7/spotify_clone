import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCustomRoundedBtn extends StatelessWidget {
  VoidCallback OnTap;
  double mWidth;
  double mHeight;
  Color bgColor;
  String text;
  Color textColor;
  String? mIconPath;
  bool isOutlined;

  MyCustomRoundedBtn(
      {required this.OnTap,
      this.mWidth = 300,
      this.mHeight = 50,
      this.textColor=Colors.black,
      this.mIconPath,
      this.bgColor = Colors.white,
      required this.text,
      this.isOutlined= false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: OnTap,
      child: Container(
        width: mWidth,
        height: mHeight,
        child: mIconPath != null ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: Row(
            children: [
            SvgPicture.asset(mIconPath!, width: 21,height: 21,),
              Expanded(child: Center(child: Text(text, style: TextStyle(color: textColor, fontSize: 16),)),)
            ],
          ),
        ): Center(
          child:Text(text, style: TextStyle(fontWeight: FontWeight.bold, color: textColor,),),
      ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isOutlined? Colors.transparent : bgColor,
          border: isOutlined? Border.all(
            width: 1,
            color: isOutlined? Colors.white : Colors.transparent,
          ): null
        ),
      ),
    );
  }
}
