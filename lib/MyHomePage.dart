import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_project_social_app_for_fun/MainPage.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var imagepath = 'assets/images/welcome_image.png';
    var iconPath = "assets/icons/app_icon.svg";
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(imagepath),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  SetIcon(context, iconPath),
                  welcomeContainer(context),
                  TosetContainer(context),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              getGroceriesContaner(context),
              const SizedBox(
                height: 20,
              ),
              getButton(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getButton(BuildContext context) {
  return Container(
      height: 40,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 50),
      child: ElevatedButton(
          onPressed: () {
            print('Click');
            Get.to(const MainPage());
          },
          child: const Text(
            "Get Started",
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Gilroy-Regular'),
          )));
}

Widget SetIcon(BuildContext context, String iconPath) {
  return SvgPicture.asset(
    iconPath,
    width: 48,
    height: 56,
  );
}

Widget welcomeContainer(BuildContext context) {
  return Container(
    height: 43,
    alignment: Alignment.center,
    width: double.infinity,
    child: const Text("Welcome ",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w300, fontSize: 43)),
  );
}

Widget TosetContainer(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: const Text("To our Place ",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 43)),
  );
}

Widget getGroceriesContaner(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: const Text("Get your grecories as fast as in hour",
        style: TextStyle(
            color: Colors.white, fontFamily: 'Gilroy-Regular', fontSize: 16)),
  );
}
