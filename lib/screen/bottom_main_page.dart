
import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_app/views/theme/font_style.dart';
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
    var themeId = ThemeProvider.controllerOf(context).theme.id;
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
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        color: themeData.cardColor,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(width: 5),
                                const Text(
                                  "name",
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(width: 5),
                                SvgPicture.asset(
                                  'assets/icons/verified.svg',
                                  width: 14,
                                  height: 14,
                                )
                              ],
                            ),
                            SizedBox(height: SizeConfig.calculateBlockVertical(4)),
                            SizedBox(height: 24),
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

                        },
                        minWidth: MediaQuery.of(context).size.width * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: SvgPicture.asset(
                                "assets/icons/home.svg",
                                color:themeId == "dark"
                                    ? Colors.white
                                    : Colors.black,
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {

                        },
                        minWidth: MediaQuery.of(context).size.width * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: SvgPicture.asset(
                                "assets/icons/services.svg",
                                color:themeId == "dark"
                                    ? Colors.white
                                    : Colors.black,
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.calculateBlockHorizontal(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectUI(
            labelText: model.selectedItemTitle,
            text: '',
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 10),
                Text(
                  Words.condition,
                  style: FontStyle.appBarStyle20,
                ),
                const SizedBox(height: 10),
                ListView.builder(
                    padding: const EdgeInsets.only(top: 8, bottom: 20),
                    shrinkWrap: true,
                    itemCount: model.listOfCondition.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: ContainerUI(
                              labelText: model.listOfCondition[index],
                              color: Colors.green,
                              icon: null,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          });
                    }),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(
                      foregroundColor: Colors.grey,
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.close, size: 30, color: Colors.black87)
                  ),
                )
              ],
            ),
          ),
          getMyCards(context, model),
          SizedBox(height: SizeConfig.calculateBlockVertical(42))
        ],
      ),
    );
  }


  Widget getMyCash(BuildContext context, BottomMainViewModel model) {
    var themeData = ThemeProvider.controllerOf(context).theme.data;
    double _tabletSumPadding = 30.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: themeData.cardColor,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.calculateBlockHorizontal(10)),
                SizedBox(height: SizeConfig.calculateBlockHorizontal(5)),
              ],
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.calculateBlockHorizontal(4),
        ),
        Flexible(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: themeData.cardColor,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.calculateBlockHorizontal(10)),
                SizedBox(height: SizeConfig.calculateBlockHorizontal(5)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getMyCards(BuildContext context, BottomMainViewModel model) {
      return SizedBox(
        height: 100,
      );
  }

}
