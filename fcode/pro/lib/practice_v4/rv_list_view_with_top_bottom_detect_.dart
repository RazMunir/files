import 'package:flutter/material.dart';

class RvListViewTopBottomDetect_ extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RvListViewTopBottomDetect_();
  }
}

class _RvListViewTopBottomDetect_ extends State<RvListViewTopBottomDetect_>{
  var _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (scroll){
        double bottom = scroll.metrics.maxScrollExtent;
        double current = scroll.metrics.pixels;
        double delta = 100;
        if((bottom - current) <= delta) {
          print("Bottom");
        } else if(current <= delta){
          print("Top");
        } else{
          print("Middle");
        }
        return true;

        // if (scroll.metrics.pixels ==
        //     scroll.metrics.maxScrollExtent) {
        //   print("Top");
        // }
        // return true;

      },
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
        itemCount: 20,
      ),
    );
  }
}