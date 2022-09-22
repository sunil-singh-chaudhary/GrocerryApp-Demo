import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_social_app_for_fun/CartItemWidget.dart';
import 'package:test_project_social_app_for_fun/CheckoutBottomSheet.dart';
import 'package:test_project_social_app_for_fun/grocery_item.dart';
import 'package:test_project_social_app_for_fun/helper/getBlock.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});
  final GetBlockController _controller = Get.put(GetBlockController());
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: demoItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 180,
                    child: CartItemWidget(index),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: const Divider(
                      thickness: 1,
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return CheckoutBottomSheet();
                        });
                  },
                  child: Obx(
                    () => Text(
                        "Total CheckOut- ${widget._controller.TotalCartAmout().toStringAsFixed(2)}  "),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
