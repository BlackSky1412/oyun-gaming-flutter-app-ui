import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class WalkThrough1 extends StatefulWidget {
  const WalkThrough1({Key? key}) : super(key: key);

  @override
  _WalkThrough1State createState() => _WalkThrough1State();
}

class _WalkThrough1State extends State<WalkThrough1> {
  List<GamingModel> getImageList = getWalkthrough1Game();

  int _currentIndex = 1;

  final _pageViewController = PageController(initialPage: 1, viewportFraction: 0.5);

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    setStatusBarColor(Colors.transparent);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          commonCachedNetworkImage(
            walkthrough1Background,
            height: context.height(),
            width: context.width(),
            fit: BoxFit.fill,
            radius: 0.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 220,
                child: PageView.builder(
                  controller: _pageViewController,
                  itemCount: getImageList.length,
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    GamingModel data = getImageList[index];
                    var _scale = _currentIndex == index ? 1.0 : 0.8;
                    return TweenAnimationBuilder(
                      tween: Tween(begin: _scale, end: _scale),
                      duration: Duration(milliseconds: 350),
                      child: commonCachedNetworkImage(data.gameImage.validate(), fit: BoxFit.cover, radius: 0),
                      builder: (context, double value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      },
                    );
                  },
                ),
              ),
              32.height,
              commonRichText(
                title: "Exciting Game",
                subTitle: " & New Arenas To Explore To Win Case Prizes",
                textSize: 18,
                textHeight: 1.7,
              ).paddingOnly(left: 16, right: 16, top: 24, bottom: 16),
              Text(
                'Lorem IPsum Dolor Sit Amet, Consectetur Adipiscing Elit. Ac Feugiat Porttitor.',
                textAlign: TextAlign.center,
                style: primaryTextStyle(color: white.withOpacity(0.7), height: 1.6),
              ).paddingOnly(left: 16, right: 16, top: 8, bottom: 16)
            ],
          ),
        ],
      ),
    );
  }
}
