import 'dart:html';

import 'package:asset_management/locator.dart';
import 'package:asset_management/router.dart';
import 'package:asset_management/services/shared/dialog_service.dart';
import 'package:asset_management/services/shared/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/res/styles.dart';
import 'helper/dialog_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<Null> main() async {

  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();

    runApp(MyApp());

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return ScreenUtilInit(
      designSize: Size(1440, 1024),
      builder:(BuildContext context,_)=> MaterialApp(
        title: "",
        theme: AppStyle.appTheme,
        builder: _setupDialogManager,
        initialRoute:"/",
        debugShowCheckedModeBanner: false,
        navigatorKey: navigationService.navigatorKey,
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
        // navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
      ),
    );
  }

  Widget _setupDialogManager(context, widget) {
    return ResponsiveWrapper.builder(  //responsive_framework Package implements(ResponsiveWrapper.builder)
       Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
          final MediaQueryData data = MediaQuery.of(context);
          return DialogManager(
            child: MediaQuery(
              data: data.copyWith(textScaleFactor: 1.0),
              child: widget,
            ),
          );
        }),
      ),

      //From responsive_framework Package
      defaultScale: true,//from responsive_framework Package
      breakpoints: [
        ResponsiveBreakpoint.resize(480,name: MOBILE),
        ResponsiveBreakpoint(breakpoint: 550,name:"K"),
        ResponsiveBreakpoint(breakpoint: 700,name:"2K"),
        ResponsiveBreakpoint.autoScale(800, name: TABLET),
        ResponsiveBreakpoint.autoScale(1000, name: TABLET),
        ResponsiveBreakpoint.resize(1200,name: DESKTOP),
        ResponsiveBreakpoint.autoScale(2460, name: "4K"),


      ],//From resonsive_framework package
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
