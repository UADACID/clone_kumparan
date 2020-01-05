import 'package:clone_kumparan/models/news_item_model.dart';
import 'package:clone_kumparan/widgets/news_item.dart';
import 'package:clone_kumparan/widgets/news_item_placeholder.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';

import '../main.dart';

class ForYou extends StatefulWidget {
  @override
  _ForYouState createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  bool isLoading = true;
  ScrollController _scrollController;
  bool _isVisible = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      // print("listener");
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
        });
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
        });
      }
    });
    Future.delayed(Duration(milliseconds: 3500), () {
      setLoading(false);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  setLoading(value) {
    this.setState(() {
      isLoading = false;
    });
  }

  generateList() {
    List<Widget> list = [];
    List<NewsItemModel> data = ListNewsItem.listForHome;
    for (var i = 0; i < data.length; i++) {
      list.add(NewsItem(newsItemModel: data[i]));
      // list.add(NewsItemPlaceholder());
    }

    return list;
  }

  generateListPlaceholder() {
    List<Widget> list = [];
    List<NewsItemModel> data = ListNewsItem.listForHome;
    for (var i = 0; i < data.length; i++) {
      // list.add(NewsItem(newsItemModel: data[i]));
      Duration duration = Duration(milliseconds: 600 + (100 * i));
      Widget widget = ControlledAnimation(
          // delay: Duration(milliseconds: 600),
          duration: duration,
          tween: Tween(begin: Offset(0, 100), end: Offset.zero),
          curve: Curves.decelerate,
          builder: (context, value) {
            return Transform.translate(
                offset: value, child: NewsItemPlaceholder());
          });
      list.add(widget);
    }

    return list;
  }

  Future<void> _refreshList() async {
    this.setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 3), () {
      this.setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: <Widget>[
          AnimatedContainer(
            child: _buildHeaderOption(),
            curve: Curves.decelerate,
            height: ScreenUtil.getInstance().setHeight(_isVisible ? 100 : 0),
            duration: Duration(milliseconds: 500),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshList,
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    OutlineButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {},
                      child: Text(
                        'Judul Trending Topik',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: isLoading
                            ? generateListPlaceholder()
                            : generateList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildHeaderOption() {
    return Container(
      height: ScreenUtil.getInstance().setHeight(100),
      decoration: BoxDecoration(
          color: Colors.white,
          border: BorderDirectional(
              bottom: BorderSide(color: Colors.grey[400], width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildOptionItem('Trending'),
                _buildOptionItem('News'),
                _buildOptionItem('Entertainment'),
                _buildOptionItem('Food'),
                _buildOptionItem('Mom'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              FeatherIcons.plusCircle,
              size: ScreenUtil.getInstance().setSp(55),
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }

  Container _buildOptionItem(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13),
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        children: <Widget>[
          Image.asset('assets/kumparan_logo.png',
              width: ScreenUtil.getInstance().setWidth(51), height: 50),
          SizedBox(
            width: 18,
          ),
          Expanded(
            child: Container(
              height: ScreenUtil.getInstance().setWidth(65),
              child: InkWell(
                borderRadius: new BorderRadius.circular(20.0),
                onTap: () async {
                  var a = await Routes.sailor.navigate('search');
                  print(a);
                },
                child: TextField(
                  enabled: false,
                  autofocus: false,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey[300], width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey[300], width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.only(
                          left: ScreenUtil.getInstance().setWidth(30)),
                      hintText: 'Cari di sini...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 3),
                        child: Icon(
                          FeatherIcons.search,
                          size: 20,
                        ),
                      )),
                ),
              ),
            ),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(6),
          )
        ],
      ),
    );
  }
}
