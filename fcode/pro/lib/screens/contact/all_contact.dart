import 'package:flutter/material.dart';

class AllContact extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AllContact();
  }
}

class _AllContact extends State<AllContact>{

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
    ChatModel(name: "Tester", status: "I find the bugs"),
    ChatModel(name: "Tester", status: "I find the bugs"),
    ChatModel(name: "Tester", status: "I find the bugs"),
    ChatModel(name: "Tester", status: "I find the bugs"),
  ];

  TextEditingController searchController = new TextEditingController();
  bool isSearchBarShow = false;

  List<ChatModel> foundMember = [];

  @override
  void initState() {
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
                      "All Contact",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff607d8b)),
                    ),
                  ],
                )
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
        child: Icon(Icons.arrow_forward),
        onPressed: () {},
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: foundMember.length,
            itemBuilder: (context, index){
              return InkWell(
                child: index == 0
                    ? Column(
                      children: [
                        Container(
                          height: 200,
                        ),
                        ContactCard(contact: foundMember[index],)
                      ],
                    )
                    : ContactCard(contact: foundMember[index],),
                onTap: (){
                  setState(() {
                    if (foundMember[index].select == true) {
                      foundMember[index].select = false;
                    } else {
                      foundMember[index].select = true;
                    }
                  });
                },
              );
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Color(0xfff4f4f9),
                  child: Column(
                    children: [
                      _buildButton(
                        'New Contact',
                        Icons.person_add_alt_1_rounded,
                        (){
                          print('clicked New Contact');
                        }
                      ),
                      _buildButton(
                        'Pending Contact',
                        Icons.pending_actions_outlined,
                        (){
                          print('clicked Pending Contact');
                        }
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 15,
                          left: 10
                        ),
                        child: Row(
                          children: [
                            Text(
                              "My Contacts",
                              style: TextStyle(
                                fontSize: 16
                              ),
                            ),
                            SizedBox(width: 5,),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 28,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // Divider(
                //   thickness: 1,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
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

  Widget _buildButton(String name, IconData icon, Function onPress){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5.0,
          primary: Colors.white,
          padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: onPress,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Color(0xFF527DAA),
            ),
            SizedBox(width: 10,),
            Text(
              name,
              style: TextStyle(
                color: Color(0xFF527DAA),
                letterSpacing: 1,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget{
  final ChatModel contact;

  const ContactCard({Key key, this.contact}) : super(key: key);

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