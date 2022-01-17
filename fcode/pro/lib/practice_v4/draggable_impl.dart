import 'package:flutter/material.dart';

class DraggableImpl extends StatefulWidget {
  @override
  _DraggableImplState createState() => _DraggableImplState();
}

class _DraggableImplState extends State<DraggableImpl> {
  Color itemColor = Colors.blueAccent;
  Offset position = Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Positioned(
              left: position.dx,
              top: position.dy,
              child: Draggable(
                data: itemColor,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: itemColor,
                  child: Center(
                    child: Text(
                      "Box",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                onDraggableCanceled: (velocity, offset) {
                  setState(() {
                    position = offset;
                    double width = MediaQuery.of(context).size.width;
                    double height = MediaQuery.of(context).size.height;
                    if(position.dx > width-80 || position.dx < 0){
                      position = Offset(0, 0);
                    } else if(position.dy > height-100 || position.dy < 0){
                      position = Offset(0, 0);
                    } else{
                      position = offset;
                    }
                  });
                },
                childWhenDragging: Container(),
                feedback: Container(
                  width: 100.0,
                  height: 100.0,
                  color: itemColor.withOpacity(0.5),
                  child: Center(
                    child: Text(
                      "Box",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}