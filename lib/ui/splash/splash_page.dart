import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domin/app_colors.dart';
import 'package:spotify_clone/domin/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  @override
  void initState() {
    super.initState();
  Future.delayed(const Duration(seconds: 3),(){
    Navigator.pushReplacementNamed(context, AppRoutes.intro_page);
  });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: SvgPicture.asset("assets/logo/Logo.svg",
            width: 80,
            height: 80,
            color: AppColors.primaryColor),
      ),
    );
  }
}
