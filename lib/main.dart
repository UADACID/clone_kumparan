import 'package:clone_kumparan/screens/menu.dart';
import 'package:clone_kumparan/screens/news_detail.dart';
import 'package:clone_kumparan/screens/search.dart';
import 'package:clone_kumparan/screens/splash.dart';
import 'package:clone_kumparan/store/for_you_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sailor/sailor.dart';

import 'screens/dashboard.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));
  Routes.createRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => ForYouStore(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: Routes.sailor.navigatorKey, // important
        onGenerateRoute: Routes.sailor.generator(),
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.notoSansTextTheme(),
            backgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              brightness: Brightness.light,
              iconTheme: IconThemeData(color: Colors.black),
              color: Colors.white,
              textTheme: TextTheme(title: TextStyle(color: Colors.black)),
            )),
        home: Splash(),
      ),
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
        builder: (BuildContext context, BaseArguments args, ParamMap paramMap) {
          return Dashboard();
        },
        name: 'dashboard',
        defaultTransitions: [SailorTransition.fade_in],
      ),
      SailorRoute(
          builder:
              (BuildContext context, BaseArguments args, ParamMap paramMap) {
            return Search();
          },
          name: 'search',
          // defaultTransitionDuration: Duration(milliseconds: 3200),
          defaultTransitions: [SailorTransition.fade_in]),
      SailorRoute(
          builder:
              (BuildContext context, BaseArguments args, ParamMap paramMap) {
            return NewsDetail();
          },
          name: 'news_detail',
          params: [
            SailorParam<String>(
              name: 'title',
              defaultValue: 'No Title',
            ),
            SailorParam<String>(
              name: 'imageUrl',
              defaultValue: '',
            ),
            SailorParam<String>(
              name: 'key',
              defaultValue: '',
            ),
          ],
          defaultTransitionDuration: Duration(milliseconds: 500),
          defaultTransitions: [SailorTransition.fade_in]),
      SailorRoute(
          builder:
              (BuildContext context, BaseArguments args, ParamMap paramMap) {
            return Menu();
          },
          name: 'menu',
          // defaultTransitionDuration: Duration(milliseconds: 3200),
          defaultTransitions: [SailorTransition.slide_from_right]
          )
    ]);
  }
}
