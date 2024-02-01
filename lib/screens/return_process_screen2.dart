import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/return_process_screen3.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class ReturnProcessScreen2 extends StatefulWidget {
  final GamingModel returnProcessData2;

  ReturnProcessScreen2({required this.returnProcessData2});

  @override
  _ReturnProcessScreen1State createState() => _ReturnProcessScreen1State();
}

class _ReturnProcessScreen1State extends State<ReturnProcessScreen2> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<GamingModel> returnReasonData = getReturnReasonList();

  final TextEditingController addressController = TextEditingController();

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
              productImage: widget.returnProcessData2.gameImage.validate(),
              productName: widget.returnProcessData2.drawerItemName.validate(),
              productColor: widget.returnProcessData2.mainPrice.validate(),
              productRating: widget.returnProcessData2.rating.validate(),
            ),
            8.height,
            Container(
              color: editTextBackgroundColor,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Why Are You Returning This?", style: boldTextStyle(size: 18)),
                  8.height,
                  Text("Brought By Mistake", style: secondaryTextStyle(color: white.withOpacity(0.7))),
                  16.height,
                  AppTextField(
                    controller: addressController,
                    textFieldType: TextFieldType.MULTILINE,
                    maxLines: 5,
                    minLines: 2,
                    decoration: gamingInputDecoration(hintText: "Write In Detail About Issue...", fillColor: primaryColor),
                    textStyle: TextStyle(color: white),
                    suffixIconColor: white,
                  ),
                  16.height,
                  TextButton(
                    onPressed: () {
                      finish(context);
                      ReturnProcessScreen3(returnProcessData3: widget.returnProcessData2).launch(context);
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
