import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/order_detail_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/flutter_rating_bar.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class OrderListComponent extends StatelessWidget {
  final GamingModel orderList;

  OrderListComponent({required this.orderList});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        OrderDetailScreen(orderDetailData: orderList).launch(context);
      },
      child: Column(
        children: [
          Row(
            children: [
              // commonCachedNetworkImage(delivered, width: 18, height: 18, fit: BoxFit.fill),
              Icon(Icons.local_shipping, color: accentColor, size: 20),
              8.width,
              Text(orderList.earned.validate(), style: primaryTextStyle(size: 18)),
            ],
          ),
          16.height,
          Container(
            color: editTextBackgroundColor,
            padding: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GradientBorder(
                  gradient: LinearGradient(colors: [redColor, blackColor, accentColor]),
                  borderRadius: 0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(color: primaryColor, height: 90, width: 90),
                      commonCachedNetworkImage(orderList.gameImage.validate(), fit: BoxFit.cover, width: 80, height: 80, radius: 0),
                    ],
                  ),
                ),
                24.width,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(orderList.drawerItemName.validate(), style: boldTextStyle(size: 18)),
                        16.height,
                        Row(
                          children: [
                            Text("Colour: ", style: secondaryTextStyle()),
                            Text(orderList.mainPrice.validate(), style: secondaryTextStyle()),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded, size: 18, color: accentColor),
                  ],
                ).expand()
              ],
            ),
          ),
          8.height,
          Container(
            color: editTextBackgroundColor,
            padding: EdgeInsets.all(8),
            width: context.width(),
            child: Text(orderList.title.validate(), style: secondaryTextStyle()),
          ),
          8.height,
          Container(
            color: editTextBackgroundColor,
            padding: EdgeInsets.all(8),
            width: context.width(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingBar(
                  initialRating: orderList.rating.validate(),
                  itemSize: 16,
                  unratedColor: white,
                  allowHalfRating: false,
                  ignoreGestures: true,
                  direction: Axis.horizontal,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) {
                    return Icon(Icons.star_border, color: accentColor);
                  },
                  onRatingUpdate: (rating) {
                    //
                  },
                ),
                Row(
                  children: [
                    Text('TELL US MORE', style: boldTextStyle()),
                    4.width,
                    commonCachedNetworkImage(slash),
                    Text("/", style: boldTextStyle(color: redColor, size: 18)),
                  ],
                ),
              ],
            ),
          )
        ],
      ).paddingOnly(bottom: 16),
    );
  }
}
