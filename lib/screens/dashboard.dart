import 'package:clone_kumparan/main.dart';
import 'package:clone_kumparan/screens/for_you.dart';
import 'package:clone_kumparan/screens/lates.dart';
import 'package:clone_kumparan/store/for_you_store.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  List<Widget> _tabScreens = <Widget>[
    ForYou(),
    Lates(),
    Lates(),
    Lates(),
    Lates(),
  ];

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(FeatherIcons.home),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text('For you'),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FeatherIcons.clock),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text('Terbaru'),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FeatherIcons.star),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text('Collection'),
          ),
        ),
        BottomNavigationBarItem(
          // icon: Icon(FeatherIcons.bell),
          icon: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Icon(FeatherIcons.bell),
              Positioned(
                  top: -5.0,
                  right: -6.0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.red),
                    width: 18.0,
                    height: 18.0,
                    child: Center(
                      child: Text(
                        "99",
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ))
            ],
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text('Notifikasi'),
          ),
        ),
        BottomNavigationBarItem(
          icon: Observer(builder: (_) {
            ForYouStore forYouStore = Provider.of<ForYouStore>(context);
            return Icon(
              FeatherIcons.menu,
              color: forYouStore.isShowBottomSheet == true
                  ? Colors.blue
                  : Colors.grey,
            );
          }),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Observer(builder: (_) {
              ForYouStore forYouStore = Provider.of<ForYouStore>(context);
              return Text(
                'Menu',
                style: TextStyle(
                    color: forYouStore.isShowBottomSheet == true
                        ? Colors.blue
                        : Colors.grey),
              );
            }),
          ),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (int index) {
        if (index == _tabScreens.length - 1) {
          // Routes.sailor.navigate('menu');
          ForYouStore forYouStore =
              Provider.of<ForYouStore>(context, listen: false);
          if (forYouStore.isShowBottomSheet) {
            forYouStore.setShowBottomSheet(false);
          } else {
            forYouStore.setShowBottomSheet(true);
          }
        } else {
          setState(() {
            _selectedIndex = index;
          });
        }
      },
    );
  }

  // void handleNavigateScreenMenu() async {
  //   await Routes.sailor.navigate('menu');
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            IndexedStack(
              index: _selectedIndex,
              children: _tabScreens,
            ),
            Observer(builder: (_) {
              ForYouStore forYouStore = Provider.of<ForYouStore>(context);
              return forYouStore.isShowBottomSheet == false
                  ? SizedBox()
                  : GestureDetector(
                      onTap: () {
                        Provider.of<ForYouStore>(context, listen: false)
                            .setShowBottomSheet(false);
                      },
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          // child: Container(
                          //   height: 200,
                          //   color: Colors.white,
                          // ),
                          // child: AnimatedContainer(
                          //   child: Container(
                          //     height: 500,
                          //     color: Colors.white,
                          //   ),
                          //   curve: Curves.decelerate,
                          //   height: ScreenUtil.getInstance()
                          //       .setHeight(forYouStore.isShowBottomSheet ? 500 : 0),
                          //   duration: Duration(milliseconds: 300),
                          // ),
                          child: ControlledAnimation(
                              duration: Duration(milliseconds: 500),
                              tween: Tween(begin: Offset(0, 250), end: Offset.zero),
                              curve: Curves.easeIn,
                              builder: (context, value) {
                                return Transform.translate(
                                  offset: value,
                                  child: Container(
                                    height: 250,
                                    color: Colors.white,
                                    child: Center(child: Text('Konten'),),
                                  ),
                                );
                              }),
                        ),
                      ),
                    );
            })
          ],
        ),
        bottomNavigationBar: bottomNavigationBar(),
      ),
      onWillPop: () async {
        if (_selectedIndex == 0) {
          return Future.value(true);
        } else {
          setState(() {
            _selectedIndex = 0;
          });
          return Future.value(false);
        }
      },
    );
  }
}
