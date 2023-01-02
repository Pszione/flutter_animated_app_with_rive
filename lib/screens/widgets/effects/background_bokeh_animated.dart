import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
