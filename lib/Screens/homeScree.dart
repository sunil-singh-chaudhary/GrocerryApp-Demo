import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_project_social_app_for_fun/Screens/GroceryItemCardWidget.dart';
import 'package:test_project_social_app_for_fun/Screens/ProductDetailsScreen.dart';
import 'package:test_project_social_app_for_fun/grocery_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            iconApp(),
            const SizedBox(
              height: 15,
            ),
            LocationwithName(),
            const SizedBox(
              height: 15,
            ),
            SearchIcon(),
            const SizedBox(height: 15),
            AddAppBanner(context),
            subTitle(context, "Exclusive Order"),
            getHorizontalItemSlider(exclusiveOffers),
            subTitle(context, "Best Selling"),
            getHorizontalItemSlider(bestSelling),
            subTitle(context, "Groceries"),
            getHorizontalItemSlider(groceries),
          ],
        ),
      ),
    ));
  }

  // ignore: non_constant_identifier_names
  Widget LocationwithName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/icons/location_icon.svg",
          width: 20,
          height: 20,
        ),
        const SizedBox(
          width: 15,
        ),
        const Text(
          "New Delhi",
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: 'Gilroy-Bold',
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget SearchIcon() {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: Color.fromARGB(59, 202, 198, 198),
          borderRadius: BorderRadius.circular(15)),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: const [
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: 'Search store',
            ),
          )
        ],
      ),
    );
  }

  Widget getHorizontalItemSlider(List<GroceryItem> items) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 250,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onItemClicked(context, items[index]);
            },
            child: GroceryItemCardWidget(
              items: items[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }
}

void onItemClicked(BuildContext context, GroceryItem groceryItem) {
  Get.to(ProductDetailsScreen(groceryItem), transition: Transition.zoom);

  // Navigator.push(
  //   context,
  //   MaterialPageRoute(
  //       builder: (context) => ProductDetailsScreen(
  //             groceryItem,
  //           )),
  // );
}

Widget AddAppBanner(BuildContext context) {
  return Container(
    height: 100,
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: const DecorationImage(
        image: AssetImage("assets/images/banner_background.png"),
        fit: BoxFit.fill,
      ),
    ),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 40),
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/banner_image.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Expanded(child: Text("")),
        Container(
          margin: const EdgeInsets.only(right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Fresh Vegetable",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Get Upto 40% Off",
                style: TextStyle(
                    color: Color.fromARGB(255, 89, 219, 156),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget iconApp() {
  var iconPath = "assets/icons/app_icon.svg";
  return Container(
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: SvgPicture.asset(
        color: Colors.green,
        iconPath,
        width: 35,
        height: 36,
        fit: BoxFit.scaleDown),
  );
}

Widget subTitle(BuildContext context, String text) {
  return Container(
    margin: const EdgeInsets.all(15),
    child: Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Text(
          "See All",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 93, 216, 97)),
        ),
      ],
    ),
  );
}
//  child: Image(image: AssetImage("assets/images/banner_background.png")),
