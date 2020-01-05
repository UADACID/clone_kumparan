import 'package:flutter/material.dart';

class NewsItemPlaceholder extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Divider(
              color: Colors.grey[200],
            ),
          ),
          InkWell(
            onTap: () {
              print('object');
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
                        // Text(
                        //   newsItemModel.title,
                        //   style: TextStyle(
                        //       fontSize: 16, fontWeight: FontWeight.bold),
                        // ),
                        Container(height: 20, width: size.width / 1.8, color: Colors.grey[200],),
                        SizedBox(
                          height: 10,
                        ),
                        Container(height: 20, width: size.width / 2, color: Colors.grey[200],),
                        SizedBox(
                          height: 10,
                        ),
                        // Text(
                        //   'kumparanNews',
                        //   style: TextStyle(color: Colors.grey),
                        // ),
                        Container(height: 20, width: size.width / 3, color: Colors.grey[200],),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            // _buildIconWithCounter(FeatherIcons.heart, '10'),
                            Container(height: 20, width: 20, color: Colors.grey[200],),
                            SizedBox(
                              width: 10,
                            ),
                            // _buildIconWithCounter(
                            //     FeatherIcons.messageCircle, '28'),
                            Container(height: 20, width:20, color: Colors.grey[200],),
                            SizedBox(
                              width: 10,
                            ),
                            // _buildIconWithCounter(FeatherIcons.share2, ''),
                            Container(height: 20, width: 20, color: Colors.grey[200],),
                            SizedBox(
                              width: 10,
                            ),
                            Container(height: 20, width: size.width / 4, color: Colors.grey[200],),
                            // Text(
                            //   '3 November 2019',
                            //   style:
                            //       TextStyle(color: Colors.grey, fontSize: 11),
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   child: Image.network(
                  //     newsItemModel.imageUrl,
                  //     width: size.width / 3.5,
                  //     height: size.width / 3.5,
                  //     fit: BoxFit.cover,
                  //   ),
                  // )
                  Container(height: size.width / 3.5, width: size.width / 3.5, color: Colors.grey[200],),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}