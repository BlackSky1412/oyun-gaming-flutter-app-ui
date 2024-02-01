import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/components/my_cart_component.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/checkout_screen.dart';
import 'package:oyun_gaming_flutter/screens/purchase_more_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class MyCartScreen extends StatefulWidget {
  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final List<GamingModel> cartList = geCartList();

  int? cartIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: primaryColor,
      appBar: commonAppBar(context, callBack: () {
        scaffoldKey.currentState!.openDrawer();
      }),
      drawer: DrawerComponent(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                24.height,
                commonRichText(title: "My ", subTitle: "Cart", textSize: 20),
                8.height,
                ListView.builder(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 90),
                  itemCount: cartList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    GamingModel data = cartList[index];

                    return MyCartComponent(
                        myCartList: data,
                        index: index,
                        onUpdate: (int val) {
                          cartIndex = val;
                          setState(() {});
                        });
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 24,
            right: 0,
            left: 0,
            child: appButtonGradientBorderWidget(
              gradientWidget: AppButton(
                color: white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text('CHECKOUT', style: boldTextStyle(color: black, size: 18), textAlign: TextAlign.center),
                onTap: () {
                  finish(context);
                  PurchaseMoreScreen().launch(context);
                },
              ),
            ).center(),
          ),
        ],
      ),
    );
  }
}
