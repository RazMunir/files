import 'package:flutter/material.dart';
import 'package:flutter_profile_app/practice_v2/m_button.dart';
import 'package:flutter_profile_app/practice_v2/m_circle_avater.dart';
import 'package:flutter_profile_app/practice_v2/m_text.dart';
import 'package:flutter_profile_app/practice_v2/m_text_field.dart';
import 'package:flutter_profile_app/practice_v3/m_align.dart';
import 'package:flutter_profile_app/practice_v3/m_container.dart';
import 'package:flutter_profile_app/practice_v3/m_gesture_detector.dart';
import 'package:flutter_profile_app/practice_v3/m_stack.dart';
import 'package:flutter_profile_app/practice_v4/enable_disable.dart';
import 'package:flutter_profile_app/practice_v4/m_bottom_bar.dart';
import 'package:flutter_profile_app/practice_v4/m_elevation.dart';
import 'package:flutter_profile_app/practice_v4/m_elevation_v2.dart';
import 'package:flutter_profile_app/practice_v4/m_list_view.dart';
import 'package:flutter_profile_app/practice_v4/m_list_view_horizontal.dart';
import 'package:flutter_profile_app/practice_v4/overlap.dart';
import 'package:flutter_profile_app/practice_v4/rv_item.dart';
import 'package:flutter_profile_app/practice_v5/reusable_code.dart';
import 'package:flutter_profile_app/practice_v6/m_snack_bar.dart';
import 'package:flutter_profile_app/practice_v6/m_toast.dart';
import 'package:flutter_profile_app/screens/chat_screen.dart';
import 'package:flutter_profile_app/screens/m_profile_screen.dart';
import 'file:///E:/FlutterProjects/flutter_profile_app/lib/screens/friend_profile/m_profile_screen_v2.dart';

void main() {
  runApp(new Main());
}

class Main extends StatefulWidget {
  @override
  _Main createState() {
    return _Main();
  }
}

class _Main extends State<Main> {
  String _value = 'one';
  // final List<DropdownMenuItem<String>> items;

  /// Initialize dropdown menu
  // List<DropdownMenuItem<String>> buildDropdownMenuItems(List menu) {
  //   List<DropdownMenuItem<String>> items = List();
  //   for (String li in menu) {
  //     items.add(
  //       DropdownMenuItem(
  //         value: li,
  //         child: SizedBox(
  //           width: 100,
  //           child: Text(li, style:  TextStyle(color: Colors.black, fontWeight:
  //           FontWeight.bold),
  //             textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,),),
  //       ),
  //     );
  //   }
  //   return items;
  // }

  // const DropdownMenuItem({
  //   Key key,
  //   this.value,
  //   @required this.child,
  // })

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          // appBar: new AppBar(
          //   title: new Theme(
          //     child: new DropdownButtonHideUnderline(
          //       child: new DropdownButton<String>(
          //         value: _value,
          //         items: <DropdownMenuItem<String>>[
          //           new DropdownMenuItem(
          //             child: new Text('My Page'),
          //             value: 'one',
          //           ),
          //         ],
          //         onChanged: (String value) {
          //           setState(() => _value = value);
          //         },
          //       ),
          //     ),
          //     data: new ThemeData.dark(),
          //   ),
          // ),
          appBar: AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                DropdownMenuItem(
                  value: "2",
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.settings),
                      SizedBox(width: 10),
                      Text(
                        "Setting",
                      ),
                    ],
                  ),
                ),
              ],
              //   onChanged: (value) {
              //     setState(() {
              //       _value = value;
              //     });
              //   },
              //   value: _value,
              //   isExpanded: true,
              // );,
            ),
          ),
          body: MProfileScreenV2(),
        )
    );
  }
}

// class Main extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: "Flutter App",
//         home: Scaffold(
//           appBar: PreferredSize(
//             preferredSize: Size.fromHeight(110.0),
//             child: AppBar(
//               flexibleSpace: Text("Flexibel space"),
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back_outlined),
//               ),
//               backgroundColor: Colors.white,
//               bottom: PreferredSize(
//                 preferredSize: Size.fromHeight(60),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.videocam),
//                       onPressed: () {},
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.videocam),
//                       onPressed: () {},
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.videocam),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//               iconTheme: IconThemeData(color: Colors.black54),
//               title: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   // MyCircleAvatar(
//                   //   imgUrl: friendsList[0]['imgUrl'],
//                   // ),
//                   // SizedBox(width: 15),
//                   Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       MyCircleAvatar(
//                         imgUrl: friendsList[0]['imgUrl'],
//                       ),
//                       Text(
//                         "Main",
//                         style: Theme.of(context).textTheme.subhead, textAlign: TextAlign.center,
//                         overflow: TextOverflow.clip,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               // actions: <Widget>[
//               //   Container(
//               //     margin: EdgeInsets.symmetric(horizontal: 20),
//               //     color: Colors.limeAccent,
//               //     child: IconButton(
//               //       icon: Icon(Icons.phone),
//               //       onPressed: () {},
//               //     ),
//               //   ),
//               //   IconButton(
//               //     icon: Icon(Icons.videocam),
//               //     onPressed: () {},
//               //   ),
//               //   IconButton(
//               //     icon: Icon(Icons.more_vert),
//               //     onPressed: () {},
//               //   ),
//               // ],
//             ),
//           ),
//           body: Material(
//             color: Colors.white,
//             child: MProfileScreenV2(),
//           ),
//         ));
//   }
// }


//
// class Main extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: "Flutter App",
//         home: Scaffold(
//           appBar: AppBar(title: Text("Practice Mode v2"),),
//           body: Material(
//             color: Colors.red,
//             child: MTextField(),
//           ),
//         )
//     );
//   }
// }
