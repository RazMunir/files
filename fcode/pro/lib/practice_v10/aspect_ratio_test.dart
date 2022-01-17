import 'package:flutter/material.dart';
import 'package:flutter_profile_app/practice_v10/drawer_test.dart';
import 'package:intl/intl.dart';

class AspectRationTest extends StatefulWidget {
  static const String routeName = 'aspect_radio_test';

  final String email;

  const AspectRationTest({Key key, this.email = 'default@gmail.com'}) : super(key: key);

  @override
  _AspectRationTestState createState() => _AspectRationTestState();
}

class _AspectRationTestState extends State<AspectRationTest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    final myList = List.generate(7, (index) {
      final dateFormatted =DateTime.now().subtract(Duration(days:index));
      return {
        'day': DateFormat.E().format(dateFormatted),
        'date':dateFormatted,
      };
    });
    print(myList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.email),
      ),
      drawer: DrawerTest(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.red,
              child: Image.asset(
                "images/flutter_bird.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 4 / 1,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 4 / 1,
              child: Container(
                color: Colors.red,
                child: Image.asset(
                  "images/flutter_bird.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
