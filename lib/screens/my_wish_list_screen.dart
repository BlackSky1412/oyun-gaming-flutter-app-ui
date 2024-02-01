import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/components/wish_list_component.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class MyWishListScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final List<GamingModel> wishListList = getWishListList();

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
            commonRichText(title: "My ", subTitle: "Wishlist", textSize: 20),
            8.height,
            ListView.builder(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
              itemCount: wishListList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                GamingModel data = wishListList[index];
                return WishlistComponent(wishListList: data);
              },
            ),
          ],
        ),
      ),
    );
  }
}
