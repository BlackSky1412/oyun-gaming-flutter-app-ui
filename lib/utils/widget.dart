import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/screens/my_cart_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/constant.dart';
import 'package:oyun_gaming_flutter/utils/flutter_rating_bar.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';

Widget commonCachedNetworkImage(
  String? url, {
  double? height,
  double? width,
  BoxFit? fit,
  AlignmentGeometry? alignment,
  bool usePlaceholderIfUrlEmpty = true,
  double? radius,
  Color? color,
}) {
  if (url!.validate().isEmpty) {
    return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
    );
  } else {
    return Image.asset(url, height: height, width: width, fit: fit, color: color, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset('images/app/og_placeholder.jpg', height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

PreferredSizeWidget gamingAppBarWidget(BuildContext context) {
  return appBarWidget(
    "",
    color: primaryColor,
    elevation: 0,
    backWidget: Padding(
      padding: EdgeInsets.only(left: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          commonCachedNetworkImage(slashRed, fit: BoxFit.cover, height: 84),
          16.width,
          Text("BACK", style: boldTextStyle(color: white, size: 44)),
        ],
      ).onTap(() {
        finish(context);
      }).fit(),
    ),
  );
}

InputDecoration gamingInputDecoration({String? hintText, Widget? suffixIcon, Color? fillColor}) {
  return InputDecoration(
    hintText: hintText,
    border: InputBorder.none,
    hintStyle: secondaryTextStyle(),
    filled: true,
    suffixIcon: suffixIcon,
    suffixIconColor: white,
    fillColor: fillColor ?? editTextBackgroundColor,
  );
}

final kInnerDecoration = BoxDecoration(
  color: primaryColor,
  border: Border.all(color: Colors.white),
  borderRadius: BorderRadius.circular(32),
);

final kGradientBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [Colors.red, accentColor],
  ),
  borderRadius: BorderRadius.circular(32),
);

Widget gradientBorderWidget({Widget? gradientWidget}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.red, accentColor],
      ),
    ),
    child: Padding(
        padding: EdgeInsets.all(1.5),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          color: primaryColor,
          child: gradientWidget,
        )),
  );
}

PreferredSizeWidget commonAppBar(BuildContext context, {Function? callBack}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(80.0),
    child: AppBar(
      backgroundColor: primaryColor,
      flexibleSpace: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 44,
            height: 56,
            alignment: Alignment.center,
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: accentColor, width: 6),
              backgroundColor: primaryColor,
              boxShadow: [
                BoxShadow(color: accentColor.withOpacity(0.5), spreadRadius: 6, blurRadius: 10),
                BoxShadow(color: accentColor.withOpacity(0.5), spreadRadius: -6, blurRadius: 5),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonCachedNetworkImage(slash, height: 16),
                Text("/", style: boldTextStyle(color: redColor, size: 16)),
              ],
            ),
          ),
        ],
      ).paddingTop(context.statusBarHeight + 10),
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          callBack!.call();
        },
        icon: Icon(Icons.menu, color: accentColor),
      ),
      centerTitle: true,
      actions: [
        Container(
          color: accentColor,
          width: 40,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          height: 10,
          child: Icon(Icons.shopping_bag_outlined, color: black),
        ).onTap(() {
          MyCartScreen().launch(context);
        }),
      ],
    ),
  );
}

Widget commonRichText({String? title, String? subTitle, int? textSize, double? textHeight, Color? titleTextColor, Color? subTitleTextColor, TextStyle? titleTextStyle, TextStyle? subTitleTextStyle}) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      text: title.validate(),
      style: titleTextStyle ?? boldTextStyle(color: titleTextColor ?? accentColor, size: textSize ?? 20, height: textHeight ?? 0, letterSpacing: 1.5),
      children: [
        TextSpan(
          text: subTitle.validate(),
          style: subTitleTextStyle ?? boldTextStyle(color: subTitleTextColor ?? white, size: textSize ?? 20, letterSpacing: 1.5),
        ),
      ],
    ),
  );
}

Gradient commonGradientWidget() {
  return LinearGradient(
    colors: [Colors.red, accentColor],
  );
}

Widget productWidget({String? productImage, String? productName, String? productColor, double? productRating}) {
  return Container(
    color: editTextBackgroundColor,
    padding: EdgeInsets.all(16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GradientBorder(
          gradient: LinearGradient(colors: [redColor, blackColor, accentColor]),
          borderRadius: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(color: primaryColor, height: 110, width: 110),
              commonCachedNetworkImage(productImage, fit: BoxFit.cover, width: 100, height: 100, radius: 0),
            ],
          ),
        ),
        24.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(productName.toString(), style: boldTextStyle(color: white, size: 18)),
            16.height,
            Row(
              children: [
                Text("Colour: ", style: secondaryTextStyle()),
                Text(productColor.toString(), style: secondaryTextStyle()),
              ],
            ),
            16.height,
            RatingBar(
              initialRating: productRating,
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
        ).expand()
      ],
    ),
  );
}

Widget TournamentScheduleWidget({String? title, String? subTitle, Color? titleColor}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title!, style: boldTextStyle(color: titleColor ?? white)),
      16.height,
      Text(subTitle!, style: boldTextStyle(color: white)),
    ],
  );
}

Widget upComingMatch(BuildContext context, {Color? ChampionBgColor, bool hideWithoutBlurWidget = false, bool hideWithBlurWidget = false, bool showImage = false}) {
  return Column(
    children: [
      Container(
        height: 350,
        width: 350,
        child: GradientBorder(
          gradient: LinearGradient(colors: [gray.withOpacity(0.2), redColor.withOpacity(0.4), accentColor.withOpacity(0.6)]),
          padding: 16,
          borderRadius: 190,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Ninja Zenith", style: boldTextStyle(color: white, size: 18)),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      commonCachedNetworkImage(eagleGame, height: 60, width: 60, fit: BoxFit.cover),
                      8.height,
                      Text('Eagle', style: primaryTextStyle(color: white, size: 14)),
                    ],
                  ),
                  24.width,
                  Row(
                    children: [
                      Text("V", style: boldTextStyle(color: white, size: 22)),
                      2.width,
                      commonCachedNetworkImage(slash),
                      2.width,
                      Text("S", style: boldTextStyle(color: white, size: 22)),
                    ],
                  ),
                  24.width,
                  Column(
                    children: [
                      commonCachedNetworkImage(sharkGame, height: 60, width: 60, fit: BoxFit.cover),
                      8.height,
                      Text('Shark', style: primaryTextStyle(color: white, size: 14)),
                    ],
                  ),
                ],
              ),
              24.height,
              Text("15 : 12", style: boldTextStyle(color: accentColor, size: 24)),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sat", style: secondaryTextStyle()),
                  8.width,
                  Container(height: 16, width: 1, color: accentColor),
                  8.width,
                  Text("Jan 22", style: secondaryTextStyle()),
                  8.width,
                  Container(height: 16, width: 1, color: accentColor),
                  8.width,
                  Text("12:30 PM AEDT", style: secondaryTextStyle()),
                ],
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Watch on:", style: secondaryTextStyle()),
                  16.width,
                  commonCachedNetworkImage(discord, fit: BoxFit.cover, height: 20, width: 20),
                  16.width,
                  commonCachedNetworkImage(youtube, fit: BoxFit.cover, height: 20, width: 20),
                  16.width,
                  commonCachedNetworkImage(twitch, fit: BoxFit.cover, height: 20, width: 20),
                ],
              )
            ],
          ),
        ),
      ),
      42.height,
      commonRichText(title: "Meet ", subTitle: "The Champion", textSize: 18),
      32.height,
      hideWithBlurWidget.validate()
          ? Stack(
              children: [
                commonCachedNetworkImage(tournamentImg, fit: BoxFit.cover, width: context.width(), height: 200, radius: 0).paddingSymmetric(horizontal: 16),
                Positioned(
                  bottom: 24,
                  left: 24,
                  child: GradientBorder(
                    gradient: LinearGradient(colors: [redColor, Colors.transparent, accentColor]),
                    borderRadius: 0.0,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                        child: Container(padding: EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.grey.shade100.withOpacity(0.3)), child: championNameWidget()),
                      ),
                    ),
                  ),
                )
              ],
            )
          : SizedBox(),
      showImage.validate() ? commonCachedNetworkImage(tournamentImg, fit: BoxFit.cover, width: context.width(), height: 200, radius: 0).paddingSymmetric(horizontal: 16) : SizedBox(),
      Container(
        color: ChampionBgColor ?? editTextBackgroundColor,
        width: context.width(),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hideWithoutBlurWidget.validate() ? championNameWidget() : SizedBox(),
            32.height,
            TournamentScheduleWidget(title: "Kills", subTitle: "21", titleColor: hideWithoutBlurWidget.validate() ? white : black),
            Divider(color: white.withOpacity(0.7), height: 24),
            TournamentScheduleWidget(title: "Gold%", subTitle: "40.23%", titleColor: hideWithoutBlurWidget.validate() ? white : black),
            Divider(color: white.withOpacity(0.7), height: 24),
            TournamentScheduleWidget(title: "Silver%", subTitle: "28.23%", titleColor: hideWithoutBlurWidget.validate() ? white : black),
            Divider(color: white.withOpacity(0.7), height: 24),
            TournamentScheduleWidget(title: "Bronze%", subTitle: "42.23%", titleColor: hideWithoutBlurWidget.validate() ? white : black),
            Divider(color: white.withOpacity(0.7), height: 24),
            TournamentScheduleWidget(title: "Scorecard", subTitle: "921", titleColor: hideWithoutBlurWidget.validate() ? white : black),
            16.height,
          ],
        ),
      ),
    ],
  );
}

Widget championNameWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Super League Champion', style: secondaryTextStyle(color: white.withOpacity(0.7))),
      16.height,
      Text('Martina Royce', style: boldTextStyle(size: 18)),
      16.height,
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          commonCachedNetworkImage(facebook, color: white, fit: BoxFit.cover, height: 20, width: 20),
          16.width,
          commonCachedNetworkImage(twitter, color: white, fit: BoxFit.cover, height: 20, width: 20),
          16.width,
          commonCachedNetworkImage(youtube, color: white, fit: BoxFit.cover, height: 20, width: 20),
          16.width,
          commonCachedNetworkImage(instagram, color: white, fit: BoxFit.cover, height: 18, width: 18),
        ],
      ),
    ],
  );
}

Widget appButtonGradientBorderWidget({required Widget gradientWidget}) {
  return GradientBorder(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        redColor,
        redColor.withOpacity(0.8),
        redColor.withOpacity(0.3),
        transparentColor,
        transparentColor,
        transparentColor,
        transparentColor,
        transparentColor,
        transparentColor,
        transparentColor,
        transparentColor,
        transparentColor,
        accentColor.withOpacity(0.3),
        accentColor.withOpacity(0.8),
        accentColor,
      ],
    ),
    borderRadius: 0,
    padding: 0,
    child: gradientWidget.paddingSymmetric(horizontal: 4),
    strokeWidth: 2,
  );
}

Widget commonGradientBorderWidget({required Widget child, double borderRadius = 0.0, double? strokeWidths}) {
  return GradientBorder(
    gradient: commonGradientWidget(),
    strokeWidth: strokeWidths ?? strokeWidth,
    borderRadius: borderRadius,
    child: child,
  );
}
