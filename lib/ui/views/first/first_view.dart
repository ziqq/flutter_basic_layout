import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_layout/ui/widgets/dumb_widgets/content.dart';

import '../../widgets/layout_widgets/main_layout.dart';

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'First Screen',
      actions: [
        IconButton(icon: Icon(Icons.search), onPressed: null),
        IconButton(icon: Icon(Icons.settings), onPressed: null),
      ],
      body: [
        SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: CupertinoButton(
            child: Text('Go To Second Screen'),
            onPressed: () {
              Navigator.pushNamed(context, 'second');
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
