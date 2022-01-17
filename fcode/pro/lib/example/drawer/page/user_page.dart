import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String name;
  final String urlImage;

  const UserPage({
    Key key,
    @required this.name,
    @required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TransformationController controller = TransformationController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(name),
        centerTitle: true,
      ),
      body: InteractiveViewer(
        // scaleEnabled: true,
        // maxScale: 5.0,
        // minScale: 1.0,
        // boundaryMargin: EdgeInsets.all(5.0),
        // transformationController: controller,
        // onInteractionEnd: (ScaleEndDetails endDetails) {
        //   print(endDetails);
        //   print(endDetails.velocity);
        //   controller.value = Matrix4.identity();
        // },
        // clipBehavior: Clip.none,
        child: Image.network(
          urlImage,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}