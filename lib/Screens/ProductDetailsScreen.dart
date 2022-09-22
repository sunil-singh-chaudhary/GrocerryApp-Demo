import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_social_app_for_fun/favouriteIconActivity.dart';
import 'package:test_project_social_app_for_fun/grocery_item.dart';
import 'package:test_project_social_app_for_fun/helper/getBlock.dart';

class ProductDetailsScreen extends StatefulWidget {
  final GroceryItem? groceryItem;
  ProductDetailsScreen(this.groceryItem);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final GetBlockController _controller = Get.put(GetBlockController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                gradient: LinearGradient(
                    colors: [
                      const Color(0xFF3366FF).withOpacity(0.1),
                      const Color(0xFF3366FF).withOpacity(0.09),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                    stops: const [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: Image(
                image: AssetImage(widget.groceryItem!.imagePath!),
                fit: BoxFit.contain,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.groceryItem!.name!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(widget.groceryItem!.description!),
                    ],
                  ),
                ),
                const Spacer(),
                favouriteIconActivity(),
              ],
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                minusContainer(_controller),
                dynamicCount(_controller),
                plusContainer(_controller),
                totalAmountpage(_controller, widget.groceryItem!.price!),
              ],
            ),
            Spacer(),
            Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: const Divider(
                  thickness: 1,
                )),
            RowData("Product Details", false),
            Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: const Divider(
                  thickness: 1,
                )),
            RowData("Nutrition", true),
            Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: const Divider(
                  thickness: 1,
                )),
            reviewRow(),
            Spacer(),
            AddToBasketButton(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget AddToBasketButton() {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: ElevatedButton(
          onPressed: () {},
          child: const Center(
              child: Text(
            "Add To basket",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ))),
    );
  }
}

Widget totalAmountpage(GetBlockController _controller, double price) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.only(right: 25),
      alignment: Alignment.centerRight,
      width: 40,
      height: 40,
      child: Obx(
        () => Text(
          "${_controller.GetTotalAmount(price).toString()} \$",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

Widget plusContainer(GetBlockController _controller) {
  return GestureDetector(
    onTap: () {
      _controller.plusMethod();
    },
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          alignment: Alignment.center,
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black, width: 0.5)),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          width: 40,
          height: 40,
          alignment: Alignment.center,
          child: const Icon(Icons.add),
        )
      ],
    ),
  );
}

Widget dynamicCount(GetBlockController _controller) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.only(left: 10),
    width: 35,
    child: Obx(
      () {
        return Text(
          _controller.Myvalue.toString(),
          style: const TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
        );
      },
    ),
  );
}

Widget minusContainer(GetBlockController _controller) {
  return GestureDetector(
    onTap: () {
      _controller.Minus();
    },
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.center,
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black, width: 0.5)),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          width: 40,
          alignment: Alignment.center,
          child: const Icon(Icons.minimize),
        )
      ],
    ),
  );
}

Widget RowData(String data, bool textvisibility) {
  return InkWell(
    hoverColor: Colors.green,
    focusColor: Colors.amber,
    onTap: () {
      print(data);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          height: 50,
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            data,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Row(children: [
          Visibility(
            visible: textvisibility,
            child: const Text(
              "100gm",
              style: TextStyle(fontSize: 12),
            ),
          ),
          Container(
              height: 50,
              margin: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 24,
              )),
        ]),
      ],
    ),
  );
}

Widget reviewRow() {
  return InkWell(
    hoverColor: Colors.green,
    focusColor: Colors.amber,
    onTap: () {
      print("Rewv");
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          height: 50,
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: const Text(
            "Review ",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Row(children: [
          ratingWidget(),
          Container(
              height: 50,
              margin: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 24,
              )),
        ]),
      ],
    ),
  );
}

Widget ratingWidget() {
  Widget starIcon() {
    return Icon(
      Icons.star,
      color: Color(0xffF3603F),
      size: 20,
    );
  }

  return Row(
    children: [
      starIcon(),
      starIcon(),
      starIcon(),
      starIcon(),
      starIcon(),
    ],
  );
}
