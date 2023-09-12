import 'package:flutter/material.dart';
import 'package:portfolio/reusable/colors.dart';
import 'package:portfolio/rootfile/homepage.dart';
import 'package:portfolio/rootfile/mobhome.dart';
import 'package:portfolio/rootfile/splashscreen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: backgroundcolorblack,
        body: kIsWeb ? HomePage() : MobHomePage());
  }
}
