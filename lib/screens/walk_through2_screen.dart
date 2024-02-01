import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/gaming_list_component.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

import '../utils/colors.dart';

class WalkThrough2 extends StatelessWidget {
  final VoidCallback? onChange;
  final List<GamingModel> gamingList = getSelectGame();

  WalkThrough2({this.onChange});

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
                  padding: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 115),
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
            child: appButtonGradientBorderWidget(
              gradientWidget: AppButton(
                color: white,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('GET STARTED', style: boldTextStyle(color: black)),
                onTap: () {
                  onChange?.call();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
