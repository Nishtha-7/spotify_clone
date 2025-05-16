import 'package:flutter/material.dart';
import 'package:spotify_clone/domin/app_colors.dart';
import 'package:spotify_clone/domin/app_routes.dart';
import 'package:spotify_clone/domin/ui_helper.dart';

import '../custom_widgets/my_circular_img.dart';
import '../custom_widgets/my_custom_rounded_btn.dart';

class ChooseArtistPage extends StatefulWidget {
  @override
  State<ChooseArtistPage> createState() => _ChooseArtistPageState();
}

class _ChooseArtistPageState extends State<ChooseArtistPage> {
  List<int> selectedArtist =[];

 List<Map<String, dynamic>> mArtist =[
   {
     "imgPath":"assets/images/BTS img.jpeg",
     "name": "BTS",
   },
   {
     "imgPath":"assets/images/taylor img.jpeg",
     "name": "Taylor Swift",
   },
   {
     "imgPath":"assets/images/lana del rey img.jpeg",
     "name": "Lana Del Rey",
   },
   {
     "imgPath":"assets/images/selena gomez img.jpeg",
     "name": "Selena Gomez",
   },
   {
     "imgPath":"assets/images/benny blanco img.jpeg",
     "name": "Benny Blanco",
   },
   {
     "imgPath":"assets/images/rm img.jpeg",
     "name": "RM",
   },
   {
     "imgPath":"assets/images/jin img.jpeg",
     "name": "Jin",
   },
   {
     "imgPath":"assets/images/suga img.jpeg",
     "name": "Agust D",
   },
   {
     "imgPath":"assets/images/jhope img.jpeg",
     "name": "Jhope",
   },
   {
     "imgPath":"assets/images/jimin img.jpeg",
     "name": "Jimin",
   },
   {
     "imgPath":"assets/images/v img.jpeg",
     "name": "V",
   },
   {
     "imgPath":"assets/images/jungkook img.jpeg",
     "name": "Jung Kook",
   },
   {
     "imgPath":"assets/images/coldplay img.jpeg",
     "name": "Coldpaly",
   },
   {
     "imgPath":"assets/images/charlie puth img.jpeg",
     "name": "Charlie Puth",
   },
   {
     "imgPath":"assets/images/harry styles img.jpeg",
     "name": "Harry Styles",
   },
   {
     "imgPath":"assets/images/the weeknd img.jpeg",
     "name": "The Weeknd",
   },
   {
     "imgPath":"assets/images/rihanna img.jpeg",
     "name": "Rihanna",
   },
   {
     "imgPath":"assets/images/sabrina carpenter img.jpeg",
     "name": "Sabrina Carpenter",
   },
   {
     "imgPath":"assets/images/billie eilish img.jpeg",
     "name": "Billie Eilish",
   },
   {
     "imgPath":"assets/images/ed sheeran img.jpeg",
     "name": "Ed Sheeran",
   },
   {
     "imgPath":"assets/images/ariana grande img.jpeg",
     "name": "Ariana Grande",
   },
   {
     "imgPath":"assets/images/bruno mars img.jpeg",
     "name": "Bruno Mars",
   },
   {
     "imgPath":"assets/images/one direction img.jpeg",
     "name": "One Direction",
   },
   {
     "imgPath":"assets/images/dua lipa img.jpeg",
     "name": "Dua Lipa",
   },

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
                  child: Text("Choose 3 or more artist you like.", style: TextStyle(color:Colors.white,fontSize: 20,),)),
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
                      GridView.builder(
                        itemCount: mArtist.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        mainAxisSpacing: 11,
                        crossAxisSpacing: 11,
                            childAspectRatio: 9/10,
                      ),
                        itemBuilder: (_, index){
                        return InkWell(
                          onTap: (){
                            if(!selectedArtist.contains(index)) {

                                selectedArtist.add(index);
                                setState(() {

                                });

                            }else{
                              selectedArtist.remove(index);
                              setState(() {

                              });
                            }
                          },
                          child: Column(
                            children: [
                              MyCircularImgBg(imgPath: mArtist[index]['imgPath'],isSelected: selectedArtist.contains(index),),
                              mSpacer(),
                              Text(mArtist[index]['name'],style: TextStyle(color: Colors.white,fontSize: 13),)
                            ],
                          ),
                        );
                        }
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 100,
                         child: selectedArtist.length>=3 ? Center(
                           child: MyCustomRoundedBtn(
                             mWidth: 100,
                             text: "Next" ,
                             OnTap: () {
                               Navigator.pushNamed(context, AppRoutes.choose_podcast_page);
                             },
                           ),
                         ):Container(),
                         decoration: BoxDecoration(
                           gradient: LinearGradient(
                             stops: [0.1, 1],
                             begin: Alignment.topCenter,
                               end: Alignment.bottomCenter,
                               colors: [
                             AppColors.blackColor.withOpacity(0.7),
                             Colors.transparent,
                           ])
                         ),
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
