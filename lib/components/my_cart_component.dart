import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class MyCartComponent extends StatefulWidget {
  final GamingModel myCartList;
  final int? index;
  final void Function(int)? onUpdate;

  MyCartComponent({required this.myCartList, this.index, this.onUpdate});

  @override
  _MyCartComponentState createState() => _MyCartComponentState();
}

class _MyCartComponentState extends State<MyCartComponent> {
  String quantityValue = '1';

  int? cartIndex;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    // cartIndex = widget.index;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onUpdate?.call(widget.index!);
      },
      child: Container(
        color: editTextBackgroundColor,
        margin: EdgeInsets.only(bottom: 16),
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
                  commonCachedNetworkImage(widget.myCartList.gameImage.validate(), fit: BoxFit.cover, width: 100, height: 100, radius: 0),
                ],
              ),
            ),
            24.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(widget.myCartList.drawerItemName.validate(), style: boldTextStyle(color: white, size: 18)),
                16.height,
                Row(
                  children: [
                    Text("Colour: ", style: secondaryTextStyle()),
                    Text(widget.myCartList.mainPrice.validate(), style: secondaryTextStyle()),
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
                        items: widget.myCartList.productImage!.map((String jobTitleItems) {
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
                ),
                4.height,
              ],
            ).paddingTop(8)
          ],
        ),
      ),
    );
  }
}
