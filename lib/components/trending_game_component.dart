import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/constant.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TrendingGameComponent extends StatefulWidget {
  @override
  _TrendingGameComponentState createState() => _TrendingGameComponentState();
}

class _TrendingGameComponentState extends State<TrendingGameComponent> {
  List<GamingModel> treandingGameList = getTreandingGameList();

  int currentIndexPage = 100 ~/ 3;
  int pageLength = 1;
  PageController pageController = PageController();

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
    return Column(
      children: [
        24.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            commonRichText(title: "Trending  ", subTitle: "On Oyun", textSize: 18).paddingOnly(left: 16),
            Row(
              children: [
                Text("0$pageLength", style: secondaryTextStyle()),
                8.width,
                StepProgressIndicator(
                  totalSteps: 100,
                  currentStep: currentIndexPage,
                  size: 2,
                  padding: 0,
                  roundedEdges: Radius.circular(0),
                  selectedColor: progressIndicatorColor,
                  unselectedColor: unselectedIndicatorColor,
                ),
                8.width,
                Text("03", style: secondaryTextStyle()),
              ],
            ).paddingOnly(right: 16),
          ],
        ),
        24.height,
        Container(
          height: 150,
          child: PageView.builder(
            itemCount: treandingGameList.length,
            controller: pageController,
            scrollDirection: Axis.horizontal,
            reverse: false,
            itemBuilder: (BuildContext context, int index) {
              GamingModel data = treandingGameList[index];
              return Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  GradientBorder(
                    gradient: commonGradientWidget(),
                    borderRadius: 0.0,
                    strokeWidth: strokeWidth,
                    child: commonCachedNetworkImage(
                      data.gameImage.validate(),
                      fit: BoxFit.cover,
                      height: 150,
                      width: context.width(),
                      radius: 0.0,
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Text(data.mainPrice.validate(), style: boldTextStyle(size: 18, color: white)),
                  ),
                ],
              ).paddingSymmetric(horizontal: 16);
            },
            onPageChanged: (value) {
              setState(() {
                pageLength = value + 1;
                if (pageLength == 1) {
                  currentIndexPage = 33;
                } else if (pageLength == 2) {
                  currentIndexPage = 66;
                } else if (pageLength == 3) {
                  currentIndexPage = 100;
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
