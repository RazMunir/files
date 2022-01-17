import 'package:flutter/material.dart';
import 'package:flutter_profile_app/screens/group_create/chat_screen.dart';
import 'package:flutter_profile_app/screens/group_create/add_member.dart';

class AddName extends StatefulWidget{

  final List<ChatModel> groupMemberList;
  AddName({this.groupMemberList});

  @override
  State<StatefulWidget> createState() {
    return _AddName();
  }
}

class _AddName extends State<AddName>{

  TextEditingController groupNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8ededfb),
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Color(0xff607d8b),
            size: 26,
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          "New Group",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff607d8b)),
        ),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen(groupName: groupNameController.text,groupMemberList: widget.groupMemberList)),
              );
            },
            child: Text(
              "CREATE",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54
              ),
            )
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Name your new chat",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                controller: groupNameController,
                cursorWidth: 1,
                style: TextStyle(
                  color: Colors.black87,
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Group Name (Required)",
                  border: InputBorder.none,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "${widget.groupMemberList.length} Participants",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.groupMemberList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index){
                  return ContactCard(contact: widget.groupMemberList[index],);
                },
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}

class ContactCard extends StatelessWidget {
  const ContactCard({Key key, this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 53,
        child: Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/person.png"),
              radius: 23,
              backgroundColor: Colors.blueGrey[200],
            ),
          ],
        ),
      ),
      title: Text(
        contact.name,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        contact.status,
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}