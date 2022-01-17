import 'package:flutter/material.dart';
import 'package:flutter_profile_app/screens/group_create/add_name.dart';

class AddMember extends StatefulWidget {
  AddMember({Key key}) : super(key: key);

  @override
  _AddMember createState() => _AddMember();
}

class _AddMember extends State<AddMember> {
  List<ChatModel> contacts = [
    ChatModel(name: "Main uddin", status: "A full stack developer"),
    ChatModel(name: "Jumon", status: "Nodejs Developer..........."),
    ChatModel(name: "Sakib", status: "Web developer..."),
    ChatModel(name: "Munir Khan", status: "Flutter Developer....."),
    ChatModel(name: "Somsher", status: "Raect developer.."),
    ChatModel(name: "Kenecholor", status: "Full Stack Web"),
    ChatModel(name: "Testing1", status: "Example work"),
    ChatModel(name: "Testing2", status: "Sharing is caring"),
    ChatModel(name: "Bilai", status: "....."),
    ChatModel(name: "Helper", status: "Love you Mom Dad"),
    ChatModel(name: "Tester", status: "I find the bugs"),
  ];
  List<ChatModel> groupmember = [];

  List<ChatModel> foundMember = [];

  TextEditingController searchController = new TextEditingController();
  bool isSearchBarShow = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    foundMember = contacts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff4f4f9),
        appBar: AppBar(
          backgroundColor: Color(0xff8ededfb),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSearchBarShow
                  ?
              TextField(
                controller: searchController,
                autofocus: true,
                cursorWidth: 1,
                style: TextStyle(
                  color: Colors.black87,
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter the user name",
                  border: InputBorder.none,
                ),
                onChanged: (value) => _runFilter(value),
              )
                  :
              Column(
                children: [
                  Text(
                    "New Group",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff607d8b)),
                  ),
                  Text(
                    "Add participants",
                    style: TextStyle(fontSize: 13, color: Color(0xff607d8b)),
                  )
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                size: 26,
                color: Color(0xff607d8b),
              ),
              onPressed: () {
                setState(() {
                  searchController.clear();
                  _runFilter("");
                  isSearchBarShow = !isSearchBarShow;
                });
              }
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFF128C7E),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddName(groupMemberList: groupmember,)),
              );
            },
            child: Icon(Icons.arrow_forward)),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: foundMember.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groupmember.length > 0 ? 90 : 10,
                    );
                  }
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (foundMember[index - 1].select == true) {
                          groupmember.remove(foundMember[index - 1]);
                          foundMember[index - 1].select = false;
                        } else {
                          groupmember.add(foundMember[index - 1]);
                          foundMember[index - 1].select = true;
                        }
                      });
                      // contacts.forEach((element) {
                      //   print("${element.select} - ${foundMember.length} - ${contacts.length}");
                      // });
                    },
                    child: ContactCard(
                      contact: foundMember[index - 1],
                    ),
                  );
                }),
            groupmember.length > 0
                ? Align(
                    child: Column(
                      children: [
                        Container(
                          height: 75,
                          color: Colors.white,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: contacts.length,
                              itemBuilder: (context, index) {
                                if (contacts[index].select == true)
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        groupmember.remove(contacts[index]);
                                        contacts[index].select = false;
                                      });
                                    },
                                    child: AvatarCard(
                                      chatModel: contacts[index],
                                    ),
                                  );
                                return Container();
                              })
                        ),
                        Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                    alignment: Alignment.topCenter,
                  )
                : Container(),
          ],
        ));
  }

  void _runFilter(String enteredKeyword) {
    List<ChatModel> results = [];

    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = contacts;
    } else {
      results = contacts.where((user) =>
          user.name.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      foundMember = results;
    });
  }
}

class AvatarCard extends StatelessWidget {
  const AvatarCard({Key key, this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Container(
                width: 50,
                height: 50,
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
                          "images/person_2.jpg",
                        ),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 13,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            chatModel.name,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
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
        contact.select == true
            ?  Icons.remove_circle_outline
            :  Icons.person_add_alt_1_outlined
      ),
    );
  }
}

class ChatModel {
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  String status;
  bool select = false;
  int id;

  ChatModel({
    this.name,
    this.icon,
    this.isGroup,
    this.time,
    this.currentMessage,
    this.status,
    this.select = false,
    this.id,
  });
}
