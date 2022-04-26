import 'package:auto_route/auto_route.dart';
import 'package:mock_app/screen/home/home_page.dart';

import '../screen/splash/splash_page.dart';


@MaterialAutoRouter(
  routes: <AutoRoute>[
    CupertinoRoute(page: SplashScreen, initial: true),
    CupertinoRoute(page: HomePage),
  ],
)
class $AppRouter {}
