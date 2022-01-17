import 'package:flutter/material.dart';

class MPersonProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MPersonProfileScreen();
  }
}

class _MPersonProfileScreen extends State<MPersonProfileScreen> {
  bool isEditablePersonalInfo = false,
      isEditableLocation = false,
      isEditableContact = false;

  TextEditingController nameController = new TextEditingController(),
      aboutController = new TextEditingController(),
      birthdayController = new TextEditingController();
  TextEditingController cityController = new TextEditingController(),
      stateController = new TextEditingController(),
      countryController = new TextEditingController();
  TextEditingController primaryEmailController = new TextEditingController(),
      emailController = new TextEditingController(),
      mobileController = new TextEditingController(),
      homeController = new TextEditingController(),
      officeController = new TextEditingController();

  String selectedOption = "Male";
  List<String> options = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _titlePortion("Personal Information", isEditablePersonalInfo, () {
          setState(() {
            isEditablePersonalInfo = !isEditablePersonalInfo;
            if(nameController!=null){
              String data = nameController.text.toString();
              print("{$data}");
            }
          });
        }),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
            child: Column(children: [
              _infoCard("Name", "Bronu Marse", Colors.black87,
                  Icons.person_outline, isEditablePersonalInfo, nameController, () {}),
              _divider(),
              _infoCard("About me", "Professional", Colors.black87,
                  Icons.info_outline, isEditablePersonalInfo, aboutController, () {}),
              _divider(),
              _infoCardForDD("Gender", "Male", Colors.black87,
                  Icons.category_outlined, isEditablePersonalInfo, () {}),
              _divider(),
              _infoCard("Birthday", "1990/01/01", Colors.black87,
                  Icons.card_giftcard_outlined, isEditablePersonalInfo, birthdayController, () {}),
              _divider(),
            ])),
        _titlePortion("Location", isEditableLocation, () {
          setState(() {
            isEditableLocation = !isEditableLocation;
          });
        }),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
          child: Column(
            children: [
              _infoCard("City", "Lal Khan Bazar", Colors.black87,
                  Icons.location_city_outlined, isEditableLocation, cityController, () {}),
              _divider(),
              _infoCard("State", "Chittagong", Colors.black87,
                  Icons.location_on_outlined, isEditableLocation, stateController, () {}),
              _divider(),
              _infoCard("Country", "Bangladesh", Colors.black87,
                  Icons.location_on_outlined, isEditableLocation, countryController, () {}),
              _divider(),
            ],
          ),
        ),
        _titlePortion("Contact", isEditableContact, () {
          setState(() {
            isEditableContact = !isEditableContact;
          });
        }),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
          child: Column(
            children: [
              _infoCard("Primary Email", "example@gmail.com", Colors.black87,
                  Icons.alternate_email_rounded, isEditableContact, primaryEmailController, () {}),
              _divider(),
              _infoCard("Email", "example@gmail.com", Colors.black87,
                  Icons.alternate_email_rounded, isEditableContact, emailController, () {}),
              _divider(),
              _infoCard("Mobile Phone", "+880131406651", Colors.black87,
                  Icons.phone_outlined, isEditableContact, mobileController, () {}),
              _divider(),
              _infoCard("Home Phone", "+880131406651", Colors.black87,
                  Icons.phone_outlined, isEditableContact, homeController, () {}),
              _divider(),
              _infoCard("Office Phone", "+880131406651", Colors.black87,
                  Icons.phone_outlined, isEditableContact, officeController, () {}),
              _divider(),
            ],
          ),
        )
      ],
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
      bool isEnabled, TextEditingController controller, Function onPressed) {
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
                child: Container(
              child: TextFormField(
                controller: controller,
                enabled: isEnabled,
                initialValue: value,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(3),
                    hintText: "One",
                    // border: OutlineInputBorder()
                    border: InputBorder.none),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _infoCardForDD(String title, String value, Color color, IconData icon,
      bool isEnabled, Function onPressed) {
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
            isEnabled
                ? DropdownButton<String>(
                    underline: Container(),
                    value: selectedOption,
                    isDense: true,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                    onChanged: (String value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                    items: options.map((String v) {
                      return DropdownMenuItem<String>(
                        value: v,
                        child: Text(v),
                      );
                    }).toList(),
                  )
                : Container(
                    child: Text(
                      selectedOption,
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
