import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/device_size_config.dart';

Widget getWidgetLogo = Padding(
    padding: const EdgeInsets.all(20),
    child: SvgPicture.asset('assets/svg/logo.svg',width: SizeConfig.screenWidth!*0.6));