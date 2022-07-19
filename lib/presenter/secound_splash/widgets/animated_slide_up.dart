import 'package:flutter/material.dart';

class AnimatedSlideUp extends StatefulWidget {
  const AnimatedSlideUp({Key? key}) : super(key: key);

  @override
  State<AnimatedSlideUp> createState() => _AnimatedSlideUpState();
}

class _AnimatedSlideUpState extends State<AnimatedSlideUp> {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.keyboard_double_arrow_up_rounded,
        color: Colors.white, size: 45);
  }
}
