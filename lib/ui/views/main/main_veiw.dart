import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_basic_layout/ui/views/first/first_view.dart';
import 'package:flutter_basic_layout/ui/views/second/second_view.dart';

import 'main_vewmodel.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: getViewForIndex(model.currentIndex),
        bottomNavigationBar: MyBottomNavigation(
          onTap: model.setIndex,
          currentIndex: model.currentIndex,
        ),
      ),
      viewModelBuilder: () => MainViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return FirstView();
      case 1:
        return SecondView();
      default:
        return FirstView();
    }
  }
}

class MyBottomNavigation extends StatefulWidget {
  final Function onTap;
  final int currentIndex;

  const MyBottomNavigation({
    Key key,
    this.onTap,
    this.currentIndex,
  }) : super(key: key);

  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      iconSize: 24.0,
      showUnselectedLabels: true,
      onTap: widget.onTap,
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentIndex,
      backgroundColor: Colors.white,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).primaryColorLight,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      unselectedLabelStyle: TextStyle(
        height: 1.5,
        fontWeight: FontWeight.w500,
        color: Colors.black54,
      ),
      selectedLabelStyle: TextStyle(
        color: Colors.black,
        height: 1.5,
        fontWeight: FontWeight.w500,
      ),
      items: [
        BottomNavigationBarItem(
          label: 'First',
          icon: BottomNavigationBarIcon(
            icon: 'assets/icons/bottom_navigation/dashboard.svg',
          ),
          activeIcon: BottomNavigationBarIcon(
            icon: 'assets/icons/bottom_navigation/dashboard_fill.svg',
          ),
        ),
        BottomNavigationBarItem(
          label: 'Second',
          icon: BottomNavigationBarIcon(
            icon: 'assets/icons/bottom_navigation/favorites.svg',
          ),
          activeIcon: BottomNavigationBarIcon(
            icon: 'assets/icons/bottom_navigation/favorites_fill.svg',
          ),
        ),
      ],
    );
  }
}

class BottomNavigationBarIcon extends StatelessWidget {
  final String icon;

  const BottomNavigationBarIcon({
    Key key,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      fit: BoxFit.cover,
      color: Colors.black,
      height: 24.0,
    );
  }
}
