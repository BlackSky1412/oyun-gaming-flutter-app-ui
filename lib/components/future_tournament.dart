import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/constant.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class FutureTournament extends StatelessWidget {
  final GamingModel futureTournament;

  FutureTournament({required this.futureTournament});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBorder(
          gradient: commonGradientWidget(),
          borderRadius: 0,
          strokeWidth: strokeWidth,
          child: commonCachedNetworkImage(
            futureTournament.gameImage.validate(),
            fit: BoxFit.cover,
            height: 150,
            width: context.width(),
            radius: 0,
          ),
        ).paddingSymmetric(horizontal: 16, vertical: 8),
        Positioned(
          right: 32,
          top: 24,
          child: Column(
            children: [
              Text(futureTournament.rank.validate(), style: boldTextStyle(color: white.withOpacity(0.5))),
              4.height,
              Text("USD", style: boldTextStyle(color: white.withOpacity(0.5), size: 14)),
            ],
          ),
        ),
        Positioned(
          bottom: 32,
          left: 32,
          child: GradientBorder(
            gradient: commonGradientWidget(),
            borderRadius: 0.0,
            strokeWidth: strokeWidth,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.grey.shade200.withOpacity(0.3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(futureTournament.day.validate(), style: secondaryTextStyle(size: 10)),
                          8.width,
                          Container(height: 15, width: 1, color: accentColor),
                          8.width,
                          Text(futureTournament.title.validate(), style: secondaryTextStyle(size: 10)),
                        ],
                      ),
                      16.height,
                      Text(futureTournament.mainPrice.validate(), style: boldTextStyle(color: white)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
