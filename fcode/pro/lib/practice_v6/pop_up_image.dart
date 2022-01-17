import 'package:flutter/material.dart';

class PopUpImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return ImageDialog();
              }
          );
        },
      ),
      backgroundImage: AssetImage("images/person.png"),
    );
  }
}

class ImageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 300,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                child: Icon(
                    Icons.cancel_outlined
                ),
                onTap: (){
                  Navigator.pop(context, true);
                },
              ),
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/person.png")
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/person.png")
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}