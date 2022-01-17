import 'package:flutter/material.dart';
import 'package:flutter_profile_app/screens/settings/block_contacts.dart';
import 'package:flutter_profile_app/screens/settings/help_feedback.dart';
import 'package:flutter_profile_app/screens/settings/notifications.dart';

import 'account.dart';
import 'appearance.dart';

class SettingsV2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SettingsV2();
  }
}

class _SettingsV2 extends State<SettingsV2>{
  void navigatePage(Widget page){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F9),
      appBar: AppBar(
        backgroundColor: Color(0xFF8EDEDFB),
        // centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            color: Color(0xFF464A64),
            fontSize: 19,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 55,
                        height: 60,
                        // margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            border: Border.all(
                                color: Colors.grey, width: 0.4),
                            image: DecorationImage(
                              image: AssetImage('images/munir.jpg'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "RzM",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF464A64)
                              ),
                            ),
                            Text(
                              "Alhumdulillah",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Icon(
                  //   Icons.qr_code_outlined,
                  //   size: 27,
                  //   color: Color(0xFF464A65),
                  // )
                ],
              ),
            ),
            Divider(),
            SettingsItems(
              title: "Account",
              subTitle: "Privacy, Security, Change number",
              icon: Icons.vpn_key_outlined,
              onPress: (){
                navigatePage(Account());
              },
            ),
            SettingsItems(
              title: "Appearance",
              subTitle: "Theme, wallpapers, chat history",
              icon: Icons.color_lens_outlined,
              onPress: (){
                navigatePage(Appearance());
              },
            ),
            SettingsItems(
              title: "Notifications",
              subTitle: "Message, group & call tones",
              icon: Icons.notifications_none_outlined,
              onPress: (){
                navigatePage(Notifications());
              },
            ),
            SettingsItems(
              title: "Blocked Contacts",
              subTitle: "Blocked contacts list",
              icon: Icons.block_flipped,
              onPress: (){
                navigatePage(BlockContacts());
              },
            ),
            SettingsItems(
              title: "Help & Feedback",
              subTitle: "Help center, contact us, privacy policy",
              icon: Icons.help_center_outlined,
              onPress: (){
                navigatePage(HelpFeedback());
              },
            ),
            SizedBox(height: 25,),
            Image.asset("images/logo.png"),
            SizedBox(height: 5,),
            Text(
              "Version 1.1",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

class SettingsItems extends StatelessWidget{
  final String title;
  final String subTitle;
  final IconData icon;
  final Function onPress;

  SettingsItems({this.title, this.subTitle, this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(
            icon,
            size: 23,
            color: Color(0xFF8F95C8),
          ),
        ),
        title: Text(
            title
        ),
        subtitle: Text(
            subTitle
        ),
      ),
      onTap: onPress,
    );
  }
}