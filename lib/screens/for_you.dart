import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';

class ForYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            Image.asset('assets/kumparan_logo.png', width: ScreenUtil.getInstance().setWidth(51), height: 50),
            SizedBox(
              width: 18,
            ),
            Expanded(
              child: Container(
                // padding: EdgeInsets.symmetric(vertical: 0),
                height: ScreenUtil.getInstance().setWidth(65),
                // color: Colors.red,
                child: InkWell(
                  onTap: () {
                    Routes.sailor.navigate('search');
                  },
                  child: TextField(
                    enabled: false,
                    autofocus: false,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[300], width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[300], width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.only(
                            left: ScreenUtil.getInstance().setWidth(30)),
                        hintText: 'Cari di sini...',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
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
      ),
    );
  }
}
