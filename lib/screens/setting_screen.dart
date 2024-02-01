import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/screens/sign_in_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  bool isSwitch = false;

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
    return Scaffold(
      backgroundColor: primaryColor,
      key: scaffoldKey,
      appBar: commonAppBar(context, callBack: () {
        scaffoldKey.currentState!.openDrawer();
      }),
      drawer: DrawerComponent(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Settings", style: boldTextStyle(size: 20, color: white)).paddingOnly(top: 16, left: 16),
          16.height,
          SettingItemWidget(
            title: "Language",
            titleTextStyle: primaryTextStyle(size: 18),
            trailing: Text("English", style: secondaryTextStyle()),
          ),
          Divider(height: 0, color: context.dividerColor),
          SettingItemWidget(
            padding: EdgeInsets.only(left: 16, right: 0, top: 0, bottom: 0),
            title: "Notifications",
            onTap: () {
              setState(() {
                isSwitch = !isSwitch;
              });
            },
            titleTextStyle: primaryTextStyle(size: 18),
            trailing: Switch(
              value: isSwitch,
              onChanged: (value) {
                setState(() {
                  isSwitch = value;
                });
              },
              activeTrackColor: activeTrackColor,
              inactiveTrackColor: gray,
              activeColor: accentColor,
            ),
          ),
          Divider(height: 0, color: context.dividerColor),
          SettingItemWidget(
            title: "Default Purchase Settings",
            titleTextStyle: primaryTextStyle(size: 18),
          ),
          Divider(height: 0, color: context.dividerColor),
          SettingItemWidget(
            title: "Legal & About",
            titleTextStyle: primaryTextStyle(size: 18),
          ),
          Divider(height: 0, color: context.dividerColor),
          SettingItemWidget(
            title: "Switch Accounts",
            titleTextStyle: primaryTextStyle(size: 18),
          ),
          Divider(height: 0, color: context.dividerColor),
          SettingItemWidget(
            title: "Sign Out",
            onTap: () {
              showInDialog(
                context,
                builder: (_) {
                  return Container(
                    width: context.width(),
                    padding: EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        commonCachedNetworkImage(logo, width: 150, height: 150, fit: BoxFit.cover),
                        16.height,
                        Text("Are you sure you want to Logout?", style: boldTextStyle(size: 18), textAlign: TextAlign.center),
                        32.height,
                        appButtonGradientBorderWidget(
                          gradientWidget: AppButton(
                            color: white,
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Text('Log Out', style: boldTextStyle(color: black, size: 18), textAlign: TextAlign.center),
                            onTap: () {
                              SignInScreen().launch(context, isNewTask: true);
                            },
                          ),
                        ).center(),
                      ],
                    ),
                  );
                },
                shape: RoundedRectangleBorder(borderRadius: radius(0)),
              );
            },
            titleTextStyle: primaryTextStyle(size: 18),
          ),
        ],
      ),
    );
  }
}
