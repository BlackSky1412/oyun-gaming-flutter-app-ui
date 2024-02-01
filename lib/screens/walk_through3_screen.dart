import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/gaming_list_component.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/purchase_more_screen.dart';
import 'package:oyun_gaming_flutter/screens/sign_in_screen.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

import '../utils/colors.dart';

class WalkThrough3 extends StatelessWidget {
  final List<GamingModel> gamingList = getSignInSelectGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                50.height,
                commonRichText(
                  title: "Pick Up Games",
                  subTitle: " To See All Activities On Your Interests",
                  textSize: 18,
                  textHeight: 1.7,
                ).paddingOnly(left: 16, right: 16, top: 24, bottom: 16),
                ListView.builder(
                  padding: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 170),
                  itemCount: gamingList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    GamingModel data = gamingList[index];
                    return GamingListComponent(data: data);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            right: 28,
            left: 28,
            child: Column(
              children: [
                Text('Get Started With Oyun Now!', style: boldTextStyle(color: white, size: 18)),
                16.height,
                Row(
                  children: [
                    appButtonGradientBorderWidget(
                      gradientWidget: AppButton(
                        color: white,
                        width: context.width(),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text('SIGN UP', style: boldTextStyle(color: black)),
                        onTap: () {
                          finish(context);
                          PurchaseMoreScreen().launch(context);
                        },
                      ),
                    ).expand(),
                    16.width,
                    appButtonGradientBorderWidget(
                      gradientWidget: AppButton(
                        color: white,
                        width: context.width(),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text('SIGN IN', style: boldTextStyle(color: black), textAlign: TextAlign.center),
                        onTap: () {
                          finish(context);
                          SignInScreen().launch(context);
                        },
                      ),
                    ).expand(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
