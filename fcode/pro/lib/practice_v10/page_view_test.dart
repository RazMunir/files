import 'package:flutter/material.dart';

class PageViewTest extends StatefulWidget {
  @override
  _PageViewTestState createState() => _PageViewTestState();
}

class _PageViewTestState extends State<PageViewTest> {
  List<Widget> tabPages = [
    Container(
      color: Colors.pink,
      child: Center(child: Text("Page 1")),
    ),
    Container(
      color: Colors.redAccent,
      child: Center(child: Text("Page 2")),
    ),
    Container(
      color: Colors.cyanAccent,
      child: Center(child: Text("Page 3")),
    ),
    Container(
      color: Colors.purpleAccent,
      child: Center(child: Text("Page 4")),
    ),
  ];

  List<String> images = [
    "images/person.png",
    "images/person_2.jpg",
    "images/person.png",
    "images/person_2.jpg"
  ];

  List<Widget> tabPages2;

  // Image.asset(
  // "images/loading.gif",
  // height: 125.0,
  // // width: 125.0,
  // )

  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabPages2 = images
        .map((data) => Container(
              child: InteractiveViewer(
                  child: Image.asset(
                data,
                fit: BoxFit.cover,
              )),
            ))
        .toList();

    _pageController = PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
    _pageController.addListener(() {
      print("Current Page is: ${_pageController.page.toInt()}");
      setState(() {
        currentPage = _pageController.page.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            children: tabPages2,
            controller: _pageController,
          ),
        ),
        Container(
          height: 50,
          padding: EdgeInsets.all(5),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: images.length,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: (currentPage == index) ? Colors.redAccent : Colors.black87
                  )
                ),
                child: GestureDetector(
                  child: Image.asset(images[index], height: 30, width: 50, fit: BoxFit.cover,),
                  onTap: (){
                    // _pageController.jumpToPage(0);
                    _pageController.animateToPage(index, curve: Curves.decelerate, duration: Duration(milliseconds: 300));
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
