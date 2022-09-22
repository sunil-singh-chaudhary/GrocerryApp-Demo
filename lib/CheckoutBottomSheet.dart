import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test_project_social_app_for_fun/OrderFailedDialogue.dart';
import 'package:test_project_social_app_for_fun/helper/getBlock.dart';

class CheckoutBottomSheet extends StatefulWidget {
  CheckoutBottomSheet({super.key});
  final GetBlockController _new_controller = Get.put(GetBlockController());
  @override
  State<CheckoutBottomSheet> createState() => _CheckoutBottomSheetState();
}

class _CheckoutBottomSheetState extends State<CheckoutBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 50,
                  child: const Text(
                    "CheckOut",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
              Icon(Icons.cancel),
            ],
          ),
          getDivider(),
          checkoutRow("Delivery", trailingText: "Select Method"),
          getDivider(),
          checkoutRow("Payment", traillingwidget: const Icon(Icons.payment)),
          getDivider(),
          checkoutRow("Promo Code", trailingText: "Pick Discount"),
          getDivider(),
          Obx(() => checkoutRow("Total Cost",
              trailingText:
                  widget._new_controller.TotalCartAmout().toStringAsFixed(2))),
          termsAndConditions(context),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 50),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  onPlaceOrderClicked(context);
                },
                child: Text("Place Order")),
          )
        ],
      ),
    );
  }

  Widget checkoutRow(String s,
      {String? trailingText, Widget? traillingwidget}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              s,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          trailingText == null
              ? traillingwidget!
              : Text(
                  trailingText,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
          const SizedBox(
            width: 15,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ],
      ),
    );
  }
}

Widget termsAndConditions(BuildContext context) {
  return RichText(
    text: TextSpan(
        text: 'By placing an order you agree to our',
        style: TextStyle(
          color: Color(0xFF7C7C7C),
          fontSize: 14,
          fontFamily: Theme.of(context).textTheme.bodyText1?.fontFamily,
          fontWeight: FontWeight.w600,
        ),
        children: const [
          TextSpan(
              text: " Terms",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          TextSpan(text: " And"),
          TextSpan(
              text: " Conditions",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ]),
  );
}

Widget getDivider() {
  return const Divider(
    thickness: 1,
    color: Color(0xFFE2E2E2),
  );
}

void onPlaceOrderClicked(BuildContext context) {
  Navigator.pop(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return OrderFailedDialogue();
      });
}
