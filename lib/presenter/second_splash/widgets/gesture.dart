import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        AllowMultipleVerticalDragGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<
                AllowMultipleVerticalDragGestureRecognizer>(
          () => AllowMultipleVerticalDragGestureRecognizer(),
          (AllowMultipleVerticalDragGestureRecognizer instance) {
            instance..onEnd = (_) => print("test1");
          },
        ),
      },
      child: RawGestureDetector(
        gestures: {
          AllowMultipleVerticalDragGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<
                  AllowMultipleVerticalDragGestureRecognizer>(
            () => AllowMultipleVerticalDragGestureRecognizer(),
            (AllowMultipleVerticalDragGestureRecognizer instance) {
              instance..onEnd = (_) => print("test2");
            },
          )
        },
        child: Container(color: Colors.red),
      ),
    );
  }
}

class AllowMultipleVerticalDragGestureRecognizer
    extends VerticalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
