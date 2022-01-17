import 'package:flutter/material.dart';
import 'package:flutter_profile_app/screens/group_create/add_member.dart';

class BlockAMember extends StatefulWidget{

  final List<ChatModel> groupMemberList;
  BlockAMember({this.groupMemberList});

  @override
  State<StatefulWidget> createState() {
    return _BlockAMember();
  }
}

class _BlockAMember extends State<BlockAMember>{
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
          "Block a Member",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff607d8b)),
        ),
        //   actions: [
        //     TextButton(
        //       onPressed: (){
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => ChatScreen(groupMemberList: widget.groupMemberList,)),
        //         );
        //       },
        //       child: Icon(Icons.more_vert_outlined),
        //     )
        //   ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          children: [
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
            Expanded(
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: widget.groupMemberList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index){
                  return ContactCard(contact: widget.groupMemberList[index],);
                },
              ),
            ),
          ],
        ),
      ),
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
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18.0),
                    bottomRight: Radius.circular(18.0),
                    bottomLeft: Radius.circular(18.0),
                    topLeft: Radius.circular(18.0),
                  ),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage(
                        "images/person.png",
                      ),
                      fit: BoxFit.cover)),
            ),
            contact.select
                ? Positioned(
              // bottom: 4,
              // right: 5,
              bottom: 2,
              right: 2,
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 11,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            )
                : Container(),
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
      trailing: Icon(
          Icons.block
      ),
    );
  }
}