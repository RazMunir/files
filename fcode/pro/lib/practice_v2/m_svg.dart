import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MSvg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            "images/browser.svg",
            height: 60,
            width: 60,
          ),
          Container(
            child: SvgPicture.network(
              "https://upload.wikimedia.org/wikipedia/commons/3/30/Vector-based_example.svg",
              height: 34,
              width: 34,
              color: Colors.lightBlueAccent,
            ),
          ),
          SvgPicture.asset(
            "images/browser.svg",
            height: 60,
            width: 60,
          ),
          Container(
            child: SvgPicture.network(
              "https://upload.wikimedia.org/wikipedia/commons/3/30/Vector-based_example.svg",
              height: 34,
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
