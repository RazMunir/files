import 'package:flutter/material.dart';
import 'package:flutter_profile_app/screens/group_create/chat_screen.dart';
import 'package:flutter_profile_app/screens/group_create/add_member.dart';

class GroupInfo extends StatefulWidget{

  final List<ChatModel> groupMemberList;
  GroupInfo({this.groupMemberList});

  @override
  State<StatefulWidget> createState() {
    return _GroupInfo();
  }
}

class _GroupInfo extends State<GroupInfo>{

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
          "Group Info",
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
                  MaterialPageRoute(builder: (context) => ChatScreen(groupMemberList: widget.groupMemberList,)),
                );
              },
              child: Icon(Icons.more_vert_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(
            children: [
              TextButton(
                child: Text("Add Member"),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddMember()),
                  );
                },
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