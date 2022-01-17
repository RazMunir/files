import 'package:flutter/material.dart';

class PMSMain extends StatefulWidget {
  @override
  _PMSMainState createState() => _PMSMainState();
}

class _PMSMainState extends State<PMSMain> {
  List<String> featureList = [
    "Dashboard",
    "Landing page",
    "Home page"
  ];

  List<String> taskList = [
    "Structure page",
    "Color selection",
    "Modify design",
    "Structure page",
    "Color selection",
    "Modify design",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10).copyWith(bottom: 0, top: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              // progress
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LinearProgressIndicator(
                      value: 12/80,
                      backgroundColor: Color(0xFFF0F0F0),
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF7E7E)),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "Task Completed",
                      style: TextStyle(
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xff8d8d8d),
                      ),
                    ),
                  ],
                ),
              ),
              // feature list
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(bottom: 8,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Feature list of PMS",
                      style: TextStyle(
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xff000000),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: (){},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add_circle_outline, size: 12, color: Colors.black87,),
                          SizedBox(width: 5),
                          Text(
                            "Add New",
                            style: TextStyle(fontSize: 10, color: Colors.black87),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featureList.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          width: 140,
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Color(0xFFDEFFDF),
                              borderRadius: BorderRadius.circular(24)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16,),
                              Text(
                                featureList[index],
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xff434343),
                                ),
                              ),
                              SizedBox(height: 8,),
                              Text(
                                "Lalkhan bazar, ctg.",
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xff818181),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image.network('https://raw.githubusercontent.com/afzalali15/Flutter-Rounded-Design/master/assets/xd_logo.png'),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              // task list
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(bottom: 8,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Task list of PMS",
                      style: TextStyle(
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xff000000),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: (){},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add_circle_outline, size: 12, color: Colors.black87,),
                          SizedBox(width: 5),
                          Text(
                            "Add New",
                            style: TextStyle(fontSize: 10, color: Colors.black87),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: taskList.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(
                        taskList[index],
                        style: TextStyle(
                          fontSize: 12
                        ),
                      ),
                      subtitle: Text(
                        "Pending",
                        style: TextStyle(
                          fontSize: 10
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.edit_outlined,
                          size: 14,
                        ),
                      ),

                      leading: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 20.0,
                          width: 20.0,
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: BoxDecoration(
                            color: false ? Colors.white : Color(0xFFDEFFDF),
                            border: Border.all(
                              width: 1.0,
                              color: Colors.black26,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child:  false
                                ? SizedBox.shrink()
                                : Icon(
                              Icons.check,
                              size: 17.0,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFFFF7E7E),
                radius: 24,
                child: IconButton(
                  icon: Image.network("https://raw.githubusercontent.com/afzalali15/Flutter-Rounded-Design/master/assets/home_icon.png"),
                  onPressed: () {},
                ),
              ),
              IconButton(
                icon: Image.network("https://raw.githubusercontent.com/afzalali15/Flutter-Rounded-Design/master/assets/profile_icon.png"),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.network("https://raw.githubusercontent.com/afzalali15/Flutter-Rounded-Design/master/assets/search_icon.png"),
                onPressed: () {},
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
