import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/purchase_more_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class ReturnProcessScreen4 extends StatefulWidget {
  final GamingModel returnProcessData4;

  ReturnProcessScreen4({required this.returnProcessData4});

  @override
  _ReturnProcessScreen4State createState() => _ReturnProcessScreen4State();
}

class _ReturnProcessScreen4State extends State<ReturnProcessScreen4> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<GamingModel> refundProcess = geRefundProcessList();

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
        child: PurchaseMoreScreen().paddingAll(16),
      ),
    );
  }
}
