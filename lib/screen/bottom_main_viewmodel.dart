
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BottomMainViewModel extends BaseViewModel {

  TabController? _controller;

  TabController? get controller => _controller;

  List<String?> year = ["Барчаси", "Чиқувчи" , "Топшириқлар"];

}