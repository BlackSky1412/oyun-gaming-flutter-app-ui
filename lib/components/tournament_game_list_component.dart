import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class TournamentGameListComponent extends StatelessWidget {
  final GamingModel tournamentGameList;

  TournamentGameListComponent({required this.tournamentGameList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            commonCachedNetworkImage(tournamentGameList.gameImage.validate(), fit: BoxFit.cover, height: 375, width: 250, radius: 0).paddingOnly(right: 8),
            Positioned(
              right: 16,
              top: 16,
              child: Row(
                children: [
                  Container(decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: progressIndicatorColor), width: 10, height: 10),
                  8.width,
                  Text("LIVE", style: primaryTextStyle()),
                ],
              ),
            ),
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
                      width: 175,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Colors.grey.shade200.withOpacity(0.3)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${tournamentGameList.mainPrice.validate()} Spectators', style: boldTextStyle(color: white, size: 18)),
                          16.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Join Your Friends", style: secondaryTextStyle()),
                                  16.height,
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
                          20.height,
                          Row(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  commonGradientBorderWidget(borderRadius: 15, child: commonCachedNetworkImage(userImage, fit: BoxFit.cover, radius: 15, height: 30, width: 30)),
                                  Positioned(right: 16, child: commonGradientBorderWidget(borderRadius: 15, child: commonCachedNetworkImage(userImage, fit: BoxFit.cover, radius: 15, height: 30, width: 30))),
                                  Positioned(right: 16, child: commonGradientBorderWidget(borderRadius: 15, child: commonCachedNetworkImage(userImage2, fit: BoxFit.cover, radius: 15, height: 30, width: 30))),
                                  Positioned(right: 32, child: commonGradientBorderWidget(borderRadius: 15, child: commonCachedNetworkImage(userImage3, fit: BoxFit.cover, radius: 15, height: 30, width: 30))),
                                ],
                              ).paddingOnly(left: 32),
                              8.width,
                              commonGradientBorderWidget(
                                borderRadius: 15,
                                child: Container(
                                  decoration: boxDecorationWithRoundedCorners(
                                    boxShape: BoxShape.circle,
                                    backgroundColor: editTextBackgroundColor,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                  padding: EdgeInsets.all(2),
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.center,
                                  child: Text(tournamentGameList.mainPrice.validate(), style: secondaryTextStyle(size: 10)),
                                ),
                              ),
                            ],
                          ),
                          20.height,
                          Row(
                            children: [
                              Text("PLAY", style: primaryTextStyle()),
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
