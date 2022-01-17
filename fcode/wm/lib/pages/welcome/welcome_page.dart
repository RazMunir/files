import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/type_controller.dart';
import 'package:flutter_app_wallet_management/pages/welcome/components/text_button_widget.dart';

class WelcomePage extends StatelessWidget {
  final TypeController controller = TypeController();
  @override
  Widget build(BuildContext context) {
    // for adding default type credit & debit
    controller.getAllData();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(
                flex: 2,
              ),
              FlutterLogo(size: 30,),
              Spacer(
                flex: 3,
              ),
              Text(
                "Welcome to our wallet \ntracking app",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1
                ),
              ),
              Spacer(),
              Text(
                "Freedom transaction with your \nmother language.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12
                ),
              ),
              Spacer(),
              TextButtonWidget(controller: controller,)
            ],
          ),
        ),
      ),
    );
  }
}
