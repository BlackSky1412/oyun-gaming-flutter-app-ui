import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/components/order_list_component.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/purchase_more_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class OrderListScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: primaryColor,
      appBar: commonAppBar(context, callBack: () {
        scaffoldKey.currentState!.openDrawer();
      }),
      drawer: DrawerComponent(),
      body:PurchaseMoreScreen(),
    );
  }
}
