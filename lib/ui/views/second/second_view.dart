import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_layout/ui/widgets/dumb_widgets/content.dart';

import '../../widgets/layout_widgets/main_layout.dart';

class SecondView extends StatelessWidget {
  const SecondView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Second Screen',
      body: [
        SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: CupertinoButton(
            child: Text('Go To First Screen'),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 40),
        Content(),
      ],
    );
  }
}
