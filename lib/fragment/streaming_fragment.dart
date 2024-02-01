import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/purchase_more_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/constant.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class StreamingFragment extends StatefulWidget {
  @override
  _StreamingFragmentState createState() => _StreamingFragmentState();
}

class _StreamingFragmentState extends State<StreamingFragment> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<GamingModel> steamingList = getSteamingList();

  TabController? controller;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      key: scaffoldKey,
      drawer: DrawerComponent(),
      appBar: commonAppBar(context, callBack: () {
        scaffoldKey.currentState!.openDrawer();
      }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                commonCachedNetworkImage(walkthrough1Game1, fit: BoxFit.cover, height: 250, width: context.width(), radius: 0).paddingAll(16),
                Positioned(
                  right: 32,
                  top: 24,
                  child: Row(
                    children: [
                      Container(
                        decoration: boxDecorationWithRoundedCorners(
                          boxShape: BoxShape.circle,
                          backgroundColor: progressIndicatorColor,
                        ),
                        width: 10,
                        height: 10,
                      ),
                      8.width,
                      Text("LIVE", style: secondaryTextStyle()),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 32,
                  left: 32,
                  child: GradientBorder(
                    gradient: commonGradientWidget(),
                    borderRadius: 0,
                    strokeWidth: 0.6,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          width: context.width() * 0.7,
                          height: 120.0,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(color: Colors.grey.shade200.withOpacity(0.3)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('3.6K Spectators', style: boldTextStyle(color: white, size: 18)),
                                  Row(
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          commonCachedNetworkImage(userImage, fit: BoxFit.cover, radius: 15, height: 30, width: 30),
                                          Positioned(right: 16, child: commonCachedNetworkImage(userImage, fit: BoxFit.cover, radius: 15, height: 30, width: 30)),
                                          Positioned(right: 16, child: commonCachedNetworkImage(userImage2, fit: BoxFit.cover, radius: 15, height: 30, width: 30)),
                                          Positioned(right: 32, child: commonCachedNetworkImage(userImage3, fit: BoxFit.cover, radius: 15, height: 30, width: 30)),
                                        ],
                                      ),
                                      8.width,
                                      Container(
                                        decoration: boxDecorationWithRoundedCorners(
                                          boxShape: BoxShape.circle,
                                          backgroundColor: editTextBackgroundColor,
                                          borderRadius: BorderRadius.all(Radius.circular(15)),
                                        ),
                                        padding: EdgeInsets.all(2),
                                        height: 30,
                                        width: 30,
                                        alignment: Alignment.center,
                                        child: Text("3.4 K", style: secondaryTextStyle(size: 11)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              8.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Join Your Friends", style: secondaryTextStyle()),
                                      8.height,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          commonCachedNetworkImage(discord, fit: BoxFit.cover, height: 20, width: 20),
                                          16.width,
                                          commonCachedNetworkImage(twitch, fit: BoxFit.cover, height: 20, width: 20),
                                          16.width,
                                          commonCachedNetworkImage(youtube, color: white, fit: BoxFit.cover, height: 20, width: 20),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("PLAY", style: boldTextStyle(color: white, size: 18)),
                                      4.width,
                                      commonCachedNetworkImage(slash),
                                      Text("/", style: boldTextStyle(color: redColor, size: 18)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            8.height,
            Text('Streaming', style: boldTextStyle(size: 20, color: white)).paddingOnly(left: 16),
            8.height,
            ListView.builder(
              padding: EdgeInsets.only(top: 24, left: 16, right: 16),
              itemCount: steamingList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                GamingModel data = steamingList[index];
                return Row(
                  children: [
                    GradientBorder(
                      gradient: LinearGradient(colors: [Colors.red, blackColor, blackColor, accentColor]),
                      borderRadius: 0,
                      strokeWidth: strokeWidth,
                      child: commonCachedNetworkImage(data.gameImage.validate(), fit: BoxFit.cover, width: 60, height: 60, radius: 0),
                    ),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.drawerItemName.validate(), style: boldTextStyle()),
                        8.height,
                        Text(data.title.validate(), style: secondaryTextStyle()),
                      ],
                    ).expand(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("PLAY", style: primaryTextStyle()),
                            4.width,
                            commonCachedNetworkImage(slash),
                            Text("/", style: boldTextStyle(color: redColor, size: 20)),
                          ],
                        ),
                        8.height,
                        Row(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                commonCachedNetworkImage(userImage, fit: BoxFit.cover, radius: 15, height: 30, width: 30),
                                Positioned(right: 16, child: commonCachedNetworkImage(userImage, fit: BoxFit.cover, radius: 15, height: 30, width: 30)),
                                Positioned(right: 16, child: commonCachedNetworkImage(userImage2, fit: BoxFit.cover, radius: 15, height: 30, width: 30)),
                                Positioned(right: 32, child: commonCachedNetworkImage(userImage3, fit: BoxFit.cover, radius: 15, height: 30, width: 30)),
                              ],
                            ),
                            8.width,
                            Container(
                              decoration: boxDecorationWithRoundedCorners(
                                boxShape: BoxShape.circle,
                                backgroundColor: editTextBackgroundColor,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              padding: EdgeInsets.all(2),
                              height: 30,
                              width: 30,
                              alignment: Alignment.center,
                              child: Text("${data.rating.validate()} K", style: secondaryTextStyle(size: 10)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ).onTap(() {
                  PurchaseMoreScreen().launch(context);
                }).paddingOnly(bottom: 16);
              },
            ),
          ],
        ),
      ),
    );
  }
}
