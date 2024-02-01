import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/screens/walk_through1_screen.dart';
import 'package:oyun_gaming_flutter/screens/walk_through2_screen.dart';
import 'package:oyun_gaming_flutter/screens/walk_through3_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class WalkthroughListScreen extends StatefulWidget {
  @override
  _WalkthroughListScreenState createState() => _WalkthroughListScreenState();
}

class _WalkthroughListScreenState extends State<WalkthroughListScreen> {
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
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: PageView(
              controller: pageController,
              reverse: false,
              children: [
                WalkThrough1(),
                WalkThrough2(
                  onChange: () {
                    pageController.animateToPage(pageLength, duration: 250.milliseconds, curve: Curves.linear);
                  },
                ),
                WalkThrough3(),
              ],
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
          Positioned(
            bottom: 24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("0$pageLength", style: boldTextStyle(color: accentColor)),
                8.width,
                StepProgressIndicator(
                  totalSteps: 100,
                  currentStep: currentIndexPage,
                  size: 4,
                  padding: 0,
                  roundedEdges: Radius.circular(0),
                  selectedColor: progressIndicatorColor,
                  unselectedColor: unselectedIndicatorColor,
                ),
                8.width,
                Text("03", style: boldTextStyle(color: accentColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
