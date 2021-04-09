import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          for (var i = 0; i < 8; i++)
            Container(
              color: Colors.red,
              height: 150,
              margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
            ),
        ],
      ),
    );
  }
}
