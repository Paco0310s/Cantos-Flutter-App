import 'package:flutter/material.dart';

class NavigationViewsModel {
  final AppBar appBar;
  final Widget? floatingActionButton;
  final Icon icon;
  final Widget? view;

  NavigationViewsModel({
    required this.appBar,
    required this.icon,
    this.view,
    this.floatingActionButton,
  });
}
