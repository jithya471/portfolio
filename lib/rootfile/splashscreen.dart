import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/reusable/colors.dart';
import 'package:portfolio/rootfile/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Navigator.pushAndRemoveUntil(
        context, HomePage as Route<Object?>, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundcolorblack,
      body: Center(
        child: Lottie.asset("images/loading.json",
            height: height * .2, width: width * .4),
      ),
    );
  }
}
