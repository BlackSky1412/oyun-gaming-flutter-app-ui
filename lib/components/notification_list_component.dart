import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/constant.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class NotificationListComponent extends StatelessWidget {
  final GamingModel? notificationData;

  NotificationListComponent({this.notificationData});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientBorder(
          gradient: LinearGradient(colors: [Colors.red, primaryColor, accentColor]),
          strokeWidth: strokeWidth,
          borderRadius: 0,
          child: commonCachedNetworkImage(notificationData!.gameImage.toString(), fit: BoxFit.cover, width: 60, height: 60, radius: 0),
        ),
        16.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notificationData!.drawerItemName.validate(), style: primaryTextStyle()),
            16.height,
            Row(
              children: [
                Text(notificationData!.title.validate(), style: boldTextStyle(color: white)),
                4.width,
                commonCachedNetworkImage(slash),
                Text("/", style: boldTextStyle(color: redColor, size: 20)),
              ],
            )
          ],
        )
      ],
    ).paddingOnly(bottom: 16);
  }
}
