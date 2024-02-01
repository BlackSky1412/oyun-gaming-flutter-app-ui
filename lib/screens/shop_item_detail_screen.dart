import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/my_cart_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/constant.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/flutter_rating_bar.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ShopItemDetailScreen extends StatefulWidget {
  final GamingModel? shopItemDetailList;

  ShopItemDetailScreen({this.shopItemDetailList});

  @override
  _ShopItemDetailScreenState createState() => _ShopItemDetailScreenState();
}

class _ShopItemDetailScreenState extends State<ShopItemDetailScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<GamingModel> ratingProgressList = getRatingProgressList();

  TextEditingController emailController = TextEditingController();

  bool favorite = false;
  var sortByItems = ['Most Recent', 'Now'];
  String sortByValue = 'Most Recent';

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
      key: scaffoldKey,
      backgroundColor: primaryColor,
      appBar: commonAppBar(context, callBack: () {
        scaffoldKey.currentState!.openDrawer();
      }),
      drawer: DrawerComponent(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(color: editTextBackgroundColor, height: 420),
                commonCachedNetworkImage(widget.shopItemDetailList!.gameImage, fit: BoxFit.cover, height: 220, width: 220).paddingTop(42),
                Positioned(
                  bottom: 16,
                  child: HorizontalList(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    wrapAlignment: WrapAlignment.center,
                    itemCount: widget.shopItemDetailList!.productImage!.length,
                    itemBuilder: (_, index) {
                      return GradientBorder(
                        gradient: commonGradientWidget(),
                        strokeWidth: strokeWidth,
                        borderRadius: 0,
                        child: commonCachedNetworkImage(widget.shopItemDetailList!.productImage![index], fit: BoxFit.cover, width: 50, height: 50, radius: 0),
                      );
                    },
                  ),
                ),
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.shopItemDetailList!.drawerItemName.validate(), style: boldTextStyle(color: white, size: 20)),
                RatingBar(
                  initialRating: widget.shopItemDetailList!.rating.validate(),
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
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.shopItemDetailList!.mainPrice.validate(),
                          style: secondaryTextStyle(size: 16, decoration: TextDecoration.lineThrough),
                        ),
                        16.width,
                        Text(widget.shopItemDetailList!.title.validate(), style: primaryTextStyle(size: 18)),
                      ],
                    ),
                    8.height,
                    Text("Inclusive Of All Taxes", style: secondaryTextStyle(size: 12)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Choose Color', style: primaryTextStyle(color: white.withOpacity(0.7))),
                    8.height,
                    Row(
                      children: [
                        Container(decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: redColor.withOpacity(0.7)), height: 12, width: 12),
                        8.width,
                        Container(decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: accentColor.withOpacity(0.7)), height: 12, width: 12),
                      ],
                    ),
                  ],
                )
              ],
            ),
            16.height,
            Container(
              color: editTextBackgroundColor,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      commonCachedNetworkImage(planeIcon, height: 28, width: 28, fit: BoxFit.cover),
                      16.width,
                      Text("Free Shipping", style: primaryTextStyle()),
                    ],
                  ),
                  16.height,
                  Row(
                    children: [
                      commonCachedNetworkImage(badgeIcon, height: 28, width: 28, fit: BoxFit.cover),
                      16.width,
                      Text("Premium Quality", style: primaryTextStyle()),
                    ],
                  ),
                  16.height,
                  Row(
                    children: [
                      commonCachedNetworkImage(smileIcon, height: 28, width: 28, fit: BoxFit.cover),
                      16.width,
                      Text("15 day Return & Exchange", style: primaryTextStyle()),
                    ],
                  ),
                ],
              ),
            ),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appButtonGradientBorderWidget(
                  gradientWidget: AppButton(
                    onTap: () {
                      MyCartScreen().launch(context);
                    },
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    color: white,
                    child: Text("ADD TO CART", style: boldTextStyle(color: black)),
                  ),
                ),
                GradientBorder(
                  gradient: commonGradientWidget(),
                  padding: 8,
                  child: Icon(favorite ? Icons.favorite_outlined : Icons.favorite_border, color: accentColor),
                  borderRadius: 0,
                ).onTap(() {
                  setState(() {
                    favorite = !favorite;
                  });
                })
              ],
            ),
            42.height,
            Text("Description", style: boldTextStyle(size: 20)),
            16.height,
            Text(
              "Eu laoreet nunc turpis accumsan in eget molestie morbi. Sem at odio risus enim. Ultricies pulvinar morbi sit a et.",
              style: secondaryTextStyle(color: white.withOpacity(0.6)),
            ),
            16.height,
            Row(
              children: [
                RatingBar(
                  initialRating: widget.shopItemDetailList!.rating.validate(),
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
                8.width,
                Text("4 (23 Reviews)", style: primaryTextStyle(color: white.withOpacity(0.7))),
              ],
            ),
            16.height,
            Text("10 Out Of 15 (95%) Review Recommend This Product", style: secondaryTextStyle(size: 12)),
            16.height,
            Divider(color: context.dividerColor),
            16.height,
            AppTextField(
              controller: emailController,
              textFieldType: TextFieldType.EMAIL,
              decoration: gamingInputDecoration(hintText: "Search", suffixIcon: Icon(Icons.search, color: white)),
              textStyle: TextStyle(color: white),
            ),
            16.height,
            Divider(color: context.dividerColor),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("WRITE A REVIEW", style: primaryTextStyle()),
                8.width,
                commonCachedNetworkImage(slash),
                Text("/", style: boldTextStyle(color: redColor, size: 20)),
              ],
            ),
            24.height,
            Text("Reviews", style: boldTextStyle(size: 20, color: white)),
            16.height,
            Text("Customer Reviews", style: primaryTextStyle(size: 18)),
            24.height,
            ListView.builder(
              itemCount: ratingProgressList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                GamingModel data = ratingProgressList[index];
                return Row(
                  children: [
                    Text(data.gameImage.validate(), style: primaryTextStyle(color: white)),
                    8.width,
                    Icon(Icons.star_border, color: accentColor, size: 16),
                    8.width,
                    StepProgressIndicator(
                      totalSteps: 100,
                      currentStep: data.ratingProgress.validate(),
                      size: 7,
                      padding: 0,
                      selectedColor: accentColor,
                      unselectedColor: unselectedIndicatorColor,
                    ).expand(),
                    8.width,
                    Text(data.title.validate(), style: primaryTextStyle(color: white)),
                  ],
                );
              },
            ),
            16.height,
            Text("Average Customer Ratings", style: boldTextStyle(color: white, size: 18)),
            32.height,
            Row(
              children: [
                Text("Overall", style: primaryTextStyle()),
                16.width,
                RatingBar(
                  initialRating: widget.shopItemDetailList!.rating.validate(),
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
                8.width,
                Text(
                  widget.shopItemDetailList!.rating.validate().toString(),
                  style: primaryTextStyle(color: white.withOpacity(0.7)),
                ),
              ],
            ),
            16.height,
            Text("1 - 10 Of 23 Review", style: primaryTextStyle(color: white, size: 18)),
            16.height,
            Row(
              children: [
                Text("Sort By:", style: primaryTextStyle(color: white.withOpacity(0.7))),
                16.width,
                DropdownButtonFormField(
                  isExpanded: true,
                  decoration: InputDecoration(
                    fillColor: editTextBackgroundColor,
                    filled: true,
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  ),
                  value: sortByValue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: sortByItems.map((String jobTitleItems) {
                    return DropdownMenuItem(value: jobTitleItems, child: Text(jobTitleItems, style: primaryTextStyle()));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      sortByValue = newValue!;
                    });
                  },
                ).expand(),
              ],
            ),
            16.height,
            Divider(color: white.withOpacity(0.7)),
            16.height,
            Text("Jamie Loy", style: primaryTextStyle()),
            16.height,
            Text("Review In USA On May 19th 2022", style: secondaryTextStyle()),
            16.height,
            RatingBar(
              initialRating: widget.shopItemDetailList!.rating.validate(),
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
            16.height,
            Text("Great Product", style: primaryTextStyle(color: white)),
            16.height,
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sodales dolor vel turpis lectus pellentesque.", style: secondaryTextStyle(color: white.withOpacity(0.7))),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
