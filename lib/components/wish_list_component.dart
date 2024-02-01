import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/my_cart_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/flutter_rating_bar.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class WishlistComponent extends StatelessWidget {
  final GamingModel wishListList;

  WishlistComponent({required this.wishListList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: editTextBackgroundColor,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GradientBorder(
            gradient: LinearGradient(colors: [redColor, blackColor, accentColor]),
            borderRadius: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(color: primaryColor, height: 110, width: 110),
                commonCachedNetworkImage(wishListList.gameImage.validate(), fit: BoxFit.cover, width: 100, height: 100, radius: 0),
              ],
            ),
          ),
          24.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              16.height,
              Text(wishListList.drawerItemName.validate(), style: boldTextStyle(color: white, size: 18)),
              16.height,
              Row(
                children: [
                  Text(wishListList.mainPrice.validate(), style: primaryTextStyle()),
                  16.width,
                  RatingBar(
                    initialRating: wishListList.rating.validate(),
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
                  ).paddingBottom(4),
                ],
              ),
              16.height,
              Row(
                children: [
                  Text("ADD TO CART", style: primaryTextStyle()),
                  8.width,
                  commonCachedNetworkImage(slash),
                  Text("/", style: boldTextStyle(color: redColor, size: 20)),
                ],
              ).onTap(() {
                MyCartScreen().launch(context);
              })
            ],
          )
        ],
      ),
    );
  }
}
