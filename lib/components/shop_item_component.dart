import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/shop_item_detail_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/flutter_rating_bar.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class ShopItemComponent extends StatelessWidget {
  final GamingModel? shopItemList;

  ShopItemComponent({this.shopItemList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: shopBgColor,
      padding: EdgeInsets.only(bottom: 8),
      width: context.width() * 0.5 - 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: editTextBackgroundColor,
                height: 200,
                width: context.width() * 0.5 - 20,
              ),
              commonCachedNetworkImage(shopItemList!.gameImage.validate(), fit: BoxFit.cover, height: 100, width: 100, radius: 0)
            ],
          ),
          16.height,
          Text(shopItemList!.drawerItemName.validate(), style: boldTextStyle(color: white.withOpacity(0.9))).paddingOnly(left: 8),
          16.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(shopItemList!.title.validate(), style: boldTextStyle(color: white.withOpacity(0.7))),
              16.width,
              RatingBar(
                initialRating: shopItemList!.rating.validate(),
                itemSize: 10,
                unratedColor: white,
                allowHalfRating: false,
                tapOnlyMode: true,
                ignoreGestures: true,
                direction: Axis.horizontal,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) {
                  return Icon(Icons.star_border, color: accentColor);
                },
                onRatingUpdate: (rating) {
                  //
                },
              ).paddingBottom(4),
            ],
          ).paddingOnly(left: 8)
        ],
      ),
    ).onTap(() {
      ShopItemDetailScreen(shopItemDetailList: shopItemList).launch(context);
    });
  }
}
