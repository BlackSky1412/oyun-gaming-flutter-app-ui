import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/fragment/edit_profile_fragment.dart';
import 'package:oyun_gaming_flutter/fragment/home_fragment.dart';
import 'package:oyun_gaming_flutter/fragment/streaming_fragment.dart';
import 'package:oyun_gaming_flutter/screens/purchase_more_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/constant.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  int _selectedIndex = 0;
  DateTime? currentBackPressTime;

  var _pages = [
    HomeFragment(),
    PurchaseMoreScreen(),
    StreamingFragment(),
    PurchaseMoreScreen(),
    EditProfiledFragment(),
  ];

  Widget _bottomTab() {
    return Container(
      decoration: boxDecorationWithRoundedCorners(
        gradient: LinearGradient(colors: [Colors.red, accentColor]),
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(1.5),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedFontSize: 0,
          backgroundColor: primaryColor,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: commonCachedNetworkImage(home, width: bottomNavigationIconSize, height: bottomNavigationIconSize, color: white),
              label: '',
              activeIcon: commonCachedNetworkImage(home, width: bottomNavigationIconSize, height: bottomNavigationIconSize, color: accentColor),
            ),
            BottomNavigationBarItem(
              icon: commonCachedNetworkImage(winner, width: bottomNavigationIconSize, height: bottomNavigationIconSize, color: white),
              label: '',
              activeIcon: commonCachedNetworkImage(winner, width: bottomNavigationIconSize, height: bottomNavigationIconSize, color: accentColor),
            ),
            BottomNavigationBarItem(
              icon: commonCachedNetworkImage(video, width: bottomNavigationIconSize, height: bottomNavigationIconSize, color: white),
              label: '',
              activeIcon: commonCachedNetworkImage(video, width: bottomNavigationIconSize, height: bottomNavigationIconSize, color: accentColor),
            ),
            BottomNavigationBarItem(
              icon: commonCachedNetworkImage(users, width: bottomNavigationIconSize, height: bottomNavigationIconSize, color: white),
              label: '',
              activeIcon: commonCachedNetworkImage(users, width: bottomNavigationIconSize, height: bottomNavigationIconSize, color: accentColor),
            ),
            BottomNavigationBarItem(
              icon: commonCachedNetworkImage(profile, width: 22, height: 22, color: white),
              label: '',
              activeIcon: commonCachedNetworkImage(profile, width: 20, height: 20, color: accentColor),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          toast("Press back again to exit app");
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: primaryColor,
        drawer: DrawerComponent(),
        bottomNavigationBar: _bottomTab(),
        body: Center(child: _pages.elementAt(_selectedIndex)),
      ),
    );
  }
}
