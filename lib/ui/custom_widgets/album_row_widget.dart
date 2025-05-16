import 'dart:math';

import 'package:flutter/material.dart';

class AlbumRowWidget extends StatelessWidget {
  String thumbnailPath;
  String albumName;
  AlbumRowWidget({required this.thumbnailPath, required this.albumName});


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        margin: EdgeInsets.only(right: 11),
          width: MediaQuery.of(context).size.width*0.5-22,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.primaries[Random().nextInt(Colors.primaries.length-1)],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
                bottom: 0,
                child: Transform.rotate(
                  angle: 15 * pi/180,
                  child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 11,
                                  )
                                ],
                  image: DecorationImage(image: AssetImage(thumbnailPath))
                              ),
                            ),
                )),
            Positioned(
              top: 11,
                left: 11,
                child: Text(albumName, style: TextStyle(color: Colors.white, fontSize: 18,),))
      
          ],
        ),
      ),
    );
  }
}
