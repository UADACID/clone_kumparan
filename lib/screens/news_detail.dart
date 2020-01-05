import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_kumparan/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sailor/sailor.dart';
import 'package:simple_animations/simple_animations.dart';

class NewsDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    AppBar appBar = AppBar(
      title: Text('Demo'),
    );
    // Size size = MediaQuery.of(context).size;
    double appBarHeight = appBar.preferredSize.height;
    double statusBarHeight = ScreenUtil.statusBarHeight;

    final title = Sailor.param<String>(context, 'title');
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: _buildAppBar(),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          _buildSliverAppBar(appBarHeight, statusBarHeight, context),
          _buildContentDescription(),
        ],
      ),
    );
  }

  SliverList _buildContentDescription() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          ControlledAnimation(
              duration: Duration(milliseconds: 900),
              tween: Tween(begin: Offset(0, ScreenUtil.screenHeight / 3), end: Offset.zero),
              curve: Curves.easeIn,
              builder: (context, value) {
                return Transform.translate(offset: value, child: contentDesc());
              })
        ],
      ),
    );
  }

  Container contentDesc() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text(description,
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(30),
              )),
          SizedBox(
            height: 30,
          ),
          Text(secondDescription,
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(30),
              )),
          SizedBox(
            height: 30,
          ),
          Text(description,
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(30),
              )),
          SizedBox(
            height: 30,
          ),
          Text(secondDescription,
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(30),
              )),
          SizedBox(
            height: 30,
          ),
          Text(secondDescription,
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(30),
              )),
          SizedBox(
            height: 30,
          ),
          Text(secondDescription,
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(30),
              )),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(
      double appBarHeight, double statusBarHeight, BuildContext context) {
    final title = Sailor.param<String>(context, 'title');
    final imageUrl = Sailor.param<String>(context, 'imageUrl');
    return SliverAppBar(
      // pinned: true,
      title: _buildTitleAppBar(appBarHeight, statusBarHeight),
      titleSpacing: 0,
      leading: InkWell(
        onTap: () {
          Routes.sailor.pop();
        },
        child: Container(color: Colors.white, child: Icon(Icons.arrow_back)),
      ),
      expandedHeight: ScreenUtil.screenHeight / 4,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: title,
                  child: Material(
                    color: Colors.white,
                    child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: appBarHeight + statusBarHeight,
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setWidth(60),
                  ),
                  Text(
                    'News',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: ScreenUtil.getInstance().setSp(30),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setWidth(10),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(45),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setWidth(10),
                  ),
                  Text(
                    '5 januari 2020 12:30 WIB',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil.getInstance().setSp(23),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setWidth(55),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: CachedNetworkImage(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: imageUrl,
                        placeholder: (context, url) => Container(
                          // width: size.width / 3.5,
                          // height: size.width / 3.5,
                          color: Colors.grey[200],
                        ),
                        errorWidget: (context, url, error) => Container(
                          // width: size.width / 3.5,
                          // height: size.width / 3.5,
                          color: Colors.grey[200],
                          child: Center(
                            child: Text(error.toString()),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setWidth(10),
                  ),
                  Text(
                    'ilustrasi begal dan rampok Foto: Pratama Setya Wekaweka',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil.getInstance().setSp(23),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setWidth(10),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // AppBar _buildAppBar() {
  //   return AppBar(
  //     title: _buildTitleAppBar(),
  //   );
  // }

  Container _buildTitleAppBar(double appBarHeight, double statusBarHeight) {
    return Container(
      color: Colors.white,
      height: appBarHeight + statusBarHeight,
      child: Row(
        children: <Widget>[
          Image.asset('assets/kumparan_logo.png',
              width: ScreenUtil.getInstance().setWidth(51)),
          SizedBox(
            width: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: statusBarHeight,
              ),
              Text(
                'kumparanNEWS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: ScreenUtil.screenWidth / 5,
                  child: Text(
                    'Tidak hanya breaking news, tapi juga loremipsum dolor',
                    maxLines: 1,
                    style: TextStyle(color: Colors.grey),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

const String description =
    'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.';

const String secondDescription =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s";
