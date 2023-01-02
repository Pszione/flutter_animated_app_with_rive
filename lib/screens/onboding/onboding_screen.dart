import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundBokehAnimated(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  SizedBox(
                    width: 220,
                    child: Column(
                      children: [
                        Text(
                          'Learn design & code',
                          style: TextStyle(
                            fontSize: 60,
                            fontFamily: 'Poppins',
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap",
                          style: TextStyle(),
                        ),

                        ///
                        const SizedBox(height: 32),
                        SizedBox(
                          height: 64,
                          width: 260,
                          child: Stack(
                            alignment: Alignment(0.0, 0.15), // Alignment.center
                            children: [
                              RiveAnimation.asset(
                                  "assets/RiveAssets/button.riv"),
                              FractionallySizedBox(
                                widthFactor: .85,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(CupertinoIcons.arrow_right),
                                    Text(
                                      'Start the course',
                                      style: Theme.of(context)
                                          .textTheme
                                          .button!
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundBokehAnimated extends StatelessWidget {
  const BackgroundBokehAnimated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          width: size.width * 1.7,
          bottom: 200,
          left: 100,
          child: Image.asset('assets/Backgrounds/Spline.png'),
        ),
        // Positioned.fill(
        //   child: BackdropFilter(
        //     filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
        //     child: const SizedBox.shrink(),
        //   ),
        // ),
        const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
