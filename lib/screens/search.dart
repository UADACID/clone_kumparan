import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        // margin: EdgeInsets.symmetric(horizontal: 20),
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
      ),
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
              children: <Widget>[
                _buildRecomendationItem(size),
                _buildRecomendationItem(size),
                _buildRecomendationItem(size),
                _buildRecomendationItem(size),
                _buildRecomendationItem(size),
                _buildRecomendationItem(size),
                _buildRecomendationItem(size),
                _buildRecomendationItem(size),
                _buildRecomendationItem(size),
                _buildRecomendationItem(size),
                _buildRecomendationItem(size),
                _buildRecomendationItem(size),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildRecomendationItem(Size size) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'CFD di Bundaran Hi Kini Bebas dari PKL',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'kumparanNews',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            _buildIconWithCounter(FeatherIcons.heart, '10'),
                            SizedBox(
                              width: 10,
                            ),
                            _buildIconWithCounter(
                                FeatherIcons.messageCircle, '28'),
                            SizedBox(
                              width: 10,
                            ),
                            _buildIconWithCounter(FeatherIcons.share2, ''),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '3 November 2019',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 11),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1570429343/fcahcysqhzm1azs5fxqh.jpg',
                      width: size.width / 3.5,
                      height: size.width / 3.5,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Stack _buildIconWithCounter(IconData iconData, String counter) {
    return Stack(
      children: <Widget>[
        Icon(iconData, color: Colors.grey),
        Transform.translate(
          child: Container(
            padding: EdgeInsets.all(counter == '' ? 0 : 1),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Text(counter,
                style: TextStyle(fontSize: 11, color: Colors.grey)),
          ),
          offset: Offset(17, -6),
        )
      ],
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

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context);
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
                autofocus: true,
                decoration: InputDecoration(
                    // focusedBorder: OutlineInputBorder(
                    //     borderSide:
                    //         BorderSide(color: Colors.grey[300], width: 1.0),
                    //     borderRadius: BorderRadius.all(Radius.circular(20))),
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
