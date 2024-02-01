import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/return_and_cancel_detaile_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/flutter_rating_bar.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class ReturnAndCancelListScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final List<GamingModel> cancellationList = geOrderList();

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
            24.height,
            ListView.builder(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
              itemCount: cancellationList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                GamingModel data = cancellationList[index];
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
                            commonCachedNetworkImage(data.gameImage.validate(), fit: BoxFit.cover, width: 100, height: 100, radius: 0),
                          ],
                        ),
                      ),
                      24.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          8.height,
                          Text(
                            data.drawerItemName.validate(),
                            style: boldTextStyle(size: 18),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          8.height,
                          Row(
                            children: [
                              Text("Color: ", style: secondaryTextStyle()),
                              Text(data.mainPrice.validate(), style: secondaryTextStyle()),
                            ],
                          ),
                          8.height,
                          RatingBar(
                            initialRating: data.rating.validate(),
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
                          8.height,
                          Row(
                            children: [
                              Text("RETURN OR CANCEL", style: boldTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis).flexible(),
                              8.width,
                              commonCachedNetworkImage(slash),
                              Text("/", style: boldTextStyle(color: redColor, size: 20)),
                            ],
                          )
                        ],
                      ).expand()
                    ],
                  ),
                ).onTap(() {
                  finish(context);
                  ReturnAndCancelDetailScreen(cancellationListData: data).launch(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
