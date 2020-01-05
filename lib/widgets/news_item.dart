import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_kumparan/main.dart';
import 'package:clone_kumparan/models/news_item_model.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final NewsItemModel newsItemModel;

  const NewsItem({Key key, this.newsItemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            onTap: () {
              Routes.sailor.navigate('news_detail');
            },
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
                          newsItemModel.title,
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
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      width: size.width / 3.5,
                        height: size.width / 3.5,
                        fit: BoxFit.cover,
                      imageUrl: newsItemModel.imageUrl,
                      placeholder: (context, url) => Container(
                        width: size.width / 3.5,
                        height: size.width / 3.5,
                        color: Colors.grey[200],
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: size.width / 3.5,
                        height: size.width / 3.5,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text(error.toString()),
                        ),
                      ),
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
          child:
              Text(counter, style: TextStyle(fontSize: 11, color: Colors.grey)),
        ),
        offset: Offset(17, -6),
      )
    ],
  );
}
