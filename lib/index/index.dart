import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zhihu2/college/college.dart';
import 'package:zhihu2/home/homePage.dart';
import 'package:zhihu2/index/navigation_icon_view.dart';
import 'package:zhihu2/light/light.dart';
import 'package:zhihu2/me/me.dart';
import 'package:zhihu2/message/message.dart';

class Index extends StatefulWidget {
  @override
  State<Index> createState() => new _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;


  @override
  void initState(){
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.assignment),
        title: new Text("首页"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.message),
        title: new Text("消息"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.lightbulb_outline),
        title: new Text("想法"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.account_balance),
        title: new Text("大学"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.account_circle),
        title: new Text("我"),
        vsync: this,
      )
    ];
    for(NavigationIconView view in _navigationViews){
      view.controller.addListener(_rebuild);
    }
    _pageList = <StatefulWidget>[
      new HomePage(),
      new Message(),
      new Light(),
      new College(),
      new Me()

    ];
    _currentPage = _pageList[_currentIndex];
  }

  void _rebuild(){
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }








  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        items: _navigationViews
            .map((NavigationIconView navigationIconView) => navigationIconView.item)
            .toList(),
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState((){
            _navigationViews[_currentIndex].controller.reverse();
            _currentIndex = index;
            _navigationViews[_currentIndex].controller.forward();
            _currentPage = _pageList[_currentIndex];
          });
        }
    );

    return new MaterialApp(
        home: new Scaffold(
          body: new Center(
              child: _currentPage
          ),
          bottomNavigationBar: bottomNavigationBar,
        ),

    );
  }
}
