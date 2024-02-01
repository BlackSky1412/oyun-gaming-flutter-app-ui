import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/sign_in_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  List<GamingModel> drawerList = getDrawerList();

  int? drawerIndex;

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
    return Theme(
      data: ThemeData(canvasColor: primaryColor),
      child: Drawer(
        child: Container(
          color: editTextBackgroundColor,
          child: Stack(
            children: [
              Container(
                color: progressIndicatorColor,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: progressIndicatorColor),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      commonCachedNetworkImage(userImage, height: 80, width: 80, fit: BoxFit.cover).cornerRadiusWithClipRRect(50),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Hello!', style: boldTextStyle(color: Colors.white, size: 18)),
                          8.height,
                          Text('Chris Landon', style: boldTextStyle(color: Colors.white, size: 18)),
                          8.height,
                          Text('landonchris@iqonic.com', style: secondaryTextStyle(color: black.withOpacity(0.4))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                itemCount: drawerList.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                itemBuilder: (_, index) {
                  GamingModel data = drawerList[index];

                  return Container(
                    padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                    color: editTextBackgroundColor,
                    child: Row(
                      children: [
                        commonCachedNetworkImage(data.gameImage.validate(), height: 20, width: 20, color: drawerIndex == index ? accentColor : white),
                        Text(data.drawerItemName.validate(), style: primaryTextStyle(color: drawerIndex == index ? accentColor : white)).paddingAll(8),
                      ],
                    ),
                  ).onTap(() {
                    drawerIndex = index;
                    setState(() {});
                    if (drawerIndex == 9) {
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
                    } else {
                      finish(context);
                      data.drawerWidget.launch(context);
                    }
                  });
                },
              ).paddingTop(220)
            ],
          ),
        ),
      ),
    );
  }
}
