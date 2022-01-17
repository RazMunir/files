import 'package:flutter/material.dart';

class RvListViewTopBottomDetect extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RvListViewTopBottomDetect();
  }
}

class _RvListViewTopBottomDetect extends State<RvListViewTopBottomDetect>{
  var _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(() {
      double bottom = _scrollController.position.maxScrollExtent;
      double current = _scrollController.position.pixels;
      double delta = 200;
      if((bottom - current) <= delta) {
        print("Bottom");
      } else{
        print("Top");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      physics: ClampingScrollPhysics(),
      itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
      itemCount: 20,
    );
  }
}