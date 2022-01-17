import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SilverAppbarFab extends StatefulWidget {
  @override
  _SilverAppbarFabState createState() => _SilverAppbarFabState();
}

class _SilverAppbarFabState extends State<SilverAppbarFab> {
  List<String> items = List<String>.generate(30, (index) => "Item $index");

  bool isFabVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification){
          if(notification.direction == ScrollDirection.forward){
            setState(() {
              isFabVisible = true;
            });
          } else if(notification.direction == ScrollDirection.reverse){
            setState(() {
              isFabVisible = false;
            });
          }
          return true;
        },
        child: NestedScrollView(
          floatHeaderSlivers: true, // when scroll to top a bit not full the appbar automatically come down
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              // floating: true,
              // snap: true,
              title: Text('Hide On Scroll'),
              centerTitle: true,
            )
          ],
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(items[index]),
              );
            },
          ),
        ),
      ),
      floatingActionButton: isFabVisible
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {},
            )
          : null,
    );
  }
}
