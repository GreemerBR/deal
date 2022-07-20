import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//Main function. The entry point for your Flutter app.

//   Simple demo app which consists of two containers. The goal is to allow multiple gestures into the arena.
//  Everything is handled manually with the use of `RawGestureDetector` and a custom `GestureRecognizer`(It extends `TapGestureRecognizer`).
//  The custom GestureRecognizer, `AllowMultipleGestureRecognizer` is added to the gesture list and creates a `GestureRecognizerFactoryWithHandlers` of type `AllowMultipleGestureRecognizer`.
//  It creates a gesture recognizer factory with the given callbacks, in this case, an `onTap`.
//  It listens for an instance of `onTap` then prints text to the console when it is called. Note that the `RawGestureDetector` code is the same for both
//  containers. The only difference being the text that is printed(Used as a way to identify the widget)

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
          )
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
        ));
  }
}

// Custom Gesture Recognizer.
// rejectGesture() is overridden. When a gesture is rejected, this is the function that is called. By default, it disposes of the
// Recognizer and runs clean up. However we modified it so that instead the Recognizer is disposed of, it is actually manually added.
// The result is instead you have one Recognizer winning the Arena, you have two. It is a win-win.
class AllowMultipleVerticalDragGestureRecognizer
    extends VerticalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
