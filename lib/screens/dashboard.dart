import 'package:clone_kumparan/screens/for_you.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  List<Widget> _tabScreens = <Widget>[
    ForYou(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
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
          icon: Icon(FeatherIcons.bell),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text('Notifikasi'),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FeatherIcons.menu),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text('Menu'),
          ),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _tabScreens,
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}