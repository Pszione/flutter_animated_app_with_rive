import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../widgets/widgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final RiveAnimationController _buttonController;

  @override
  void initState() {
    super.initState();
    _buttonController = OneShotAnimation('active', autoplay: false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundBokehAnimated(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const SizedBox(
                      width: 220,
                      child: Text(
                        'Learn design & code',
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: 'Poppins',
                          height: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                      "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                      "It has survived not only five centuries, but also the leap",
                    ),

                    ///
                    const Spacer(flex: 2),
                    AppAnimatedButton(
                      buttonController: _buttonController,
                      onPress: () => showSignInDialog(context),
                      text: 'Start the course',
                      icon: CupertinoIcons.arrow_right,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          'Purchase includes access to 30+ courses, 240+ premium tutorials, a certificate and more!'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
