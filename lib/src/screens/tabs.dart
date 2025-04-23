import 'package:ecommerce_app/src/screens/home.dart';
import 'package:ecommerce_app/src/screens/productos_screen.dart';
import 'package:flutter/material.dart';

// import '../elements/DrawerWidget.dart';
// import '../elements/FilterWidget.dart';
// import '../helpers/helper.dart';
// import '../models/route_argument.dart';
// import '../pages/home.dart';
// import '../pages/map.dart';
// import '../pages/notifications.dart';
// import '../pages/orders.dart';
// import 'messages.dart';

// ignore: must_be_immutable
class TabsWidget extends StatefulWidget {
  dynamic currentTab;
  // RouteArgument routeArgument;
  Widget currentPage = HomeScreen();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  TabsWidget({
    this.currentTab,
  }) {
    if (currentTab != null) {
      // if (currentTab is RouteArgument) {
      //   routeArgument = currentTab;
      //   currentTab = int.parse(currentTab.id);
      // }
    } else {
      currentTab = 0;
    }
  }

  @override
  _TabsWidgetState createState() {
    return _TabsWidgetState();
  }
}

class _TabsWidgetState extends State<TabsWidget> {
  // late int currTab;

  @override
  initState() {
    super.initState();
    // currTab = widget.currentTab;
    _selectTab(widget.currentTab);
  }

  @override
  void didUpdateWidget(TabsWidget oldWidget) {
    _selectTab(oldWidget.currentTab);
    super.didUpdateWidget(oldWidget);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem;
      switch (tabItem) {
        // case 0:
        //   widget.currentPage = NotificationsWidget(parentScaffoldKey: widget.scaffoldKey);
        //   break;
        // case 1:
        //   widget.currentPage = MapWidget(parentScaffoldKey: widget.scaffoldKey, routeArgument: widget.routeArgument);
        //   break;
        case 0:
          widget.currentPage = HomeScreen();
          break;
        case 1:
          widget.currentPage = ProductListPage();
          break;
        // case 3:
        //   widget.currentPage = OrdersWidget(parentScaffoldKey: widget.scaffoldKey);
        //   break;
        // case 4:
        //   widget.currentPage = MessagesWidget(parentScaffoldKey: widget.scaffoldKey); //FavoritesWidget(parentScaffoldKey: widget.scaffoldKey);
        //   break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // onWillPop: Helper.of(context).onWillPop,
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        key: widget.scaffoldKey,
        // drawer: DrawerWidget(),
        // endDrawer: FilterWidget(onFilter: (filter) {
        //   Navigator.of(context).pushReplacementNamed('/Pages', arguments: widget.currentTab);
        // }),
        body: widget.currentPage,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // selectedItemColor: Theme.of(context).accentColor,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 22,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedIconTheme: IconThemeData(size: 28),
          unselectedItemColor: Theme.of(context).focusColor.withOpacity(1),
          currentIndex: widget.currentTab,
          onTap: (int i) {
            this._selectTab(i);
          },
          // this will be set when a new tab is tapped
          items: [
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.notifications),
            //   label: '',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.location_on),
            //   label: '',
            // ),
            BottomNavigationBarItem(
                label: '',
                icon: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    // color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    // boxShadow: [
                    //   BoxShadow(color: Theme.of(context).accentColor.withOpacity(0.4), blurRadius: 40, offset: Offset(0, 15)),
                    //   BoxShadow(color: Theme.of(context).accentColor.withOpacity(0.4), blurRadius: 13, offset: Offset(0, 3))
                    // ],
                  ),
                  child: new Icon(Icons.home),
                )),
            BottomNavigationBarItem(
              icon: new Icon(Icons.fastfood),
              label: '',
            ),
            // BottomNavigationBarItem(
            //   icon: new Icon(Icons.chat),
            //   label: '',
            // ),
          ],
        ),
      ),
    );
  }
}
