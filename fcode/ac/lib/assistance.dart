import 'package:flutter/material.dart';

Map<String, int> colors = {
  "bg": 0xFF431447,
  "title": 0xFFFAF8F8,
  "icon": 0xFFFAF8F8,
  "compTitle": 0xFFF66059
};

List<Map<String, dynamic>> shortcuts = [
  {'name': '3K','value': 3000},
  {'name': '3.5K','value': 3500},
  {'name': '4K','value': 4000},
  {'name': '4.5K','value': 4500},
  {'name': '5K','value': 5000},
  {'name': '5.5K','value': 5500}
];

class AssistanceCalc extends StatefulWidget {
  @override
  _AssistanceCalcState createState() => _AssistanceCalcState();
}

class _AssistanceCalcState extends State<AssistanceCalc> {
  int totalAmount = 0;
  List<Map<String, dynamic>> totalSortedShortcuts = [];

  int checkTotalClickedOnAObject(Map<String, dynamic> clickedValue){
    int count = 0;
    totalSortedShortcuts.forEach((element) {
      if(element.containsValue(clickedValue['name'])){
        count = count + 1;
      }
    });

    return count;
  }

  @override
  Widget build(BuildContext context) {
    double unitSize = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      backgroundColor: Color(colors["bg"]),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(unitSize*2),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _buildAppBar(),
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "$totalAmount",
                                      style: TextStyle(
                                          color: Color(colors['title']),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Total Amount",
                                      style: TextStyle(
                                          color: Color(colors['title']),
                                          fontSize: 12
                                      ),
                                    )
                                  ]
                              ),
                            ),
                            SizedBox(height: unitSize * 2,),
                            RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "${totalSortedShortcuts.length}",
                                      style: TextStyle(
                                          color: Color(colors['title']),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Total Units",
                                      style: TextStyle(
                                          color: Color(colors['title']),
                                          fontSize: 12
                                      ),
                                    )
                                  ]
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            // childAspectRatio: 3
                          ),
                          // physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: shortcuts.length,
                          itemBuilder: (context, index){
                            return _buildShortcutItems(index);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: unitSize),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Developed by",
                        style: TextStyle(
                          color: Color(colors['title']),
                          fontSize: 14
                        )
                      ),
                      TextSpan(
                          text: " RzM",
                          style: TextStyle(
                            color: Color(colors['compTitle']),
                            fontSize: 16,
                            fontWeight: FontWeight.w900
                          )
                      )
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildShortcutItems(int index){
    return Container(
      child: ActionChip(
        padding: EdgeInsets.symmetric(horizontal: 10),
        label: Text(
          "${shortcuts[index]['name']} (${checkTotalClickedOnAObject(shortcuts[index])})",
          style: TextStyle(
              color: Color(colors['title'])
          ),
        ),
        backgroundColor: Color(colors['bg']),
        onPressed: (){
          totalSortedShortcuts.add(shortcuts[index]);
          totalAmount = totalAmount + shortcuts[index]['value'];
          setState(() {});
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(
                width: 1,
                color: Color(colors['title'])
            )
        ),
      ),
    );
  }

  _buildAppBar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "MainTitle",
              style: TextStyle(
                color: Color(colors['title']),
                fontSize: 14,
              ),
            ),
            Text(
              "SubTitle",
              style: TextStyle(
                  color: Color(colors['compTitle']),
                  fontSize: 16,
                  fontWeight: FontWeight.w900
              ),
            )
          ],
        ),
        Row(
          children: [
            (totalSortedShortcuts.isEmpty)
                ? Container()
                : _buildBarActionButton(icon: Icons.undo_outlined, onTap: (){
                      totalAmount = totalAmount - totalSortedShortcuts[totalSortedShortcuts.length - 1]['value'];
                      totalSortedShortcuts.removeLast();
                      setState(() {});
                    },
                  ),
            _buildBarActionButton(icon: Icons.menu_outlined, onTap: null),
          ],
        )
      ],
    );
  }

  Widget _buildBarActionButton({ IconData icon, Function onTap}){
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Icon(
          icon,
          color: Color(colors['icon']),
        ),
      ),
      onTap: onTap,
    );
  }
}
