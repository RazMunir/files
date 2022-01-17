import 'package:flutter/material.dart';

class BMImagePageView extends StatefulWidget {
  final int currentImageIndex;

  const BMImagePageView({Key key, this.currentImageIndex}) : super(key: key);

  @override
  _BMImagePageViewState createState() => _BMImagePageViewState();
}

class _BMImagePageViewState extends State<BMImagePageView> {
  List<String> images = [
    "images/person.png",
    "images/person_2.jpg",
    "images/person.png",
    "images/person_2.jpg"
  ];
  List<Widget> tabPages2;

  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currentPage = widget.currentImageIndex;

    tabPages2 = images
      .map((data) => Container(
            child: InteractiveViewer(
                child: Image.asset(
              data,
              fit: BoxFit.cover,
            )),
          ))
      .toList();

    _pageController = PageController(initialPage: widget.currentImageIndex, keepPage: true, viewportFraction: 1);
    _pageController.addListener(() {
      // print("Current Page is: ${_pageController.page.toInt()}");
      currentPage = _pageController.page.toInt();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
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
                      child: Image.asset(images[index], height: 30, width: 50,fit: BoxFit.cover,),
                      onTap: (){
                        _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.decelerate);
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
