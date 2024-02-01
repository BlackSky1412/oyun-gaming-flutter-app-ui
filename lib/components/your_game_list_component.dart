import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class YourGameListComponent extends StatelessWidget {
  final GamingModel yourGameList;

  YourGameListComponent({required this.yourGameList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            commonCachedNetworkImage(
              yourGameList.gameImage.validate(),
              fit: BoxFit.cover,
              height: 340,
              width: 230,
              radius: 0,
            ).paddingOnly(right: 8),
            Positioned(
              bottom: 24,
              left: 16,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: GradientBorder(
                    gradient: LinearGradient(colors: [redColor, blackColor, accentColor]),
                    borderRadius: 0.0,
                    child: Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(color: Colors.grey.shade200.withOpacity(0.3)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${yourGameList.mainPrice.validate()}', style: boldTextStyle(color: white, size: 18)),
                          16.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Stream Now", style: secondaryTextStyle()),
                                  8.height,
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      commonCachedNetworkImage(discord, fit: BoxFit.cover, height: 20, width: 20),
                                      16.width,
                                      commonCachedNetworkImage(twitch, fit: BoxFit.cover, height: 20, width: 20),
                                      16.width,
                                      commonCachedNetworkImage(youtube, fit: BoxFit.cover, height: 20, width: 20),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          16.height,
                          Row(
                            children: [
                              Text("PLAY", style: primaryTextStyle(size: 18)),
                              4.width,
                              commonCachedNetworkImage(slash),
                              Text("/", style: boldTextStyle(color: redColor, size: 18)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
