import 'package:flutter/material.dart';
import 'package:flutter_profile_app/example/whatsapp_clone/tab_pages/calls_page.dart';
import 'package:flutter_profile_app/example/whatsapp_clone/tab_pages/camera_page.dart';
import 'package:flutter_profile_app/example/whatsapp_clone/tab_pages/chat_page.dart';
import 'package:flutter_profile_app/example/whatsapp_clone/tab_pages/status_page.dart';

class WhatsAppMain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatApp Clone Example',
      theme: ThemeData(
          primaryColor: Color(0XFF075E54),
          accentColor: Color(0XFF25D366) // green color for whatapp clone theme
      ),
      home: WhatsAppMain_(),
    );
  }
}

class WhatsAppMain_ extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _WhatsAppMain();
  }
}

class _WhatsAppMain extends State<WhatsAppMain_> with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // total tab we are creating is 4 so : length is 4 : initialIndex is set to position 1
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp Clone app UI"),
        elevation: 0.5,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          // indicatorColor: Colors.redAccent,
          // unselectedLabelColor: Colors.lightBlue,
          // labelColor: Colors.redAccent,
          tabs: <Widget>[
            // here we are creating 4 Tabs
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(text: "CALLS")
          ],
        ),
        //we need 2 menu icons on app bar : search and more setting
        actions: <Widget>[
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
          ),
          Icon(Icons.more_vert)
        ],
      ),
      body: TabBarView(
        //this will work similar to fragment in android app
        controller: _tabController,
        //loading 4 pages in tabs
        children: <Widget>[CameraPage(), ChatPage(), Statuspage(), CallsPage()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Floating Button Clicked");
        },
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }
}