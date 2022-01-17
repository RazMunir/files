import 'package:flutter/material.dart';

class MListViewGrid extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MListViewGrid();
  }
}

class _MListViewGrid extends State<MListViewGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(), //important. to not scroll in grid
      shrinkWrap: true, //important. to scroll all items with page
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      children: List.generate(50, (index) {
        return Container(
          child: Card(
            color: Colors.amber,
            child: Center(child: Text("$index")),
          ),
        );
      }),
    );
    // return Container(
    //     height: 200,
    //     child: GridView.count(
    //     scrollDirection: Axis.vertical,
    //     crossAxisCount: 2 ,
    //     children: List.generate(50,(index){
    //   return Container(
    //     child: Card(
    //       color: Colors.amber,
    //     ),
    //   );
    //
    // }),
    // ));
  }
}
