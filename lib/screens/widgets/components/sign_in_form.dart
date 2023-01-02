import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Email',
            style: TextStyle(color: Colors.black54),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset('assets/icons/email.svg')),
              ),
            ),
          ),

          ///
          const Text(
            'password',
            style: TextStyle(color: Colors.black54),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset('assets/icons/password.svg')),
              ),
            ),
          ),

          ///
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 24),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF77D8E),
                minimumSize: const Size(double.infinity, 56), // TIP
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(25))
                      .copyWith(topLeft: const Radius.circular(10)),
                ),
              ),
              icon: const Icon(CupertinoIcons.arrow_right),
              label: const Text('Sign In'),
            ),
          ),

          ///
          Row(
            children: const [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('OR', style: TextStyle(color: Colors.black26)),
              ),
              Expanded(child: Divider()),
            ],
          ),
          Container(
            constraints: const BoxConstraints(minWidth: double.maxFinite),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Text(
              'Sign up with Email, Apple or Google',
              style: TextStyle(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ),
          Builder(builder: (context) {
            const double iconSize = 64;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/email_box.svg',
                      width: iconSize,
                      height: iconSize,
                    ),
                    padding: EdgeInsets.zero),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/apple_box.svg',
                      width: iconSize,
                      height: iconSize,
                    ),
                    padding: EdgeInsets.zero),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/google_box.svg',
                      width: iconSize,
                      height: iconSize,
                    ),
                    padding: EdgeInsets.zero),
              ],
            );
          }),
        ],
      ),
    );
  }
}

Future<Object?> showSignInDialog(BuildContext context,
    {ValueChanged? onClose}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Sing In',
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    pageBuilder: (context, _, __) => SafeArea(
      child: Center(
        child: Container(
          height: 620,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 92),
          padding: const EdgeInsets.symmetric(/*vertical: 32,*/ horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.95),
            borderRadius: const BorderRadius.all(Radius.circular(40)),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: KeyboardUnfocusDetector(
                child: ScrollConfiguration(
                  behavior: NoGlowScrollBehavior(),
                  child: SingleChildScrollView(
                    primary: true,
                    child: SizedBox(
                      height: constraints.biggest.height,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Spacer(),
                              const Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 34, fontFamily: 'Poppins'),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  'Access to 240+ hours of content. Learn design and code, '
                                  'by building real apps with Flutter and Swift.',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SignInForm(),
                              const Spacer(),
                            ],
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: -12,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    ),

    /// TIP
  ).then((value) => onClose?.call(value));
}
