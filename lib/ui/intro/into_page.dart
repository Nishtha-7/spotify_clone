import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domin/app_colors.dart';
import 'package:spotify_clone/domin/app_routes.dart';
import 'package:spotify_clone/domin/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/my_custom_rounded_btn.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset('assets/images/intro_bg.png'),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.blackColor.withOpacity(0.1),
                      AppColors.blackColor
                    ]),
              ),
            ),
            bottomLoginUI(context),
          ],
        ),
      ),
    );
  }

  Widget bottomLoginUI(BuildContext context) => Container(
        padding: EdgeInsets.only(bottom: 60),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo/Logo.svg',
              width: 50,
              height: 50,
            ),
            mSpacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                'Millions of songs.\nFree on Spotify.',
                style: TextStyle(color: Colors.white, fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ),
            MyCustomRoundedBtn(
                text: "Sign up free",
                bgColor: AppColors.primaryColor,
                OnTap: () {
                  Navigator.pushNamed(context, AppRoutes.create_account_page);
                }),
            SizedBox(
              height: 11,
            ),
            MyCustomRoundedBtn(
                isOutlined: true,
                mIconPath: "assets/logo/Component 37.svg",
                text: "Continue with Google",
                bgColor: AppColors.primaryColor,
                textColor: Colors.white,
                OnTap: () {}),
            mSpacer(),
            MyCustomRoundedBtn(
                isOutlined: true,
                mIconPath: "assets/logo/facebook.svg",
                text: "Continue with Facebook",
                bgColor: AppColors.primaryColor,
                textColor: Colors.white,
                OnTap: () {}),
            mSpacer(),
            MyCustomRoundedBtn(
                isOutlined: true,
                mIconPath: "assets/logo/Vector.svg",
                text: "Continue with Apple",
                bgColor: AppColors.primaryColor,
                textColor: Colors.white,
                OnTap: () {}),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login_page);
              },
              child: Text(
                'Log in',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      );
}
