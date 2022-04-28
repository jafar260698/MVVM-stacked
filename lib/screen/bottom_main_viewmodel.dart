
import 'package:flutter/material.dart';
import 'package:mock_app/model/condition_model.dart';
import 'package:mock_app/model/document_model.dart';
import 'package:mock_app/model/main_dashboard_model.dart';
import 'package:mock_app/views/theme/app_color.dart';
import 'package:stacked/stacked.dart';

class BottomMainViewModel extends BaseViewModel {

  TabController? _controller;

  TabController? get controller => _controller;

  List<String?> tabBar = ["Барчаси", "Чиқувчи" , "Топшириқлар"];

  var listOfCondition = <ConditionModel>[
    ConditionModel(title: 'Янги', color: const Color.fromRGBO(246, 176, 92, 1), iconName: "assets/icons/condition/sun.svg"),
    ConditionModel(title: 'Имзоланган', color: const Color.fromRGBO(53, 201, 165, 1) , iconName: "assets/icons/condition/check.svg"),
    ConditionModel(title: 'Имзоланмаган', color: const Color.fromRGBO(242, 25, 64, 1), iconName: "assets/icons/condition/close.svg"),
    ConditionModel(title: 'Рад этилган', color: const Color.fromRGBO(100, 90, 255, 1), iconName: "assets/icons/condition/info.svg"),
    ConditionModel(title: 'Қидирувни тозалаш', color: const Color.fromRGBO(242, 25, 64, 1), iconName: "assets/icons/condition/trash.svg")
  ];

  var listOfDocument = <DocumentModel>[
    DocumentModel(title: 'Кирувчи ҳужжатлар', color: AppColor.primaryColor, number: "35"),
    DocumentModel(title: 'Чиқувчи ҳужжатлар', color: AppColor.primaryColor, number: "9"),
    DocumentModel(title: 'Топшириқлар', color: AppColor.primaryColor, number: "12"),
  ];


  var mainDashboardList = <MainDashboardModel>[
    MainDashboardModel(mainText: 'Зокиров Шухрат Касым...',subTitle: "Изоҳ қолдирилмаган....",date: "3 мар 2022", iconTitle: "Топшириқ", iconText: "assets/icons/vector.svg", color: AppColor.greenColor),
    MainDashboardModel(mainText: 'Зокиров Шухрат Касым...',subTitle: "Шов-шувли баёнотлари ва UzAuto Motors'га нархни пасайтириш ...",date: "3 мар 2022", iconTitle: "Топшириқ", iconText: "assets/icons/vector.svg", color: AppColor.greyColor),
    MainDashboardModel(mainText: 'Зокиров Шухрат Касым...',subTitle: "Изоҳ қолдирилмаган....",date: "3 мар 2022", iconTitle: "Чиқувчи хат", iconText: "assets/icons/vector.svg", color: AppColor.greyColor),
    MainDashboardModel(mainText: 'Зокиров Шухрат Касым...',subTitle: "Шов-шувли баёнотлари ва UzAuto Motors'га нархни пасайтириш ...",date: "3 мар 2022", iconTitle: "Топшириқ", iconText: "assets/icons/vector.svg", color: AppColor.greyColor),
    MainDashboardModel(mainText: 'Зокиров Шухрат Касым...',subTitle: "Шов-шувли баёнотлари ва UzAuto Motors'га нархни пасайтириш ...",date: "3 мар 2022", iconTitle: "Чиқувчи хат", iconText: "assets/icons/condition/close.svg", color: AppColor.redColor),
  ];


  final String? _selectedItemTitle = "Ҳолати";
  String? get selectedItemTitle => _selectedItemTitle;

}