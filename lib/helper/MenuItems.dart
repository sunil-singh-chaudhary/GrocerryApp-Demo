import 'package:flutter/material.dart';
import 'package:test_project_social_app_for_fun/Screens/SettingScreen.dart';
import 'package:test_project_social_app_for_fun/Screens/cartScreen.dart';
import 'package:test_project_social_app_for_fun/Screens/homeScree.dart';

class MenuItems {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  MenuItems(this.label, this.iconPath, this.index, this.screen);
}

var listScreen = [HomeScreen(), CartScreen(), SettingScreen()];

List<MenuItems> menu_items_list = [
  MenuItems("Shop", "assets/icons/shop_icon.svg", 0, HomeScreen()),
  MenuItems("Explore", "assets/icons/explore_icon.svg", 1, CartScreen()),
  MenuItems("Cart", "assets/icons/cart_icon.svg", 2, SettingScreen()),
];
