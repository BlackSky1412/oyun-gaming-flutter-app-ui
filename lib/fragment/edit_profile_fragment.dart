import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/screens/help_screen.dart';
import 'package:oyun_gaming_flutter/screens/notification_screen.dart';
import 'package:oyun_gaming_flutter/screens/purchase_more_screen.dart';
import 'package:oyun_gaming_flutter/screens/return_and_cancel_list_sceen.dart';
import 'package:oyun_gaming_flutter/screens/sign_in_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class EditProfiledFragment extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: commonAppBar(context, callBack: () {
        scaffoldKey.currentState!.openDrawer();
      }),
      backgroundColor: primaryColor,
      drawer: DrawerComponent(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonRichText(title: "Your", subTitle: " Account"),
            16.height,
            Row(
              children: [
                commonCachedNetworkImage(userImage, height: 60, width: 60, fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Chris Landon', style: primaryTextStyle()),
                    8.height,
                    Text('landonchris@iqonic.com', style: secondaryTextStyle()),
                  ],
                ).expand(),
                commonCachedNetworkImage(editProfile, height: 22, fit: BoxFit.cover, width: 22).onTap(() {}),
              ],
            ),
            42.height,
            commonRichText(title: "Orders", subTitle: " and Returns", textSize: 18),
            8.height,
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Your Games",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                //
              },
            ),
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Your Orders",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                //
              },
            ),
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Customer Care",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
              subTitle: "We Are Available For You 24/7",
              subTitleTextStyle: secondaryTextStyle(),
            ),
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Returns & Cancellations",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                //
              },
            ),
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Invite Friends And Earn Rewards",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
              subTitle: "You Get \$150 For Every Friend Invite",
              subTitleTextStyle: secondaryTextStyle(),
              onTap: () {
                //
              },
            ),
            Divider(color: gray.withOpacity(0.5)),
            32.height,
            commonRichText(title: "Manage", subTitle: " Your Details", textSize: 18),
            8.height,
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Manage Notifications",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                //finish(context);
                PurchaseMoreScreen().launch(context);
              },
            ),
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Save Cards",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                //
              },
            ),
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Address",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                //
              },
            ),
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Your Rewards",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                //
              },
            ),
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Help",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                PurchaseMoreScreen().launch(context);
              },
            ),
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Send Feedback",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                //
              },
            ),
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Terms Of Service",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                //
              },
            ),
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Privacy Policy",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                //
              },
            ),
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Return And Refund Policy",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                PurchaseMoreScreen().launch(context);
              },
            ),
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Terms And Condition",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                //
              },
            ),
            Divider(color: gray.withOpacity(0.5)),
            SettingItemWidget(
              title: "Log Out",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              titleTextStyle: primaryTextStyle(),
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
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
      ),
    );
  }
}
