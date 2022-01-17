import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_profile_app/practice_v10/drawer_test.dart';
import 'package:intl/intl.dart';

class DateTimeTest extends StatefulWidget {
  static const String routeName = 'date_time_test';

  @override
  _DateTimeTestState createState() => _DateTimeTestState();
}

class _DateTimeTestState extends State<DateTimeTest> {

  currentTime(){
    print(DateTime.now());
    var currDt = DateTime.now();
    print(currDt.year); // 4
    print(currDt.weekday); // 4
    print(currDt.month); // 4
    print(currDt.day); // 2
    print(currDt.hour); // 15
    print(currDt.minute); // 21
    print(currDt.second);
    var addDt = currDt.add(Duration(days: 5, hours: 5, minutes: 30));
    print(addDt);
    print(addDt.isAfter(currDt));
    print(addDt.isBefore(currDt));
    var diffDt = addDt.difference(currDt);
    print(diffDt.inSeconds);
    print(diffDt.inHours);
    print(diffDt.inMinutes);
    print(diffDt.inDays);
    print(addDt.isAtSameMomentAs(currDt));
    print(addDt.compareTo(currDt));
    // String strDt = "2010–04–02";
    // DateTime parseDt = DateTime.parse(strDt);
    // print(parseDt);
    var newFormat = DateFormat("yyyy-MM-dd");
    String updatedDt = newFormat.format(currDt);
    print(updatedDt);
    print(DateFormat.yMMMEd().format(currDt));
    print(DateFormat.yMMMMd().format(currDt));

    print('====');
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss   EEE d MMM').format(now);
    print(formattedDate); // 19:29:04   Sun 3 Oct
    print("${DateFormat.yMMMEd().format(DateTime.now())}"); // Sun, Oct 3, 2021
    print("${DateFormat.jms().format(DateTime.now())}"); // 7:36:03 PM
    print("${DateFormat('hh:mm:ss').format(DateTime.now().subtract(Duration(hours: 1)))}"); // 06:36:03
    print(DateTime.now().toUtc()); // 2021-10-03 11:29:04.770558Z
  }

  dateFormat_compare(){
    String result = DateFormat('MM/yy').format(DateTime(2023, 6));
    print("Formatted Date: $result"); // Formatted Date: 06/23
    // DT to String
    String strDate = DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
    print('DateTime to String: $strDate'); // DateTime to String: 2021-10-04 04:26:04
    // String to DT
    DateTime toDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(strDate);
    print('String to DateTime: $toDate'); // String to DateTime: 2021-10-04 04:26:04.000
    // comparison
    var ms = toDate.millisecondsSinceEpoch;
    var ms2 = toDate.add(Duration(hours: 5)).millisecondsSinceEpoch;
    print("s1: $ms, s2 = $ms2, compare: ${ms > ms2}");
    print("compare: ${toDate.isAfter(toDate.add(Duration(hours: 5)))}");
  }

  padDay(){
    print("${DateTime.now().day.toString().padLeft(2, '0')}"); //today date: 3/10/2021  output: 03
    var c ="to";
    print("${c.padRight(3, ' Main')}");
  }

  getDateTimeFromFileName(){
    final filePath = '/storage/emulated/0/Android/data/com.example.voice_recoder_flutter_app/files/flutter_audio_recorder_1629625106594.wav';

    String fromEpoch = filePath.substring(
        filePath.lastIndexOf('/') + 1, filePath.lastIndexOf('.'));
    var arr = fromEpoch.split("_");
    fromEpoch = arr[3];

    DateTime recordedDate = DateTime.fromMicrosecondsSinceEpoch(int.parse(fromEpoch));
    int y = recordedDate.year;
    int m = recordedDate.month;
    int d = recordedDate.day;

    print("Date Time Info: $y-$m-$d");
  }

  seriallyGettingPreviousDay(){
    final myList = List.generate(7, (index) {
      final dateFormatted =DateTime.now().subtract(Duration(days:index));
      return {
        'day': DateFormat.E().format(dateFormatted),
        'date':dateFormatted,
      };
    });
    print(myList);
  }

  Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currentTime();
    dateFormat_compare();
    padDay();
    getDateTimeFromFileName();
    seriallyGettingPreviousDay();


    Timer.periodic(Duration(seconds: 1), (timer){
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
    String displayTime = DateFormat("yyyy-MM-dd \n hh:mm:ss").format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text("Time"),
      ),
      drawer: DrawerTest(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.red,
              child: Image.asset(
                "images/flutter_bird.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 4 / 1,
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text(
                displayTime,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                )
              ),
            ),
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 4 / 1,
              child: Container(
                color: Colors.red,
                child: Image.asset(
                  "images/flutter_bird.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
