import 'package:flutter/material.dart';

class DraggableTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Drag app"),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double width = 100.0, height = 100.0;
  Offset position ;

  @override
  void initState() {
    super.initState();
    position = Offset(0.0, height - 20);
    // position = Offset(0.0, 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: position.dx,

          // bottom: position.dy,
          // right: position.dx,
          // top: position.dy,
          top: position.dy - height + 20,
          child: Draggable(
            child: Container(
              width: width,
              height: height,
              color: Colors.blue,
              child: Center(child: Text("Drag", style: Theme.of(context).textTheme.headline,),),
            ),
            feedback: Container(
              child: Center(
                child: Text("Drag", style: Theme.of(context).textTheme.headline,),),
              color: Colors.red[800],
              width: width,
              height: height,
            ),
            onDraggableCanceled: (Velocity velocity, Offset offset){
              setState(() => position = offset);
            },
          ),
        ),
      ],
    );
  }
}