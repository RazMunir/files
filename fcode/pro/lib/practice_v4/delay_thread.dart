import 'dart:async';

import 'package:flutter/material.dart';

class DelayThread extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DelayThread();
  }
}

class _DelayThread extends State<DelayThread>{

  String msg = "Hello";
  String msg2 = "Hi";
  String msg3 = "Waiting...";
  String msg4 = "Click Delay for change...";

  int periodicTimerCondition = 0;

  void startTime(){
    Future.delayed(Duration(seconds: 2), (){
      print("From delay");
      setState(() {
        msg==("Hello") ? (msg="Hi after 2 seconds") : (msg="Hello");
      });
    });
  }

  void startTimeWithTimer(){
    Timer(Duration(seconds: 2),(){
      print("From Timer delay");
      setState(() {
        msg2==("Hi") ? (msg2="Hello after 2 seconds") : (msg2="Hi");
      });
    });
  }

  void startTimeWithTimerPeriodic(){
    Timer.periodic(Duration(seconds: 3), (timer) {
      print(DateTime.now());
      setState(() {
        periodicTimerCondition++;
        if(periodicTimerCondition == 4){
          timer.cancel();
        }
        msg3 == "Waiting..." ? (msg3 = "...") : (msg3 = "Waiting...");
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimeWithTimerPeriodic();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Text(msg),
                onTap: (){
                  startTime();
                },
              ),
              Text(msg3),
              InkWell(
                child: Text(msg2),
                onTap: (){
                  startTimeWithTimer();
                },
              )
            ],
          ),
          SizedBox(height: 20,),
          InkWell(
            child: Text(
              msg4,
            ),
            onTap: () async {
              await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
              setState(() {
                (msg4 == "Click Delay for change...")
                    ? msg4 = "Changed after click"
                    : msg4 = "Click Delay for change...";
              });
              // Future.delayed(Duration(seconds: 2),(){
              //   setState(() {
              //     (msg4 == "Click Delay for change...")
              //         ? msg4 = "Changed after click"
              //         : msg4 = "Click Delay for change...";
              //   });
              // });
            },
          )
        ],
      ),
    );
  }
}