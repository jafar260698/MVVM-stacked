
import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_app/views/components/document_ui.dart';
import 'package:mock_app/views/components/main_dashboard.dart';
import 'package:mock_app/views/theme/app_color.dart';
import 'package:mock_app/views/theme/font_style.dart';
import 'package:mock_app/views/widgets/card_shadow.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stacked/stacked.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:theme_provider/theme_provider.dart';
import '../utils/device_size_config.dart';
import '../utils/strings.dart';
import '../views/components/container_ui.dart';
import '../views/components/select_ui.dart';
import '../views/widgets/custom_appbar.dart';
import 'bottom_main_viewmodel.dart';

class BottomMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeData = ThemeProvider.controllerOf(context).theme.data;
    return ViewModelBuilder<BottomMainViewModel>.reactive(
      builder: (context, model, child) =>  DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: appBarPage(
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60.0),
                child: Align(
                  alignment: Alignment.center,
                  child: TabBar(
                    controller: model.controller,
                    tabs: List<Widget>.generate(model.tabBar.length,
                            (int index) {
                          var item = model.tabBar[index];
                          return Tab(text: item);
                        }),
                    isScrollable: true,
                    labelPadding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5, bottom: 5),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: themeData.primaryColor,
                    unselectedLabelColor: themeData.accentIconTheme.color!.withOpacity(0.3),
                    labelStyle: TextStyle(
                        fontSize: SizeConfig.calculateTextSize(16),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat'),
                    indicator: MaterialIndicator(
                        height: 3,
                        topLeftRadius: 4,
                        topRightRadius: 4,
                        bottomLeftRadius: 0,
                        bottomRightRadius: 0,
                        tabPosition: TabPosition.bottom,
                        color: themeData.primaryColor),
                  ),
                ),
              ),
            ),
            body: getBodyUI(context, model),
            drawer: Theme(
              data: Theme.of(context).copyWith(
                canvasColor:themeData.cardColor
              ),
              child: Drawer(
                backgroundColor: AppColor.splashBackground,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: ListView(
                    children: <Widget>[
                      const SizedBox(height: 40),
                      Container(
                        color: AppColor.drawerBackground,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  [
                            const SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Ички ҳужжатлар",
                                overflow: TextOverflow.fade,
                                style: FontStyle.appBarStyleWhite,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showBottomModalSheet(context, model);
              },
              child: SvgPicture.asset(
                'assets/icons/edit.svg',
                color: Colors.white,
                width: 32,
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              child: BottomAppBar(
                clipBehavior: Clip.hardEdge,
                shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                color: themeData.cardColor,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 60,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          showBottomModalSheet(context, model);
                        },
                        minWidth: MediaQuery.of(context).size.width * 0.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: SvgPicture.asset(
                                "assets/icons/home.svg",
                                color: Colors.black,
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          showBottomModalSheet(context, model);
                        },
                        minWidth: MediaQuery.of(context).size.width * 0.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: SvgPicture.asset(
                                "assets/icons/services.svg",
                                color: Colors.black,
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
      ),
      viewModelBuilder: () => BottomMainViewModel(),
    );
  }

  Widget getBodyUI(BuildContext context, BottomMainViewModel model) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.calculateBlockHorizontal(16)),
            child: SelectUI(
              labelText: model.selectedItemTitle,
              text: '',
              child: conditionModal(context, model),
            ),
          ),
          SizedBox(height: SizeConfig.calculateBlockVertical(30)),
          getMyDashboard(context, model),
        ],
      ),
    );
  }

  Widget getMyDashboard(BuildContext context, BottomMainViewModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.calculateBlockHorizontal(16)),
          child: Text(
            Words.today,
            style: FontStyle.listStyle,
          ),
        ),
        SizedBox(height: SizeConfig.calculateBlockHorizontal(6)),
        CardShadow(
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 8, bottom: 20),
              shrinkWrap: true,
              itemCount: model.mainDashboardList.length,
              separatorBuilder: (context, int) {
                return const Divider(height: 0.8);
              },
              itemBuilder: (context, index) {
                return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: MainDashboardUI(
                        mainText: model.mainDashboardList[index].mainText,
                        subTitle: model.mainDashboardList[index].subTitle,
                        date: model.mainDashboardList[index].date,
                        iconText: model.mainDashboardList[index].iconTitle,
                        color: model.mainDashboardList[index].color,
                        icon: model.mainDashboardList[index].iconText,
                      ),
                    ),
                    onTap: () {
                      conditionModal(context, model);
                    });
              }),
        ),
        SizedBox(height: SizeConfig.calculateBlockHorizontal(30)),
      ],
    );
  }

  Widget conditionModal(BuildContext context,BottomMainViewModel model) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: SizeConfig.calculateBlockHorizontal(10)),
        Text(
          Words.condition,
          style: FontStyle.appBarStyle20,
        ),
        SizedBox(height: SizeConfig.calculateBlockHorizontal(20)),
        ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 8, bottom: 20),
            shrinkWrap: true,
            itemCount: model.listOfCondition.length,
            itemBuilder: (context, index) {
              return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: ContainerUI(
                      labelText: model.listOfCondition[index].title,
                      color: model.listOfCondition[index].color,
                      icon: SvgPicture.asset(
                        model.listOfCondition[index].iconName ?? "",
                        width: 26,
                        height: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  });
            }),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.4),
              radius: 36,
              child: const CircleAvatar(
                  foregroundColor: Colors.grey,
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close, size: 30, color: Colors.black87)
              ),
            ),
          ),
        )
      ],
    );
  }

  void showBottomModalSheet(BuildContext context, BottomMainViewModel model) {
    showModal(context, Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        Text(
          Words.document,
          style: FontStyle.appBarStyle20,
        ),
        const SizedBox(height: 25),
        ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 8, bottom: 20),
            shrinkWrap: true,
            itemCount: model.listOfDocument.length,
            separatorBuilder: (context, int) {
              return const Divider(height: 0.8);
            },
            itemBuilder: (context, index) {
              return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DocumentUI(
                      labelText: model.listOfDocument[index].title,
                      numberText: model.listOfDocument[index].number,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  });
            }),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.4),
              radius: 36,
              child: const CircleAvatar(
                  foregroundColor: Colors.grey,
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close, size: 30, color: Colors.black87)
              ),
            ),
          ),
        )
      ],
    ));
  }

  void showModal(context, Widget? child) {
    FocusScope.of(context).requestFocus(FocusNode());
    showMaterialModalBottomSheet(
      expand: false,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      builder: (context) {
        return  child!;
      },
    );
  }

}
