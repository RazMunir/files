import 'package:flutter/material.dart';

class RvListViewWithScrollToItem extends StatefulWidget {
  @override
  _RvListViewWithScrollToItemState createState() => _RvListViewWithScrollToItemState();
}

class _RvListViewWithScrollToItemState extends State<RvListViewWithScrollToItem> {
  final _controller = ScrollController();
  final _height = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _animateToIndex(10),
        child: Icon(Icons.arrow_downward),
      ),
      body: ListView.builder(
        controller: _controller,
        itemCount: 100,
        itemBuilder: (_, i) => Container(
          height: _height,
          child: InkWell(
            child: Card(child: Center(child: Text("Item $i"))),
            // onTap: () => _animateToIndex((i < 10) ? i : i-10),
            onTap: () => _animateToIndex(4),
          ),
        ),
      ),
    );
  }

  _animateToIndex(i) => _controller.animateTo(_height * i, duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
  // _animateToIndex(i) => _controller.jumpTo(_height * i);
}
