import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class OrderReviewScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController addressController = TextEditingController();

  final GamingModel orderReviewData;

  OrderReviewScreen({required this.orderReviewData});

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
            productWidget(
              productImage: orderReviewData.gameImage.validate(),
              productName: orderReviewData.drawerItemName.validate(),
              productColor: orderReviewData.mainPrice.validate(),
              productRating: orderReviewData.rating.validate(),
            ),
            8.height,
            Container(
              color: editTextBackgroundColor,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Write Your Review", style: boldTextStyle(size: 18)),
                  16.height,
                  AppTextField(
                    controller: addressController,
                    textFieldType: TextFieldType.MULTILINE,
                    maxLines: 5,
                    minLines: 2,
                    decoration: gamingInputDecoration(hintText: "Please Write About Product Here...", fillColor: primaryColor),
                    textStyle: TextStyle(color: white),
                    suffixIconColor: white,
                  ),
                  16.height,
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'By Submitting Review You Give Us Content To Publish Personal Information With', style: secondaryTextStyle(height: 1.5)),
                        TextSpan(text: ' Terms Of Use', style: secondaryTextStyle(color: accentColor)),
                        TextSpan(text: ' And', style: secondaryTextStyle(color: white)),
                        TextSpan(text: ' Privacy Policy', style: secondaryTextStyle(color: accentColor)),
                      ],
                    ),
                  ),
                  16.height,
                  TextButton(
                    onPressed: () {
                      toast("Add Review SuccessFully");
                      finish(context);
                      finish(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SUBMIT", style: boldTextStyle(color: white, size: 18)),
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
        ),
      ),
    );
  }
}
