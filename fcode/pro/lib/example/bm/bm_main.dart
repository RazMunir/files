import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_profile_app/example/bm/bm_image_page_view.dart';
import 'package:flutter_profile_app/example/bm/drawer_widget.dart';
import 'package:intl/intl.dart';

class BMMain extends StatefulWidget {
  @override
  _BMMainState createState() => _BMMainState();
}

class _BMMainState extends State<BMMain> {
  Timer timer;
  DateTime presentTime;
  DateTime maxTime = DateFormat("yyyy-MM-dd hh:mm:ss a").parse("2021-10-14 03:40:00 PM");

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer){
      print("still on");
      this.timer = timer;
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    presentTime = DateTime.now();
    Duration diffDuration = maxTime.difference(presentTime);
    final counter = Duration(seconds: diffDuration.inSeconds);

    if(maxTime.isBefore(presentTime) & (timer != null)){
      print('It is expaired');
      timer.cancel();
    }

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Image show"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(icon: Icon(Icons.timer), text: maxTime.isAfter(presentTime) ? '${_printDuration(counter)}' : '00:00:00'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: _buildImageGridView(),
            )
          ],
        ),
        drawer: DrawerWidget(currentPage: 0,),
      ),
    );
  }

  List<String> images = [
    "images/person.png",
    "images/person_2.jpg",
    "images/person.png",
    "images/person_2.jpg"
  ];

  _buildImageGridView(){
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: images.length,
      itemBuilder: (context, index){
        return InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BMImagePageView(currentImageIndex: index,),
            ));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7)),
              border: Border.all(color: Colors.grey, width: 0.4),
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover
              )
            ),
          ),
        );
      },
    );
  }
}
