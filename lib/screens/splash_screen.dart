import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/screens/walkthroughListScreen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    setStatusBarColor(Colors.transparent);
    await 2.seconds.delay.then((value) {
      WalkthroughListScreen().launch(context, isNewTask: true);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            children: [
              commonCachedNetworkImage(logo, fit: BoxFit.cover).center(),
              Text('Oyun', style: boldTextStyle(color: accentColor, size: 32)).center().paddingOnly(top: 150),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 54,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Let The Games Begin", style: boldTextStyle(color: white)),
                8.width,
                commonCachedNetworkImage(slash),
                Text("/", style: boldTextStyle(color: redColor, size: 18)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
