import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/components/return_product_check_list.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/return_process_screen4.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class ReturnProcessScreen3 extends StatefulWidget {
  final GamingModel returnProcessData3;

  ReturnProcessScreen3({required this.returnProcessData3});

  @override
  _ReturnProcessScreen3State createState() => _ReturnProcessScreen3State();
}

class _ReturnProcessScreen3State extends State<ReturnProcessScreen3> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<GamingModel> returnRightReasonData = getReturnRightReasonList();

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
        child: Column(
          children: [
            16.height,
            productWidget(
              productImage: widget.returnProcessData3.gameImage.validate(),
              productName: widget.returnProcessData3.drawerItemName.validate(),
              productColor: widget.returnProcessData3.mainPrice.validate(),
              productRating: widget.returnProcessData3.rating.validate(),
            ),
            8.height,
            Container(
              color: editTextBackgroundColor,
              padding: EdgeInsets.all(16),
              width: context.width(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Why Are You Returning This", style: boldTextStyle(color: white, size: 18)),
                  8.height,
                  Text("Brought By Mistake", style: secondaryTextStyle(color: white.withOpacity(0.7))),
                ],
              ),
            ),
            8.height,
            Container(
              color: editTextBackgroundColor,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("How Can We Make It Right ?", style: boldTextStyle(color: white, size: 18)),
                  16.height,
                  ReturnProductCheckList(returnReasonData11: returnRightReasonData),
                  TextButton(
                    onPressed: () {
                      finish(context);
                      ReturnProcessScreen4(returnProcessData4: widget.returnProcessData3).launch(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("CONTINUE", style: boldTextStyle(color: white, size: 18)),
                        8.width,
                        commonCachedNetworkImage(slash),
                        Text("/", style: boldTextStyle(color: redColor, size: 20)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ).paddingAll(16),
      ),
    );
  }
}
