import 'dart:math';

import 'package:flutter/material.dart';

class TweenAnim extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TweenAnim();
  }
}

class _TweenAnim extends State<TweenAnim> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = Tween(begin: 50.0, end: 200.0).animate(_controller)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          print("completed");
        } else if (state == AnimationStatus.dismissed) {
          print("dismissed");
        }
      })
      ..addListener(() {
        print("value:${_animation.value}");
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Container(
          //   height: _animation.value,
          //   width: _animation.value,
          //   child: FlutterLogo(),
          // ),
          Container(
            child: Transform.rotate(
              angle: -2 * pi * _animation.value / 200,
              // angle:  -pi / 2,
              child: Image.asset(
                "images/person.png",
                fit: BoxFit.fitHeight,
                width: _animation.value,
                height: _animation.value,
                // width: 200,
                // height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
