import 'package:flutter/material.dart';

class favouriteIconActivity extends StatefulWidget {
  favouriteIconActivity({super.key});

  @override
  State<favouriteIconActivity> createState() => _favouriteIconActivityState();
}

class _favouriteIconActivityState extends State<favouriteIconActivity> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
      child: InkWell(
        onTap: () {
          setState(() {
            isFavourite = !isFavourite;
          });
        },
        child: Icon(
          isFavourite ? Icons.favorite : Icons.favorite_border,
          color: isFavourite ? Colors.red : Colors.grey,
          size: 25,
        ),
      ),
    );
  }
}
