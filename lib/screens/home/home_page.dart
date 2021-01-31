import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watermaniac/screens/history/history_page.dart';
import 'package:watermaniac/screens/meter/meter_screen.dart';
import 'package:watermaniac/screens/notifications/notifications_settings_page.dart';
import 'package:watermaniac/screens/today/today_page.dart';
import 'package:watermaniac/util/utils.dart';
import 'package:watermaniac/widgets/shadow/shadow_icon.dart';

import 'package:watermaniac/screens/settings/settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  DateTime lastUpdated;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (lastUpdated != null && !Utils.isToday(lastUpdated)) {
        setState(() {
          lastUpdated = DateTime.now();
        });
      }
    } else if (state == AppLifecycleState.paused) {
      lastUpdated = DateTime.now();
    }
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return TodayPage();
      case 1:
        return HistoryPage();
      case 2:
        return MeterPage();
      case 3:
        return NotificationsSettingsPage();
      case 4:
        return SettingsPage();

      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ShadowIcon(
                Icons.home,
                offsetX: 0.0,
                offsetY: 0.0,
                blur: 3.0,
                shadowColor: Colors.black.withOpacity(0.25),
              ),
              title: Text('Today')),
          BottomNavigationBarItem(
              icon: ShadowIcon(
                Icons.history,
                offsetX: 0.0,
                offsetY: 0.0,
                blur: 3.0,
                shadowColor: Colors.black.withOpacity(0.25),
              ),
              title: Text('History')),
          BottomNavigationBarItem(
              icon: ShadowIcon(
                Icons.access_time,
                offsetX: 0.0,
                offsetY: 0.0,
                blur: 3.0,
                shadowColor: Colors.black.withOpacity(0.25),
              ),
              title: Text('Meters')),
          BottomNavigationBarItem(
              icon: ShadowIcon(
                Icons.notifications,
                offsetX: 0.0,
                offsetY: 0.0,
                blur: 3.0,
                shadowColor: Colors.black.withOpacity(0.25),
              ),
              title: Text('Notifications')),
          BottomNavigationBarItem(
              icon: ShadowIcon(
                Icons.settings,
                offsetX: 0.0,
                offsetY: 0.0,
                blur: 3.0,
                shadowColor: Colors.black.withOpacity(0.25),
              ),
              title: Text('Settings')),
        ],
        backgroundColor: Colors.white,
        iconSize: 28.0,
        activeColor: const Color(0xFF4c9bfb),
        inactiveColor: const Color(0xFFa3a3a3),
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
                backgroundColor: const Color(0xFFf7f7f7),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                    Positioned.fill(
                      child: FloatingBubbles(
                        noOfBubbles: 40,
                        colorOfBubbles: Colors.white.withAlpha(70),
                        sizeFactor: 0.2,
                        duration:
                            0, //if this value is zero then the animation keeps playing forever.
                      ),
                    ),

                    // Container(
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           alignment: AlignmentDirectional.topStart,
                    //           image: AssetImage(
                    //               'assets/background/top-background.png'),
                    //           fit: BoxFit.fitWidth)),
                    // ),

                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: _getBody(index),
                    ),
                  ],
                ));
          },
        );
      },
    );
  }
}
