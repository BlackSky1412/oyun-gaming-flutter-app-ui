import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/utils/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class PurchaseMoreScreen extends StatelessWidget {
  final bool? enableAppbar;

  PurchaseMoreScreen({this.enableAppbar = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.black,
        body: Stack(
          children: [
            Icon(Icons.arrow_back, size: 24).paddingAll(16).onTap(() {
              finish(context);
            }).visible(enableAppbar!),
            SizedBox(
              width: context.width(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: boxDecorationDefault(color: Colors.black),
                    padding: EdgeInsets.all(16),
                    child: Image.asset("images/oyunGaming/logo.png", height: 100),
                  ),
                  22.height,
                  Text(
                    'This is the lite version of the $applicationName App',
                    style: boldTextStyle(size: 22),
                    textAlign: TextAlign.center,
                  ),
                  16.height,
                  AppButton(
                    text: 'Purchase for more screen',
                    color: context.scaffoldBackgroundColor,
                    textStyle: boldTextStyle(color: Colors.white),
                    shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
                    onTap: () {
                      launchUrl(Uri.parse('https://codecanyon.net/item/oyun-gaming-flutter-30-app-ui/38689912?s_rank=3'));
                    },
                  )
                ],
              ),
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
