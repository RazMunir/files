import 'package:flutter/material.dart';

class RvListViewTopBottomDetectV2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RvListViewTopBottomDetectV2();
  }
}

class _RvListViewTopBottomDetectV2 extends State<RvListViewTopBottomDetectV2>{
  var _scrollController = ScrollController();

  List<int> list = [];
  int count = 0;

  void _updateCount(){
    setState(() {
      count = list.length;
    });
  }

  void _load(){
    setState(() {
      list.addAll(List.generate(20, (index) => index));
    });
    _updateCount();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    list.addAll(List.generate(20, (index) => index));
    _updateCount();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (scroll){
        double bottom = scroll.metrics.maxScrollExtent;
        double current = scroll.metrics.pixels;
        // double delta = 100;
        double delta = 5;
        if((bottom - current) <= delta) {
          print("Bottom");
          _loadMore();
        } else if(current <= delta){
          print("Top");
        } else{
          print("Middle");
        }
        return true;
      },
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        itemBuilder: (_, i) => ListTile(title: Text(list[i].toString())),
        itemCount: count,
      ),
    );
  }

  void _loadMore() async {
    // list.clear();
    await Future.delayed(Duration(seconds: 2));
    _load();
  }
}