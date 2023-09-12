import 'package:animated_background/animated_background.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_container/gradient_container.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/reusable/colors.dart';
import 'package:portfolio/reusable/utils.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';

class MobHomePage extends StatefulWidget {
  const MobHomePage({super.key});

  @override
  State<MobHomePage> createState() => _MobHomePageState();
}

class _MobHomePageState extends State<MobHomePage>
    with TickerProviderStateMixin {
  final homekey = GlobalKey();
  final projectskey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> projectdetails = [
    {
      'projectimage': 'images/maarch.webp',
      'projectname': 'Maarch',
      'projectdescription':
          'Maarch is a sleek and efficient retail billing app, perfect for businesses looking to simplify their sales transactions, ',
    },
    {
      'projectimage': 'images/cloi.webp',
      'projectname': 'Cloi-Ecommerce',
      'projectdescription':
          'Our E-Commerce app builder offers a range of customisable templates, features, and integrations to help you design an app that meets your business needs.',
    },
    {
      'projectimage': 'images/anoncall.png',
      'projectname': 'Anon-call',
      'projectdescription':
          'Anonymous calling app without any authentication for seamless connection with friends all around the world',
    },
    {
      'projectimage': 'images/styleberry.webp',
      'projectname': 'Ecommerce fashion store',
      'projectdescription':
          'Ecommerce app for all new trendy collections for mens with wide range of fashion based on trivandrum',
    },
    // Add more user data as needed
  ];
  bool rightalignanimation = false;

  void myFunction() {}
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(microseconds: 100)).then((value) {
      setState(() {
        rightalignanimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: height * .1,
          elevation: 0,
          shadowColor: backgroundcolorblack,
          actions: [
            GestureDetector(
              onTap: () {
                Scrollable.ensureVisible(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    homekey.currentContext!);
              },
              child: const Center(
                  child: Text(
                "HOME",
                style: TextStyle(letterSpacing: 1.1),
              )),
            ),
            SizedBox(
              width: width * .02,
            ),
            GestureDetector(
              onTap: () {
                Scrollable.ensureVisible(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    projectskey.currentContext!);
              },
              child: const Center(
                  child: Text(
                "PROJECTS",
                style: TextStyle(letterSpacing: 1.1),
              )),
            ),
            SizedBox(
              width: width * .02,
            ),
            GestureDetector(
              onTap: () {
                Scrollable.ensureVisible(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    projectskey.currentContext!);
              },
              child: const Center(
                  child: Text(
                "ABOUT",
                style: TextStyle(letterSpacing: 1.1),
              )),
            ),
            SizedBox(
              width: width * .02,
            ),
            const Center(
                child: Text(
              "CONTACT",
              style: TextStyle(letterSpacing: 1.1),
            )),
            SizedBox(
              width: width * .03,
            ),
          ],
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification) {
              // Adjust these values to define the area where you want to detect scrolling
              const double topThreshold = 10.0;
              const double bottomThreshold = 300.0;

              // Check if the scrolling position is within the desired area
              if (_scrollController.position.pixels >= topThreshold &&
                  _scrollController.position.pixels <= bottomThreshold) {}
            }
            return false;
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height * .42,
                  color: backgroundcolorblack,
                  child: Stack(children: [
                    AnimatedBackground(
                      behaviour: RacingLinesBehaviour(
                        direction: LineDirection.Ltr,
                        numLines: 20,
                      ),
                      vsync: this,
                      child: const Center(),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.black, width: 0)),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * .05,
                            ),
                            SizedBox(
                                width: width * .4,
                                height: height * .42,
                                child: Image.asset(
                                  'images/deviconhd.png',
                                  fit: BoxFit.contain,
                                )),
                            SizedBox(
                                width: width * .45,
                                height: height * .42,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text: 'Hello  I' 'm $devshortname, \n',
                                        style: TextStyle(
                                            color: primaryred,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'FLUTTER DEVELOPER',
                                              style: TextStyle(
                                                  color: textwhitecolor,
                                                  fontSize: kIsWeb ? 32 : 20,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * .02,
                                    ),
                                    const Text(
                                      'Passionate Flutter dev creating seamless, user-friendly apps. Expert in Flutter, Dart, UI/UX, APIs. Turning ideas into elegant mobile experiences. Let'
                                      's build something amazing! ',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          letterSpacing: 1.1,
                                          color: Colors.white60,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: height * .03,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: GradientContainer(
                                          height: height * .06,
                                          width: width * .21,
                                          colors: const [
                                            primaryred,
                                            Colors.pink
                                          ],
                                          child: const Center(
                                            child: Text(
                                              'ABOUT ME',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  letterSpacing: 1.1,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              width: width * .05,
                            ),
                          ]),
                    )
                  ]),
                ),
                Container(
                  key: homekey,
                  width: width,
                  height: height * 1.5,
                  color: backgroundcolorblack,
                  child: Stack(children: [
                    SizedBox(
                      width: width,
                      height: height * 1.2,
                      child: Row(
                        children: [
                          Container(
                            width: width * .5,
                            height: height * .9,
                            color: lightblack,
                          ),
                          Container(
                            width: width * .5,
                            height: height * .9,
                            color: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(seconds: 3),
                      left: rightalignanimation ? width * .01 : 0,
                      curve: Curves.easeOutCirc,
                      child: SizedBox(
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * .05,
                            ),
                            Container(
                              height: height * .35,
                              width: width * .8,
                              decoration: BoxDecoration(
                                  color: darkblack,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: EdgeInsets.all(width * .02),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    const Icon(
                                      Icons.android_outlined,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text(
                                      'Android Development',
                                      style: GoogleFonts.actor(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 19,
                                            letterSpacing: .5),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * .02,
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      'Crafting Innovation, Empowering Experiences in Android Development ',
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                            color: Colors.white54,
                                            fontSize: 16,
                                            letterSpacing: .5),
                                      ),
                                    ),
                                    Text(
                                      'Beyond Boundaries',
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                            color: Colors.white54,
                                            fontSize: 16,
                                            letterSpacing: .5),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'Load More >',
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 16,
                                            letterSpacing: .5),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: GradientContainer(
                                height: height * .35,
                                width: width * .8,
                                colors: const [primaryred, Colors.pink],
                                child: Padding(
                                  padding: EdgeInsets.all(width * .02),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Spacer(),
                                      const Icon(
                                        Icons.apple,
                                        color: Colors.white,
                                        size: 60,
                                      ),
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      Text(
                                        'iOS Development',
                                        style: GoogleFonts.actor(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 19,
                                              letterSpacing: .5),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                      Text(
                                        textAlign: TextAlign.center,
                                        'Mastering Innovation: Elevating Experiences with Expert iOS Development Craftsmanship',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              color: Colors.white60,
                                              fontSize: 16,
                                              letterSpacing: .5),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Load More >',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              letterSpacing: .5),
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            Container(
                              height: height * .35,
                              width: width * .8,
                              decoration: BoxDecoration(
                                  color: darkblack,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: EdgeInsets.all(width * .02),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    const Icon(
                                      Icons.web,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text(
                                      'Web Development',
                                      style: GoogleFonts.actor(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 19,
                                            letterSpacing: .5),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * .02,
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      'Shaping the Digital World: Empowering Tomorrow through Expert Web Development',
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                            color: Colors.white60,
                                            fontSize: 16,
                                            letterSpacing: .5),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'Load More >',
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 16,
                                            letterSpacing: .5),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * .9,
                                  height: height * .36,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Spacer(),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '2+',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoSlab(
                                              textStyle: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 80,
                                                  letterSpacing: .5),
                                            ),
                                          ),
                                          Text(
                                            'Year Experience',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoSlab(
                                              textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  letterSpacing: .5),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: width * .2,
                                            height: height * .1,
                                            color: darkblack,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '25+',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunitoSans(
                                                    textStyle: const TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 27,
                                                        letterSpacing: .5),
                                                  ),
                                                ),
                                                Text(
                                                  'Clients',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunitoSans(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white54,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                        letterSpacing: .5),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * .02,
                                          ),
                                          Container(
                                            width: width * .2,
                                            height: height * .1,
                                            color: darkblack,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '12+',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunitoSans(
                                                    textStyle: const TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 27,
                                                        letterSpacing: .5),
                                                  ),
                                                ),
                                                Text(
                                                  'Completed Projects',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunitoSans(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white54,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                        letterSpacing: .5),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: width * .015,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: width * .2,
                                            height: height * .1,
                                            color: darkblack,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '5+',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunitoSans(
                                                    textStyle: const TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 27,
                                                        letterSpacing: .5),
                                                  ),
                                                ),
                                                Text(
                                                  'Active Projects',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunitoSans(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white54,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                        letterSpacing: .5),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * .02,
                                          ),
                                          Container(
                                            width: width * .2,
                                            height: height * .1,
                                            color: darkblack,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '7+',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunitoSans(
                                                    textStyle: const TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 27,
                                                        letterSpacing: .5),
                                                  ),
                                                ),
                                                Text(
                                                  'Available On Playstore',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunitoSans(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white54,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                        letterSpacing: .5),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * .05,
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
                Container(
                  key: projectskey,
                  width: width,
                  // height: height * .9,
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * .03,
                      ),
                      Text(
                        'FEATURED PROJECTS',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              letterSpacing: 2),
                        ),
                      ),
                      SizedBox(
                          width: width * .9,
                          height: height * 1.8,
                          child: GridView.builder(
                            itemCount: projectdetails.length,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    crossAxisSpacing: 1.0,
                                    mainAxisSpacing: 4.0),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: width * .8,
                                      height: height * .25,
                                      color: lightblack,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15.0, bottom: 15),
                                        child: ClipRRect(
                                          child: Image.asset(
                                            projectdetails[index]
                                                ["projectimage"],
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        projectdetails[index]["projectname"],
                                        textAlign: TextAlign.justify,
                                        style: GoogleFonts.nunitoSans(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              letterSpacing: 2),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        projectdetails[index]
                                            ["projectdescription"],
                                        textAlign: TextAlign.justify,
                                        style: GoogleFonts.nunitoSans(
                                          textStyle: const TextStyle(
                                              color: Colors.white60,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              letterSpacing: 2),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      // alignment: Alignment.topLeft,
                                      child: Text(
                                        'Load More >',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 16,
                                              letterSpacing: .5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  height: height * .25,
                  color: darkblack,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .05),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * .03,
                        ),
                        Text(
                          'CONNECT ME',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                color: primaryred,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                letterSpacing: 2),
                          ),
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.call_outlined,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Text(
                                  ' $mob',
                                  style: GoogleFonts.robotoSlab(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        letterSpacing: .5),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.mail_outlined,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Text(
                                  ' $mailid',
                                  style: GoogleFonts.robotoSlab(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        letterSpacing: .5),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 15,
                            ),
                            Text(
                              ' $location',
                              style: GoogleFonts.robotoSlab(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    letterSpacing: .5),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                    height: height * .03,
                                    child: Image.asset('images/whatsapp.png')),
                              ),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  goToWebPage(linkedin);
                                },
                                child: SizedBox(
                                    height: height * .03,
                                    child: Image.asset('images/linkedin.png')),
                              ),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  goToWebPage(github);
                                },
                                child: SizedBox(
                                    height: height * .03,
                                    child: Image.asset('images/github.png')),
                              ),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  goToWebPage(github);
                                },
                                child: SizedBox(
                                    height: height * .03,
                                    child: Image.asset('images/instagram.png')),
                              ),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  goToWebPage(github);
                                },
                                child: SizedBox(
                                    height: height * .03,
                                    child: Image.asset('images/facebook.png')),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
