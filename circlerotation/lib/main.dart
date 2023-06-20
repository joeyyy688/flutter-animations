import 'dart:math';

import 'package:circlerotation/halfCircleClipper.dart';
import 'package:flutter/material.dart';

enum CircleSide { left, right }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    //implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0.0, end: -(pi / 2.0)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  void dispose() {
    // implement dispose
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      _controller
        ..reset()
        ..forward();
    });
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateZ(_animation.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipPath(
                    clipper: HalfCircleClipper(CircleSide.left),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                      height: 150,
                      width: 150,
                    ),
                  ),
                  ClipPath(
                    clipper: HalfCircleClipper(CircleSide.right),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                      ),
                      height: 150,
                      width: 150,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
