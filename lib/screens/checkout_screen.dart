import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

// ignore: must_be_immutable
class CheckOutScreen extends StatefulWidget {
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  String quantityValue = '1';

  List<String> quantityItem = ["1", "2", "3", "4", "5", "6"];

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
            Text("CheckOut", style: boldTextStyle(size: 20)),
            24.height,
            Container(
              color: editTextBackgroundColor,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientBorder(
                    gradient: LinearGradient(colors: [redColor, blackColor, accentColor]),
                    borderRadius: 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(color: primaryColor, height: 110, width: 110),
                        commonCachedNetworkImage(medicine, fit: BoxFit.cover, width: 100, height: 100, radius: 0),
                      ],
                    ),
                  ),
                  24.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      16.height,
                      Text("Oyun Mousepad", style: boldTextStyle(color: white, size: 18)),
                      16.height,
                      Row(
                        children: [
                          Text("Colour: ", style: secondaryTextStyle()),
                          Text('White', style: secondaryTextStyle()),
                        ],
                      ),
                      16.height,
                      Row(
                        children: [
                          Text("Quantity:", style: secondaryTextStyle()),
                          8.width,
                          Container(
                            decoration: boxDecorationWithRoundedCorners(backgroundColor: primaryColor, borderRadius: BorderRadius.zero),
                            height: 30,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: DropdownButton(
                              // isExpanded: true,
                              underline: Container(color: Colors.transparent),
                              value: quantityValue,
                              icon: Icon(Icons.keyboard_arrow_down, color: white.withOpacity(0.6), size: 16),
                              items: quantityItem.map((String jobTitleItems) {
                                return DropdownMenuItem(
                                  value: jobTitleItems,
                                  child: Text(jobTitleItems, style: secondaryTextStyle()),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  quantityValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: editTextBackgroundColor,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(16),
              width: context.width(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Delivery Address", style: boldTextStyle(size: 18)),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Kristin Watson", style: primaryTextStyle()),
                      Text("(217) 555-0113", style: primaryTextStyle()),
                    ],
                  ),
                  8.height,
                  Text("2118 Thornridge Cir. Syracuse, Connecticut 35624", style: secondaryTextStyle()),
                ],
              ),
            ),
            Container(
              color: editTextBackgroundColor,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(16),
              width: context.width(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Payment Method", style: boldTextStyle(size: 18)),
                  8.height,
                  Text("Paid By Paypal Ending **watson@gmail.com", style: secondaryTextStyle()),
                ],
              ),
            ),
            Container(
              color: editTextBackgroundColor,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(16),
              width: context.width(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order Info", style: boldTextStyle(size: 18)),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal", style: secondaryTextStyle()),
                      Text("\$ 59", style: boldTextStyle(color: white, size: 18)),
                    ],
                  ),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping Cost", style: secondaryTextStyle()),
                      Text("\$ 10", style: boldTextStyle(color: white, size: 18)),
                    ],
                  ),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", style: secondaryTextStyle()),
                      Text("\$ 69", style: boldTextStyle(color: white, size: 18)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
