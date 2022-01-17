import 'package:flutter/material.dart';

class Item {
  const Item(this.name, this.icon);

  final String name;
  final Icon icon;
}

class MDropDown extends StatefulWidget {
  @override
  _MDropDown createState() {
    return _MDropDown();
  }
}

class _MDropDown extends State<MDropDown> {
  Item selectedUser;

  List<Item> users = <Item>[
    const Item(
        'Android',
        Icon(
          Icons.android,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'Flutter',
        Icon(
          Icons.flag,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'ReactNative',
        Icon(
          Icons.format_indent_decrease,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'iOS',
        Icon(
          Icons.mobile_screen_share,
          color: const Color(0xFF167F67),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<Item>(
        hint: Text("Select item"),
        value: selectedUser,
        onChanged: (Item value) {
          setState(() {
            selectedUser = value;
          });
        },
        items: users.map((Item user){
          return DropdownMenuItem<Item>(
            value: user,
            child: Row(
              children: [
                user.icon,
                SizedBox(width: 10,),
                Text(
                  user.name,
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
