
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mock_app/providers/router.gr.dart';
import 'package:mock_app/service/network_service.dart';
import 'package:mock_app/utils/network_status.dart';
import 'package:mock_app/views/theme/my_themes.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final _appRouter = AppRouter();
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }


  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }


  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
     return StreamProvider<NetworkStatus>(
       initialData: NetworkStatus.Offline,
       create: (context) => NetworkService().networkStatusController.stream,
       child: CustomThemeProvider(
         child: ThemeConsumer(
           child: Builder(
             builder: (themeContext) => MaterialApp.router(
                 routerDelegate: AutoRouterDelegate(_appRouter),
                 routeInformationParser: _appRouter.defaultRouteParser(),
                 theme: ThemeProvider.themeOf(themeContext).data,
                 debugShowCheckedModeBanner: false,
                 title: 'IjroUz',
                 locale: _locale,
                 localeResolutionCallback: (locale, supportedLocales) {
                   for (var supportedLocale in supportedLocales) {
                     if (supportedLocale.languageCode == locale!.languageCode && supportedLocale.countryCode == locale.countryCode) {
                       return supportedLocale;
                     }
                     print(supportedLocale);
                   }
                   return supportedLocales.first;
                 }),
           ),
         ),
       ),
     );
  }
}

class CustomThemeProvider extends StatelessWidget {
  final Widget? child;

  const CustomThemeProvider({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      defaultThemeId: 'light',
      themes: <AppTheme>[
        AppTheme(id: 'light', data: MyThemes.lightTheme, description: 'light'),
        AppTheme(id: 'dark', data: MyThemes.lightTheme, description: 'dark'),
      ],
      saveThemesOnChange: true,
      loadThemeOnInit: false,
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        String? savedTheme = await previouslySavedThemeFuture;
        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        } else {
          Brightness platformBrightness = SchedulerBinding.instance!.window.platformBrightness;
          if (platformBrightness == Brightness.dark) {
            controller.setTheme('light');
          } else {
            controller.setTheme('light');
          }
          controller.forgetSavedTheme();
        }
      },
      child: child!,
    );
  }
}
