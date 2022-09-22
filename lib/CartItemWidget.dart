import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_social_app_for_fun/grocery_item.dart';
import 'package:test_project_social_app_for_fun/helper/getBlock.dart';

class CartItemWidget extends StatefulWidget {
  int index;
  CartItemWidget(this.index, {super.key});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  final GetBlockController _new_controller = Get.put(GetBlockController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(demoItems[widget.index].imagePath!),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              height: 20,
              alignment: Alignment.center,
              child: Text(
                demoItems[widget.index].name!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              height: 20,
              child: Text(demoItems[widget.index].description!,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal)),
            ),
            Row(
              children: [
                minusContainer_item(_new_controller, widget.index),
                dynamicCount_item(_new_controller, widget.index),
                plusContainer_item(_new_controller, widget.index),
              ],
            ),
          ],
        ),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 20,
              alignment: Alignment.topRight,
              child: const Icon(Icons.close),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Obx(
                () => Text(
                  _new_controller.priceList[widget.index].toStringAsFixed(2),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

Widget minusContainer_item(GetBlockController _new_controller, int index) {
  return GestureDetector(
    onTap: () {
      _new_controller.removeFromList(index, '1');
      _new_controller.priceFromListItems(index);
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

Widget plusContainer_item(GetBlockController _new_controller, int index) {
  return GestureDetector(
    onTap: () {
      _new_controller.AddToList(index, '1');
      _new_controller.priceFromListItems(index);
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

Widget dynamicCount_item(GetBlockController _new_controller, int index) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.only(left: 10),
    width: 35,
    child: Obx(
      () => Text(
        _new_controller.ListAmount(index).toString(),
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
