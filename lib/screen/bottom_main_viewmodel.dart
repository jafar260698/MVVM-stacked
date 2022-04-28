
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BottomMainViewModel extends BaseViewModel {

  TabController? _controller;

  TabController? get controller => _controller;

  List<String?> tabBar = ["Барчаси", "Чиқувчи" , "Топшириқлар"];

  var listOfCondition = <String>["Янги", "Имзоланган", "Имзоланмаган", "Рад этилган", "Қидирувни тозалаш"];

  final String? _selectedItemTitle = "Ҳолати";
  String? get selectedItemTitle => _selectedItemTitle;

}