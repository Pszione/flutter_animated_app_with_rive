import 'package:flutter/material.dart';

class KeyboardUnfocusDetector extends StatelessWidget {
  const KeyboardUnfocusDetector(
      {Key? key, required this.child, this.onPressExtraBehaviour})
      : super(key: key);

  final Widget child;
  final void Function()? onPressExtraBehaviour;

  static const keyboardMinHeight = 400.0;

  static void call() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        onPressExtraBehaviour?.call();
      },
      behavior: HitTestBehavior.translucent,
      excludeFromSemantics: true,
      child: child,
    );
  }
}
