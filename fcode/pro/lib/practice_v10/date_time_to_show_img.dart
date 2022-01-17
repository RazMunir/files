import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeToShowImage extends StatefulWidget {
  @override
  _DateTimeToShowImageState createState() => _DateTimeToShowImageState();
}

class _DateTimeToShowImageState extends State<DateTimeToShowImage> {
  DateTime presentTime;
  DateTime maxTime = DateFormat("yyyy-MM-dd hh:mm:ss a").parse("2021-10-13 04:30:00 PM");

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
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    presentTime = DateTime.now();
    Duration diffDuration = maxTime.difference(presentTime);
    final counter = Duration(seconds: diffDuration.inSeconds);

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
              child: maxTime.isAfter(presentTime)
                  ? Image.asset("images/person.png")
                  : Center(child: Text("Time is up.")),
            )
          ],
        ),
      ),
    );
  }
}
