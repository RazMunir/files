import 'package:flutter/material.dart';

class DraggableTestV3 extends StatelessWidget {
  Color caughtColor = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          DragBox(Offset(0.0, 0.0), 'Box One', Colors.blueAccent),
          DragBox(Offset(150.0, 0.0), 'Box Two', Colors.orange),
          DragBox(Offset(300.0, 0.0), 'Box Three', Colors.lightGreen),
          Positioned(
            left: 125.0,
            bottom: 0.0,
            child: DragTarget(
              onAccept: (Color color) {
                caughtColor = color;
              },
              builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                  ) {
                return Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: accepted.isEmpty ? caughtColor : Colors.deepPurple.shade200,
                  ),
                  child: Center(
                    child: Text("Drag Here!", style: TextStyle(color: Colors.white)),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;

  DragBox(this.initPos, this.label, this.itemColor);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          data: widget.itemColor,
          child: Container(
            width: 100.0,
            height: 100.0,
            color: widget.itemColor,
            child: Center(
              child: Text(
                widget.label,
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
              // if(position.dx > width-50 || position.dx < 0){
              //   position = Offset(width-50, offset.dy-50);
              // } else if(position.dy > height-50 || position.dy < 0){
              //   position = Offset(width-50, offset.dy-100);
              // } else{
              //   position = offset;
              // }
              print("Position changed: $position, w: $width h: $height");
            });
          },
          feedback: Container(
            width: 120.0,
            height: 120.0,
            color: widget.itemColor.withOpacity(0.5),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ));
  }
}