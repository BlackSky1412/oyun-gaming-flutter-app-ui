import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/components/return_product_check_list.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/return_process_screen2.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class ReturnProcessScreen1 extends StatefulWidget {
  final GamingModel returnProcessData;

  ReturnProcessScreen1({required this.returnProcessData});

  @override
  _ReturnProcessScreen1State createState() => _ReturnProcessScreen1State();
}

class _ReturnProcessScreen1State extends State<ReturnProcessScreen1> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<GamingModel> returnReasonData = getReturnReasonList();

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
            Row(
              children: [
                Icon(Icons.local_shipping, color: accentColor, size: 20),
                8.width,
                Text(widget.returnProcessData.earned.validate(), style: primaryTextStyle(size: 18)),
              ],
            ),
            16.height,
            productWidget(
              productImage: widget.returnProcessData.gameImage.validate(),
              productName: widget.returnProcessData.drawerItemName.validate(),
              productColor: widget.returnProcessData.mainPrice.validate(),
              productRating: widget.returnProcessData.rating.validate(),
            ),
            8.height,
            Container(
              color: editTextBackgroundColor,
              padding: EdgeInsets.all(16),
              width: context.width(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Why Are You Returning This?", style: boldTextStyle(color: white, size: 18)),
                  16.height,
                  ReturnProductCheckList(returnReasonData11: returnReasonData),
                  16.height,
                  TextButton(
                    onPressed: () {
                      finish(context);
                      ReturnProcessScreen2(returnProcessData2: widget.returnProcessData).launch(context);
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
