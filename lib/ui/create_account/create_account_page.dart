import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domin/app_colors.dart';
import 'package:spotify_clone/domin/app_routes.dart';
import 'package:spotify_clone/domin/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/my_custom_rounded_btn.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  int selectedIndex= 0;

List<Widget> allPages =[];

bool isPP1Selected = false;
bool isPP2Selected = false;


@override
  void initState() {
    super.initState();
    allPages=[
      stepOneUi(),
      stepTwoUi(),
      stepThreeUi(),
      stepFourUi(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        title: Text(
          "Create an account",
          style: TextStyle(color: Colors.white),
        ),
        leading: InkWell(
          onTap: () {
            if(selectedIndex>0){
              selectedIndex--;
              setState(() {

              });
            }else{
              Navigator.pop(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset(
              "assets/svg/Left.svg",
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            allPages[selectedIndex],
            mSpacer(
              mHeight: 21,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: selectedIndex<3 ? 0:43),
              child: MyCustomRoundedBtn(
                mWidth: selectedIndex<3 ? 100 : 180,
                  text: selectedIndex<3 ? "Next" : "Create an account",
                OnTap: () {
                  if(selectedIndex<3){
                    selectedIndex++;
                    setState(() {

                    });
                  }else{
                    //next screen
                    Navigator.pushNamed(context, AppRoutes.choose_artist_page);
                  }
                },
              ),
            ),
            mSpacer(),
          ],
        ),
      ),
    );
  }

  Widget stepOneUi() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' What\'s your email?',
            style: TextStyle(color: Colors.white, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: getCreateAccTextFieldDecoration(),
          ),
          mSpacer(
            mHeight: 7,
          ),
          Text(
            '  You will need to confirm this email later.',
            style: TextStyle(color: Colors.white, fontSize: 11),
            textAlign: TextAlign.center,
          ),
        ],
      );

  Widget stepTwoUi() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' Create a password',
            style: TextStyle(color: Colors.white, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: getCreateAccTextFieldDecoration(),
          ),
          mSpacer(
            mHeight: 7,
          ),
          Text(
            '  Use atleast 8 characters.',
            style: TextStyle(color: Colors.white, fontSize: 11),
            textAlign: TextAlign.center,
          ),
        ],
      );

  Widget stepThreeUi() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' What\'s your gender?',
            style: TextStyle(color: Colors.white, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          mSpacer(),
          Wrap(
            runAlignment: WrapAlignment.spaceEvenly,
            runSpacing: 11,
            spacing: 11,
            children: [
              MyCustomRoundedBtn(
                OnTap: () {},
                text: "Female",
                isOutlined: true,
                textColor: Colors.white,
                bgColor: AppColors.primaryColor,
                mWidth: 100,
                mHeight: 34,
              ),
              MyCustomRoundedBtn(
                OnTap: () {},
                text: "Male",
                isOutlined: true,
                textColor: Colors.white,
                bgColor: AppColors.primaryColor,
                mWidth: 100,
                mHeight: 34,
              ),
              MyCustomRoundedBtn(
                OnTap: () {},
                text: "Not prefer to say",
                isOutlined: true,
                textColor: Colors.white,
                bgColor: AppColors.primaryColor,
                mHeight: 34,
                mWidth: 150,
              ),
              MyCustomRoundedBtn(
                OnTap: () {},
                text: "Others",
                isOutlined: true,
                textColor: Colors.white,
                bgColor: AppColors.primaryColor,
                mWidth: 100,
                mHeight: 34,
              ),

            ],
          )
        ],
      );

  Widget stepFourUi() => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' What\'s your name?',
          style: TextStyle(color: Colors.white, fontSize: 25),
          textAlign: TextAlign.center,
        ),
        TextField(
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: getCreateAccTextFieldDecoration(),
        ),
        mSpacer(
          mHeight: 7,
        ),
        Text(
          '  This appears on your Spotify profile.',
          style: TextStyle(color: Colors.white, fontSize: 11),
          textAlign: TextAlign.center,
        ),
        mSpacer( mHeight: 33),
        Divider(color: AppColors.greyColor, height: 1,),
        mSpacer( mHeight: 33),
        Text(
          'By tapping on "Create account", you agree to the Spotify Terms of Use.',
          style: TextStyle(color: Colors.white, fontSize: 13),
          textAlign: TextAlign.center,
        ),
        mSpacer( mHeight: 33),
        Text(
          '   Terms of Use',
          style: TextStyle(color: AppColors.primaryColor, fontSize: 13),
          textAlign: TextAlign.center,
        ),
        mSpacer( mHeight: 33),
        Text(
          'To learn more about how Spotify collect, uses, shares and protects your personal data, please see the spotify Privacy Policy.',
          style: TextStyle(color: Colors.white, fontSize: 13),
          textAlign: TextAlign.center,
        ),
        mSpacer( mHeight: 33),
        Text(
          '   Privacy Policy',
          style: TextStyle(color: AppColors.primaryColor, fontSize: 13),
          textAlign: TextAlign.center,
        ),
        mSpacer( mHeight: 33),
        RadioListTile.adaptive(
          controlAffinity: ListTileControlAffinity.trailing,
            title: Text(
              'Please send me news and offers from Spotify.',
              style: TextStyle(color: Colors.white, fontSize: 13),
              textAlign: TextAlign.center,
            ),
            value: isPP1Selected, groupValue: false, onChanged: (value){
            isPP1Selected= value!;
            setState(() {

            });
        }),
        RadioListTile.adaptive(
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text(
              'Share my registration data with Spotify\'s content providers for marketing purpose.',
              style: TextStyle(color: Colors.white, fontSize: 13),
              textAlign: TextAlign.center,
            ),
            value: isPP2Selected, groupValue: false, onChanged: (value){
          isPP2Selected= value!;
          setState(() {

          });
        })


      ],
    ),
  );
}
