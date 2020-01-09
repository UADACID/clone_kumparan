import 'package:clone_kumparan/models/news_item_model.dart';
import 'package:clone_kumparan/widgets/news_item.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  generateList() {
    List<Widget> list = [];
    List<NewsItemModel> data = ListNewsItem.listForHome;
    for (var i = 0; i < data.length; i++) {
      if (i % 2 == 0) {
        list.add(NewsItem(newsItemModel: data[i], key: Key('search$i'),));
      }
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
      appBar: _buildAppBar(context, focusNode),
      // body: _buildBody(context),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
          ),
          ControlledAnimation(
              duration: Duration(milliseconds: 600),
              tween: Tween(
                  begin: Offset(0, ScreenUtil.screenHeight / 1.5),
                  end: Offset.zero),
              curve: Curves.decelerate,
              child: _buildBody(context),
              builderWithChild: (context, child, value) {
                return Transform.translate(offset: value, child: child);
              }),
        ],
      ),
    );
  }

  Container _buildBody(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              _buildPopulerContainer(),
              SizedBox(
                height: 40,
              ),
              _buildRecomendationContainer(context),
            ],
          )),
    );
  }

  Container _buildPopulerContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          _buildHeaderTitle('Pencarian populer'),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Wrap(
            spacing: 5,
            runSpacing: 0,
            children: <Widget>[
              _buildPopularSearchItem('luhut'),
              _buildPopularSearchItem('pembunuhan'),
              _buildPopularSearchItem('xiaomi'),
              _buildPopularSearchItem('bambang pamukas'),
              _buildPopularSearchItem('natuna diserang china'),
              _buildPopularSearchItem('indonesia juara'),
              _buildPopularSearchItem('apple'),
              _buildPopularSearchItem('sinyorita kena banjir'),
              _buildPopularSearchItem('kapal ikan asing'),
              _buildPopularSearchItem('leonardo')
            ],
          ),
        ],
      ),
    );
  }

  Container _buildRecomendationContainer(context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        key: Key('buildRecomendationContainer'),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _buildHeaderTitle('Rekomendasi'),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: generateList(),
            ),
          )
        ],
      ),
    );
  }

  Container _buildHeaderTitle(String title) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            height: 30,
            width: 7,
            color: Colors.red,
          ),
          SizedBox(
            width: 7,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  OutlineButton _buildPopularSearchItem(String title) {
    return OutlineButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, FocusNode focusNode) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context, 'Valuewkwk');
            },
            child: Icon(Icons.arrow_back),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(40),
          ),
          Expanded(
            child: Container(
              height: ScreenUtil.getInstance().setWidth(65),
              child: TextField(
                // autofocus: true,
                focusNode: focusNode,
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
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(6),
          )
        ],
      ),
    );
  }
}
