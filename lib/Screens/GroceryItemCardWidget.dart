import 'package:flutter/material.dart';
import 'package:test_project_social_app_for_fun/grocery_item.dart';

class GroceryItemCardWidget extends StatelessWidget {
  GroceryItemCardWidget({Key? key, this.items}) : super(key: key);
  final GroceryItem? items;
  final double? width = 174;
  final double? height = 250;
  final Color borderColor = Color(0xffE2E2E2);
  final double borderRadius = 18;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey, width: 0.3),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(items!.imagePath!),
            fit: BoxFit.contain,
            height: 120,
            width: 120,
          ),
          Text(
            items!.name!,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            items!.description!,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "\$${items!.price!}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // SizedBox(
              //   height: 50,
              //   width: 50,
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     child: Center(child: Icon(Icons.add)),
              //     style: ButtonStyle(
              //       shape: MaterialStateProperty.all(
              //         RoundedRectangleBorder(
              //           // Change your radius here
              //           borderRadius: BorderRadius.circular(20),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Spacer(),
              addWidget(),
            ],
          )
        ],
      ),
    );
  }
}

Widget addWidget() {
  return InkWell(
    child: Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17), color: Colors.greenAccent),
      child: const Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
      ),
    ),
    onTap: () {
      print('Added to Basket');
    },
  );
}
