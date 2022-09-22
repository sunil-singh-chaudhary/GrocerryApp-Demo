import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project_social_app_for_fun/helper/MenuItems.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewAppPage(),
    );
  }
}

class NewAppPage extends StatefulWidget {
  NewAppPage({super.key});

  @override
  State<NewAppPage> createState() => _NewAppPageState();
}

class _NewAppPageState extends State<NewAppPage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: listScreen,
        ),
        //menu_items_list[currentIndex].screen,
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 6,
                offset: Offset(0, -12),
              )
            ],
          ),
          child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  currentIndex: currentIndex,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Theme.of(context).primaryColor,
                  selectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.w600),
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.w600),
                  unselectedItemColor: Colors.black,
                  items: menu_items_list.map((e) {
                    return getNav(
                        label: e.label, index: e.index, iconPath: e.iconPath);
                  }).toList())),
        ));
  }

  BottomNavigationBarItem getNav(
      {String? label, String? iconPath, int? index}) {
    Color iconColor = index == currentIndex ? Colors.blueAccent : Colors.black;
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(iconPath!), label: label);
  }
}
