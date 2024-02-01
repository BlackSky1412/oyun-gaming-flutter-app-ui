import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/return_process_screen1.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class ReturnAndCancelDetailScreen extends StatelessWidget {
  final GamingModel cancellationListData;

  ReturnAndCancelDetailScreen({required this.cancellationListData});

  @override
  Widget build(BuildContext context) {
    var scaffoldKey;
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
            productWidget(
              productImage: cancellationListData.gameImage.validate(),
              productName: cancellationListData.drawerItemName.validate(),
              productColor: cancellationListData.mainPrice.validate(),
              productRating: cancellationListData.rating.validate(),
            ),
            8.height,
            Container(
              color: editTextBackgroundColor,
              padding: EdgeInsets.all(16),
              width: context.width(),
              child: Text("Return Received, Refund Processed", style: primaryTextStyle(color: white.withOpacity(0.7))),
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
                      Text(cancellationListData.rank.validate(), style: primaryTextStyle()),
                      Text(cancellationListData.day.validate(), style: primaryTextStyle()),
                    ],
                  ),
                  16.height,
                  Text("2118 Thornridge Cir. Syracuse, Connecticut 35624", style: secondaryTextStyle()),
                ],
              ),
            ),
            8.height,
            Container(
              color: editTextBackgroundColor,
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
              width: context.width(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Item Price", style: boldTextStyle(size: 18)),
                      Text("\$ ${cancellationListData.ratingProgress.validate()}", style: boldTextStyle(color: white, size: 18)),
                    ],
                  ),
                  16.height,
                  Text("Paid By Paypal Ending **${cancellationListData.email.validate()}", style: primaryTextStyle(color: white.withOpacity(0.7))),
                  16.height,
                  TextButton(
                    onPressed: () {
                      finish(context);
                      ReturnProcessScreen1(returnProcessData: cancellationListData).launch(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("CONTINUE", style: boldTextStyle(color: white, size: 18)),
                        8.width,
                        commonCachedNetworkImage(slash),
                        Text("/", style: boldTextStyle(color: redColor, size: 20)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
