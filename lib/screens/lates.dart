import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Lates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 100,
        // width: 100,
        padding: EdgeInsets.all(50),
        child: FlareActor('assets/empty_data.flr',
            // alignment: Alignment.center,
            // fit: BoxFit.contain,
            animation: "empty"));
  }
}
