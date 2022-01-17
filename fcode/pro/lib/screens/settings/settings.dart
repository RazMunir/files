import 'package:flutter/material.dart';

class Settings extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Settings();
  }
}

class _Settings extends State<Settings>{

  void showToast(String msg){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Dissmiss',
          onPressed: () {
            SnackBarClosedReason.dismiss;
          },
        )
    ));
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
            fontSize: 16,
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
                  Icon(
                    Icons.qr_code_outlined,
                    size: 27,
                    color: Color(0xFF464A65),
                  )
                ],
              ),
            ),
            Divider(),
            SettingsItems(
              title: "Account",
              subTitle: "Privacy, Security, Change number",
              icon: Icons.vpn_key,
              onPress: (){
                showToast("Account Clicked");
              },
            ),
            SettingsItems(
              title: "Appearance",
              subTitle: "Theme, wallpapers, chat history",
              icon: Icons.color_lens_outlined,
              onPress: (){
                showToast("Appearance Clicked");
              },
            ),
            SettingsItems(
              title: "Notifications",
              subTitle: "Message, group & call tones",
              icon: Icons.notifications,
              onPress: (){
                showToast("Notifications Clicked");
              },
            ),
            SettingsItems(
              title: "Storage and data",
              subTitle: "Network usage, auto-download",
              icon: Icons.data_usage_outlined,
              onPress: (){
                showToast("Storage Clicked");
              },
            ),
            SettingsItems(
              title: "Help",
              subTitle: "Help center, contact us, privacy policy",
              icon: Icons.help,
              onPress: (){
                showToast("Help Clicked");
              },
            ),
            SettingsItemsWithoutSubtitle(
              title: "Invite a friend",
              subTitle: "",
              icon: Icons.group,
              onPress: (){
                showToast("Invite Clicked");
              },
            ),
            SizedBox(height: 20,),
            Text("from"),
            Text(
              "AS LIMITED",
              style: TextStyle(
                fontWeight: FontWeight.bold
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
            color: Color(0xFF464A65),
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

class SettingsItemsWithoutSubtitle extends StatelessWidget{
  final String title;
  final String subTitle;
  final IconData icon;
  final Function onPress;

  SettingsItemsWithoutSubtitle({this.title, this.subTitle, this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(
            icon,
            size: 23,
            color: Color(0xFF464A65),
          ),
        ),
        title: Text(
            title
        )
      ),
      onTap: onPress,
    );
  }
}
