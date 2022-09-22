import 'package:flutter/material.dart';
import 'package:test_project_social_app_for_fun/OrderAcceptedScreen.dart';

class OrderFailedDialogue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        height: 600.0,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 45,
              ),
              child: Image(
                  image: AssetImage("assets/images/order_failed_image.png")),
            ),
            const Spacer(
              flex: 5,
            ),
            const Text(
              "Oops! Order Failed",
            ),
            const Spacer(
              flex: 2,
            ),
            const Text("Something went temply wrong"),
            const Spacer(
              flex: 8,
            ),
            ElevatedButton(
              child: const Text("Try Again"),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return OrderAcceptedScreen();
                  },
                ));
              },
            ),
            const Spacer(
              flex: 4,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Back To Home",
              ),
            ),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
