import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/order_review_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class OrderDetailScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final GamingModel orderDetailData;

  OrderDetailScreen({required this.orderDetailData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: primaryColor,
      appBar: commonAppBar(context, callBack: () {
        scaffoldKey.currentState!.openDrawer();
      }),
      drawer: DrawerComponent(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.local_shipping, color: accentColor, size: 20),
                8.width,
                Text(orderDetailData.earned.validate(), style: primaryTextStyle(size: 18)),
              ],
            ),
            16.height,
            productWidget(
              productImage: orderDetailData.gameImage.validate(),
              productName: orderDetailData.drawerItemName.validate(),
              productColor: orderDetailData.mainPrice.validate(),
              productRating: orderDetailData.rating.validate(),
            ).onTap(() {
              OrderReviewScreen(orderReviewData: orderDetailData).launch(context);
            }),
            8.height,
            Container(
              color: editTextBackgroundColor,
              padding: EdgeInsets.all(16),
              width: context.width(),
              child: Text(orderDetailData.title.validate(), style: secondaryTextStyle()),
            ),
            8.height,
            Container(
              color: editTextBackgroundColor,
              padding: EdgeInsets.all(16),
              width: context.width(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Delivery Address", style: boldTextStyle(size: 18)),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(orderDetailData.rank.validate(), style: primaryTextStyle()),
                      Text(orderDetailData.day.validate(), style: primaryTextStyle()),
                    ],
                  ),
                  16.height,
                  Text(orderDetailData.time.validate(), style: secondaryTextStyle()),
                ],
              ),
            ),
            8.height,
            Container(
              color: editTextBackgroundColor,
              padding: EdgeInsets.all(16),
              width: context.width(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Item Price", style: boldTextStyle(size: 18)),
                      Text("\$ ${orderDetailData.ratingProgress.validate()}", style: boldTextStyle(size: 18)),
                    ],
                  ),
                  16.height,
                  Text("Paid By Paypal Ending **${orderDetailData.email.validate()}", style: secondaryTextStyle()),
                ],
              ),
            ),
            8.height,
            Container(
              color: editTextBackgroundColor,
              padding: EdgeInsets.all(16),
              width: context.width(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Need Help ?", style: boldTextStyle(size: 18)),
                  24.height,
                  Text("Contact Seller", style: secondaryTextStyle()),
                  16.height,
                  Text("Return Or Replace Items", style: secondaryTextStyle()),
                ],
              ),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
