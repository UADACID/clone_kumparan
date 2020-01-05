import 'package:clone_kumparan/screens/search.dart';
import 'package:clone_kumparan/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sailor/sailor.dart';

import 'screens/dashboard.dart';

void main()async  {
  Routes.createRoutes();
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Routes.sailor.navigatorKey,  // important
      onGenerateRoute: Routes.sailor.generator(), 
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.notoSansTextTheme(),
          appBarTheme: AppBarTheme(
              brightness: Brightness.light,
              iconTheme: IconThemeData(
                color: Colors.black
              ),
              color: Colors.white,
              textTheme: TextTheme(title: TextStyle(color: Colors.black)))),
      home: Dashboard(),
    );
  }
}

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes([
      SailorRoute(
          builder:
              (BuildContext context, BaseArguments args, ParamMap paramMap) {
            return Splash();
          },
          name: 'splash'),
      SailorRoute(
          builder:
              (BuildContext context, BaseArguments args, ParamMap paramMap) {
            return Dashboard();
          },
          name: 'dashboard'),
      SailorRoute(
          builder:
              (BuildContext context, BaseArguments args, ParamMap paramMap) {
            return Search();
          },
          name: 'search',
          defaultTransitionDuration: Duration(milliseconds: 250),
          defaultTransitions: [
            SailorTransition.fade_in
          ]),
    ]);
  }
}
