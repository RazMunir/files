import 'package:flutter/material.dart';

var color = [
  {'icon': 0xFF8C93C7},
  // {'icon': 0xFF8F95C8},
  {'barBg': 0xFF8EDEDFB},
  {'text': 0xFF464A64},
  {'barShadow': 0xFFA5A3D1},
  {'bg': 0xFFF4F4F9},
  {'iconBelow': 0xFF464A65},
  {'iconBg': 0xFFCBC8E5},
];

class PersonalProfileComplete extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PersonalProfileComplete();
  }
}

class _PersonalProfileComplete extends State<PersonalProfileComplete>{

  //App Bar
  bool isExpanded = false;

  void changeExpandedState() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  //Body
  bool isEditablePersonalInfo = false,
      isEditableLocation = false,
      isEditableContact = false;

  TextEditingController nameController = TextEditingController(text: "Bronu Marse"),
      aboutController = TextEditingController(text: "Professional"),
      genderController = TextEditingController(text: "Male"),
      birthdayController = TextEditingController(text: "1990/01/01");
  TextEditingController cityController = TextEditingController(text: "Lal Khan Bazar"),
      stateController = TextEditingController(text: "Chittagong"),
      countryController = TextEditingController(text: "Bangladesh");
  TextEditingController primaryEmailController = TextEditingController(text: "example@gmail.com"),
      emailController = TextEditingController(text: "example@gmail.com"),
      mobileController = TextEditingController(text: "+880131406651"),
      homeController = TextEditingController(text: "+880131406651"),
      officeController = TextEditingController(text: "+880131406651");

  //focus node
  var focusNodes = List.generate(12, (index) => FocusNode());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNodes[0].addListener(() {
      print("clicked");
      focusNodes[0].requestFocus();
      print("Has focus: ${focusNodes[0].hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(color.elementAt(4).values.first),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              // height: 70.0,
              margin: EdgeInsets.only(bottom: 1.0),
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Color(color.elementAt(1).values.first),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.only(top: 25, left: 10),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 22,
                        color: Color(color.elementAt(0).values.first),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                          child: InkWell(
                            onTap: changeExpandedState,
                            child: Container(
                              width: 60,
                              height: 65,
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
                                    image: AssetImage('images/person.png'),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: InkWell(
                            onTap: changeExpandedState,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  // color: Colors.red,
                                  child: Text(
                                    "Bronu Marse",
                                    style: TextStyle(
                                        color: Color(
                                            color.elementAt(2).values.first),
                                        fontSize: 14),
                                  ),
                                ),
                                Container(
                                  // color: Colors.red,
                                  margin: EdgeInsets.only(left: 5),
                                  child: Icon(
                                    isExpanded
                                        ? Icons.keyboard_arrow_up_outlined
                                        : Icons.keyboard_arrow_down_outlined,
                                    color: Color(color.elementAt(0).values.first),
                                    size: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: !isExpanded
                              ? Container()
                              : Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                iconBuilder(Icons.call),
                                iconBuilder(Icons.videocam_rounded),
                                iconBuilder(Icons.add_alert),
                                iconBuilder(Icons.share_outlined),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _titlePortion("Personal Information", isEditablePersonalInfo, () {
                setState(() {
                  isEditablePersonalInfo = !isEditablePersonalInfo;
                  // FocusScope.of(context).requestFocus(focusNodes[0]);
                });
                if(nameController != null){
                  String data = nameController.text+"-"+aboutController.text+"-"+genderController.text+"-"+birthdayController.text;
                  print("$data");
                }
              }
            ),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
                child: Column(children: [
                  _infoCard("Name", "Bronu Marse", Colors.black87,
                      Icons.person_outline, isEditablePersonalInfo, nameController,
                      focusNodes[0],() {}),
                  _divider(),
                  _infoCard("About me", "Professional", Colors.black87,
                      Icons.info_outline, isEditablePersonalInfo, aboutController,
                      focusNodes[1], () {}),
                  _divider(),
                  _infoCard("Gender", "Male", Colors.black87,
                      Icons.category_outlined, isEditablePersonalInfo, genderController,
                      focusNodes[2], () {}),
                  _divider(),
                  _infoCard("Birthday", "1990/01/01", Colors.black87,
                      Icons.card_giftcard_outlined, isEditablePersonalInfo, birthdayController,
                      focusNodes[3], () {}),
                  _divider(),
                ])
            ),
            _titlePortion("Location", isEditableLocation, () {
              setState(() {
                isEditableLocation = !isEditableLocation;
              });
              if(cityController != null){
                String data = cityController.text+"-"+stateController.text+"-"+countryController.text;
                print("$data");
              }
            }),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
              child: Column(
                children: [
                  _infoCard("City", "Lal Khan Bazar", Colors.black87,
                      Icons.location_city_outlined, isEditableLocation, cityController,
                      focusNodes[4],() {}),
                  _divider(),
                  _infoCard("State", "Chittagong", Colors.black87,
                      Icons.location_on_outlined, isEditableLocation, stateController,
                      focusNodes[5],() {}),
                  _divider(),
                  _infoCard("Country", "Bangladesh", Colors.black87,
                      Icons.location_on_outlined, isEditableLocation, countryController,
                      focusNodes[6],() {}),
                  _divider(),
                ],
              ),
            ),
            _titlePortion("Contact", isEditableContact, () {
              setState(() {
                isEditableContact = !isEditableContact;
              });
              if(primaryEmailController != null){
                String data = primaryEmailController.text+"-"+emailController.text+"-"+mobileController.text+"-"+homeController.text+"-"+officeController.text;
                print("$data");
              }
            }),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
              child: Column(
                children: [
                  _infoCard("Primary Email", "example@gmail.com", Colors.black87,
                      Icons.alternate_email_rounded, isEditableContact, primaryEmailController,
                      focusNodes[7], () {}),
                  _divider(),
                  _infoCard("Email", "example@gmail.com", Colors.black87,
                      Icons.alternate_email_rounded, isEditableContact, emailController,
                      focusNodes[8], () {}),
                  _divider(),
                  _infoCard("Mobile Phone", "+880131406651", Colors.black87,
                      Icons.phone_outlined, isEditableContact, mobileController,
                      focusNodes[9], () {}),
                  _divider(),
                  _infoCard("Home Phone", "+880131406651", Colors.black87,
                      Icons.phone_outlined, isEditableContact, homeController,
                      focusNodes[10], () {}),
                  _divider(),
                  _infoCard("Office Phone", "+880131406651", Colors.black87,
                      Icons.phone_outlined, isEditableContact, officeController,
                      focusNodes[11], () {}),
                  _divider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget iconBuilder(IconData icon){
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Container(
        width: 32,
        height: 30,
        child: Icon(icon,
            size: 20,
            color: Color(color
                .elementAt(5)
                .values
                .first)),
        decoration: BoxDecoration(
          color: Color(color
              .elementAt(6)
              .values
              .first),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight:
              Radius.circular(12)),
        ),
      ),
    );
  }

  Widget _titlePortion(String title, bool isEditable, Function onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 10, top: 25, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            Icon(
              isEditable ? Icons.done_all_outlined : Icons.edit_outlined,
              size: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return SizedBox(
      height: 1.5,
      child: Container(
        color: Colors.white,
      ),
      // color: Colors.white,
    );
  }

  Widget _infoCard(String title, String value, Color color, IconData icon,
      bool isEnabled, TextEditingController controller, FocusNode focusNode, Function onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(left: 0, right: 0, top: 12, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    title,
                    style: TextStyle(
                        color:
                        (color == Colors.redAccent) ? color : Colors.black,
                        fontSize: 14),
                  ),
                )
              ],
            ),
            Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    color: isEnabled ? Colors.red[50] : Colors.transparent,
                    child: TextFormField(
                      focusNode: focusNode,
                      controller: controller,
                      enabled: isEnabled,
                      // initialValue: value,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(3),
                        hintText: "One",
                        // border: OutlineInputBorder()
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}