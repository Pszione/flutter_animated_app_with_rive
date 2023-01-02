import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AppAnimatedButton extends StatelessWidget {
  const AppAnimatedButton({
    Key? key,
    required RiveAnimationController buttonController,
    required this.onPress,
    required this.text,
    this.icon,
  })  : _buttonController = buttonController,
        super(key: key);

  final VoidCallback? onPress;
  final String text;
  final IconData? icon;

  final RiveAnimationController _buttonController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _buttonController.isActive = true;
        onPress?.call();
      },
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          alignment: const Alignment(0.0, 0.15), // Alignment.center
          children: [
            RiveAnimation.asset(
              "assets/RiveAssets/button.riv",
              controllers: [_buttonController],
            ),
            FractionallySizedBox(
              widthFactor: .85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (icon != null) Icon(icon),
                  Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
