import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainLayout extends StatefulWidget {
  final String title;
  final List<Widget> body, actions;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;

  MainLayout({
    Key key,
    @required this.title,
    @required this.body,
    this.actions,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  bool _showAppbar;
  double _appBarHeight = 53;
  ScrollController _scrollController;
  Duration _animatedFadeDuration = Duration(milliseconds: 150);

  @override
  void initState() {
    super.initState();
    _showAppbar = false;
    _scrollController = ScrollController();
    _scrollHendler();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  void _scrollHendler() async {
    _scrollController.addListener(() {
      if (_scrollController.offset.round() > _appBarHeight) {
        setState(() {
          _showAppbar = true;
        });
      } else {
        setState(() {
          _showAppbar = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: AnimatedOpacity(
          opacity: _showAppbar ? 1 : 0,
          duration: _animatedFadeDuration,
          child: Text(
            _showAppbar ? widget.title : '',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          if (widget.actions != null)
            AnimatedOpacity(
              opacity: _showAppbar ? 1 : 0,
              duration: _animatedFadeDuration,
              child: Row(children: widget.actions),
            )
        ],
        bottom: PreferredSize(
          child: Container(
            color: _showAppbar ? Colors.black12 : Colors.transparent,
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(1.0),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                right: widget.actions != null ? 0 : 20,
                top: 20.0,
                bottom: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (widget.actions != null) Row(children: widget.actions)
                ],
              ),
            ),
            ...widget.body,
          ],
        ),
      ),
      floatingActionButton: widget.floatingActionButton,
      // bottomNavigationBar: MyBottomNavigation(),
    );
  }
}

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      iconSize: 24.0,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentPageIndex,
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
